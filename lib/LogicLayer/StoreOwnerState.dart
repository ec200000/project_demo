import 'dart:convert';

import 'package:project_demo/models/OnlineStoreModel.dart';
import 'package:project_demo/models/PhysicalStoreModel.dart';
import 'package:project_demo/providers/online_store.dart';
import 'package:project_demo/providers/physical_store.dart';

class StoreOwnerState {
  String _storeOwnerID;
  String get getStoreOwnerID => _storeOwnerID;
  void setStoreOwnerID(id) => _storeOwnerID = id;

  StoreOwnerState(this._storeOwnerID);

  OnlineStore _onlineStore;
  PhysicalStore _physicalStore;

  void setOnlineStore(OnlineStoreModel onlineStoreModel) {
    var categories = jsonDecode(onlineStoreModel.categories);
    var operationHours = jsonDecode(onlineStoreModel.operationHours);
    _onlineStore = new OnlineStore(
        onlineStoreModel.name,
        onlineStoreModel.phoneNumber,
        onlineStoreModel.address,
        categories,
        operationHours);
  }

  void setPhysicalStore(PhysicalStoreModel physicalStoreModel) {
    var categories = jsonDecode(physicalStoreModel.categories);
    var operationHours = jsonDecode(physicalStoreModel.operationHours);
    _physicalStore = new PhysicalStore(
        name: physicalStoreModel.name,
        phoneNumber: physicalStoreModel.phoneNumber,
        address: physicalStoreModel.address,
        categories: categories,
        operationHours: operationHours,
        qrCode: physicalStoreModel.qrCode);
  }
}
