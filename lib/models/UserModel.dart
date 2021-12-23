/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the UserModel type in your schema. */
@immutable
class UserModel extends Model {
  static const classType = const _UserModelModelType();
  final String id;
  final String email;
  final String name;
  final String imageUrl;
  final String creditCards;
  final String bankAccount;
  final List<ShoppingBagModel> ShoppingBagModels;
  final List<StoreOwnerModel> StoreOwnerModel;
  final double cashBackMoney;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const UserModel._internal(
      {@required this.id,
      @required this.email,
      @required this.name,
      this.imageUrl,
      this.creditCards,
      this.bankAccount,
      this.ShoppingBagModels,
      this.StoreOwnerModel,
      this.cashBackMoney});

  factory UserModel(
      {String id,
      @required String email,
      @required String name,
      String imageUrl,
      String creditCards,
      String bankAccount,
      List<ShoppingBagModel> ShoppingBagModels,
      List<StoreOwnerModel> StoreOwnerModel,
      double cashBackMoney}) {
    return UserModel._internal(
        id: id == null ? UUID.getUUID() : id,
        email: email,
        name: name,
        imageUrl: imageUrl,
        creditCards: creditCards,
        bankAccount: bankAccount,
        ShoppingBagModels: ShoppingBagModels != null
            ? List<ShoppingBagModel>.unmodifiable(ShoppingBagModels)
            : ShoppingBagModels,
        StoreOwnerModel: StoreOwnerModel != null
            ? List<StoreOwnerModel>.unmodifiable(StoreOwnerModel)
            : StoreOwnerModel,
        cashBackMoney: cashBackMoney);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        id == other.id &&
        email == other.email &&
        name == other.name &&
        imageUrl == other.imageUrl &&
        creditCards == other.creditCards &&
        bankAccount == other.bankAccount &&
        DeepCollectionEquality()
            .equals(ShoppingBagModels, other.ShoppingBagModels) &&
        DeepCollectionEquality()
            .equals(StoreOwnerModel, other.StoreOwnerModel) &&
        cashBackMoney == other.cashBackMoney;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("imageUrl=" + "$imageUrl" + ", ");
    buffer.write("creditCards=" + "$creditCards" + ", ");
    buffer.write("bankAccount=" + "$bankAccount" + ", ");
    buffer.write("cashBackMoney=" +
        (cashBackMoney != null ? cashBackMoney.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  UserModel copyWith(
      {String id,
      String email,
      String name,
      String imageUrl,
      String creditCards,
      String bankAccount,
      List<ShoppingBagModel> ShoppingBagModels,
      List<StoreOwnerModel> StoreOwnerModel,
      double cashBackMoney}) {
    return UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        creditCards: creditCards ?? this.creditCards,
        bankAccount: bankAccount ?? this.bankAccount,
        ShoppingBagModels: ShoppingBagModels ?? this.ShoppingBagModels,
        StoreOwnerModel: StoreOwnerModel ?? this.StoreOwnerModel,
        cashBackMoney: cashBackMoney ?? this.cashBackMoney);
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        name = json['name'],
        imageUrl = json['imageUrl'],
        creditCards = json['creditCards'],
        bankAccount = json['bankAccount'],
        ShoppingBagModels = json['ShoppingBagModels'] is List
            ? (json['ShoppingBagModels'] as List)
                .map((e) =>
                    ShoppingBagModel.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        StoreOwnerModel = json['StoreOwnerModel'] is List
            ? (json['StoreOwnerModel'] as List)
                .map((e) =>
                    StoreOwnerModel.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        cashBackMoney = (json['cashBackMoney'] as num)?.toDouble();

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'imageUrl': imageUrl,
        'creditCards': creditCards,
        'bankAccount': bankAccount,
        'ShoppingBagModels':
            ShoppingBagModels?.map((ShoppingBagModel? e) => e?.toJson())
                .toList(),
        'StoreOwnerModel':
            StoreOwnerModel?.map((StoreOwnerModel? e) => e?.toJson()).toList(),
        'cashBackMoney': cashBackMoney
      };

  static final QueryField ID = QueryField(fieldName: "userModel.id");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField IMAGEURL = QueryField(fieldName: "imageUrl");
  static final QueryField CREDITCARDS = QueryField(fieldName: "creditCards");
  static final QueryField BANKACCOUNT = QueryField(fieldName: "bankAccount");
  static final QueryField SHOPPINGBAGMODELS = QueryField(
      fieldName: "ShoppingBagModels",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (ShoppingBagModel).toString()));
  static final QueryField STOREOWNERMODEL = QueryField(
      fieldName: "StoreOwnerModel",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (StoreOwnerModel).toString()));
  static final QueryField CASHBACKMONEY =
      QueryField(fieldName: "cashBackMoney");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserModel";
    modelSchemaDefinition.pluralName = "UserModels";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserModel.EMAIL,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserModel.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserModel.IMAGEURL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserModel.CREDITCARDS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserModel.BANKACCOUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: UserModel.SHOPPINGBAGMODELS,
        isRequired: false,
        ofModelName: (ShoppingBagModel).toString(),
        associatedKey: ShoppingBagModel.USERMODELID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: UserModel.STOREOWNERMODEL,
        isRequired: false,
        ofModelName: (StoreOwnerModel).toString(),
        associatedKey: StoreOwnerModel.USERMODELID));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserModel.CASHBACKMONEY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));
  });
}

class _UserModelModelType extends ModelType<UserModel> {
  const _UserModelModelType();

  @override
  UserModel fromJson(Map<String, dynamic> jsonData) {
    return UserModel.fromJson(jsonData);
  }
}
