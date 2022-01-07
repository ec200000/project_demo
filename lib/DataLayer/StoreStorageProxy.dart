import 'dart:ui';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:project_demo/DTOs/ProductDTO.dart';
import 'package:project_demo/DTOs/StroreDTO.dart';
import 'package:project_demo/DataLayer/UsersStorageProxy.dart';
import 'package:project_demo/Result/Failure.dart';
import 'package:project_demo/Result/OK.dart';
import 'package:project_demo/Result/ResultInterface.dart';
import 'package:project_demo/models/OnlineStoreModel.dart';
import 'dart:convert';
import 'package:amplify_flutter/amplify.dart';
import 'package:project_demo/models/PhysicalStoreModel.dart';
import 'package:project_demo/models/ProductModel.dart';
import 'package:project_demo/models/StoreOwnerModel.dart';
import 'package:tuple/tuple.dart';

class StoreStorageProxy {
  static final StoreStorageProxy _singleton = StoreStorageProxy._internal();

  factory StoreStorageProxy() {
    return _singleton;
  }

  StoreStorageProxy._internal();

  Future<ResultInterface> openOnlineStore(StoreDTO store) async {
    OnlineStoreModel onlineStoreModel = OnlineStoreModel(
        name: store.name,
        phoneNumber: store.phoneNumber,
        address: store.address,
        categories: jsonEncode(store.categories),
        operationHours: jsonEncode(store.operationHours));
    StoreOwnerModel storeOwner = await UsersStorageProxy().getStoreOwnerState();
    if (storeOwner == null) {
      //the user will now have a store owner state
      storeOwner = StoreOwnerModel(onlineStoreModel: onlineStoreModel);
      await Amplify.DataStore.save(onlineStoreModel);
      await Amplify.DataStore.save(storeOwner);
    } else if (!storeOwner.storeOwnerModelOnlineStoreModelId
        .isEmpty) // already have an online store
    {
      //TODO: write the exception to log
      //throw Exception("User already has online store - only one is allowed!");
      return new Failure(
          "User already has online store - only one is allowed!", "");
    } else //we have a store owner state but not an online store
    {
      UsersStorageProxy().addOnlineStoreToStoreOwnerState(onlineStoreModel);
    }
    return new Ok("open online store succsseded",
        Tuple2<OnlineStoreModel, String>(onlineStoreModel, storeOwner.id));
  }

  //for physical stores only
  Future<String> generateUniqueQRCode() async {
    final image = await QrPainter(
      data: "This is the QRCode for your physical store",
      version: QrVersions.auto,
      gapless: false,
      color: Color(0x000000),
      emptyColor: Color(0xffffff),
    ).toImage(300);
    final bytes = await image.toByteData(format: ImageByteFormat.png);
    return new String.fromCharCodes(bytes.buffer.asUint8List());
  }

  Future<ResultInterface> openPhysicalStore(StoreDTO store) async {
    PhysicalStoreModel physicalStoreModel = PhysicalStoreModel(
        name: store.name,
        phoneNumber: store.phoneNumber,
        address: store.address,
        categories: jsonEncode(store.categories),
        operationHours: jsonEncode(store.operationHours),
        qrCode: await generateUniqueQRCode());
    StoreOwnerModel storeOwner = await UsersStorageProxy().getStoreOwnerState();
    if (storeOwner == null) {
      //the user will now have a store owner state
      StoreOwnerModel storeOwnerModel =
          StoreOwnerModel(physicalStoreModel: physicalStoreModel);
      await Amplify.DataStore.save(physicalStoreModel);
      await Amplify.DataStore.save(storeOwnerModel);
    } else if (!storeOwner.storeOwnerModelPhysicalStoreModelId
        .isEmpty) // already have an physical store
    {
      //TODO: write the exception to log
      return new Failure(
          "User already has physical store - only one is allowed!", "");
    } else //we have a store owner state but not an online store
    {
      UsersStorageProxy().addPhysicalStoreToStoreOwnerState(physicalStoreModel);
    }
    return new Ok("open physical store succsseded",
        Tuple2<PhysicalStoreModel, String>(physicalStoreModel, storeOwner.id));
  }

  Future<OnlineStoreModel> fetchOnlineStore() async {
    StoreOwnerModel storeOwner = await UsersStorageProxy().getStoreOwnerState();
    List<OnlineStoreModel> onlineStores = await Amplify.DataStore.query(
        OnlineStoreModel.classType,
        where: OnlineStoreModel.ID
            .eq(storeOwner.storeOwnerModelOnlineStoreModelId));

    if (onlineStores.isEmpty) return null;
    return onlineStores.first; //only one online store per user
  }

  Future<PhysicalStoreModel> fetchPhysicalStore() async {
    try {
      StoreOwnerModel storeOwner =
          await UsersStorageProxy().getStoreOwnerState();
      List<PhysicalStoreModel> physicalStores = await Amplify.DataStore.query(
          PhysicalStoreModel.classType,
          where: PhysicalStoreModel.ID
              .eq(storeOwner.storeOwnerModelPhysicalStoreModelId));

      if (physicalStores.isEmpty) return null;
      return physicalStores.first; //only one physical store per user
    } on Exception catch (e) {
      // TODO: wtire to log
    }
    return null;
  }

  Future<ResultInterface> createProductForOnlineStore(
      ProductDTO productDTO) async {
    try {
      OnlineStoreModel onlineStoreModel = await fetchOnlineStore();
      if (onlineStoreModel == null) {
        //TODO: write error to log
        return new Failure("no online store exists!", null);
      }
      ProductModel productModel = ProductModel(
          name: productDTO.name,
          imageUrl: productDTO.imageUrl,
          price: productDTO.price,
          categories: jsonEncode(productDTO.categories),
          description: productDTO.description,
          onlinestoremodelID: onlineStoreModel.id);

      onlineStoreModel.productModel.add(productModel);
      OnlineStoreModel updatedOnlineStore = onlineStoreModel.copyWith(
        id: onlineStoreModel.id,
        address: onlineStoreModel.address,
        operationHours: onlineStoreModel.operationHours,
        phoneNumber: onlineStoreModel.phoneNumber,
        categories: onlineStoreModel.categories,
        name: onlineStoreModel.name,
        productModel: onlineStoreModel.productModel,
      );
      await Amplify.DataStore.save(productModel);
      await Amplify.DataStore.save(updatedOnlineStore);
      return new Ok(
          "created product with ID: ${productModel.id} andd added it to the online store: ${onlineStoreModel.id}",
          productModel);
    } on Exception catch (e) {
      // TODO: write to log
      return new Failure(e.toString(), null);
    }
  }
}
