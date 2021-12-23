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

/** This is an auto generated class representing the StoreOwnerModel type in your schema. */
@immutable
class StoreOwnerModel extends Model {
  static const classType = const _StoreOwnerModelModelType();
  final String id;
  final List<OnlineStoreModel> OnlineStoreModel;
  final List<PhysicalStoreModel> PhysicalStoreModel;
  final String usermodelID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const StoreOwnerModel._internal(
      {@required this.id,
      this.OnlineStoreModel,
      this.PhysicalStoreModel,
      this.usermodelID});

  factory StoreOwnerModel(
      {String id,
      List<OnlineStoreModel> OnlineStoreModel,
      List<PhysicalStoreModel> PhysicalStoreModel,
      String usermodelID}) {
    return StoreOwnerModel._internal(
        id: id == null ? UUID.getUUID() : id,
        OnlineStoreModel: OnlineStoreModel != null
            ? List<OnlineStoreModel>.unmodifiable(OnlineStoreModel)
            : OnlineStoreModel,
        PhysicalStoreModel: PhysicalStoreModel != null
            ? List<PhysicalStoreModel>.unmodifiable(PhysicalStoreModel)
            : PhysicalStoreModel,
        usermodelID: usermodelID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreOwnerModel &&
        id == other.id &&
        DeepCollectionEquality()
            .equals(OnlineStoreModel, other.OnlineStoreModel) &&
        DeepCollectionEquality()
            .equals(PhysicalStoreModel, other.PhysicalStoreModel) &&
        usermodelID == other.usermodelID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("StoreOwnerModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("usermodelID=" + "$usermodelID");
    buffer.write("}");

    return buffer.toString();
  }

  StoreOwnerModel copyWith(
      {String id,
      List<OnlineStoreModel> OnlineStoreModel,
      List<PhysicalStoreModel> PhysicalStoreModel,
      String usermodelID}) {
    return StoreOwnerModel(
        id: id ?? this.id,
        OnlineStoreModel: OnlineStoreModel ?? this.OnlineStoreModel,
        PhysicalStoreModel: PhysicalStoreModel ?? this.PhysicalStoreModel,
        usermodelID: usermodelID ?? this.usermodelID);
  }

  StoreOwnerModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        OnlineStoreModel = json['OnlineStoreModel'] is List
            ? (json['OnlineStoreModel'] as List)
                .map((e) =>
                    OnlineStoreModel.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        PhysicalStoreModel = json['PhysicalStoreModel'] is List
            ? (json['PhysicalStoreModel'] as List)
                .map((e) => PhysicalStoreModel.fromJson(
                    new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        usermodelID = json['usermodelID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'OnlineStoreModel':
            OnlineStoreModel?.map((OnlineStoreModel? e) => e?.toJson())
                .toList(),
        'PhysicalStoreModel':
            PhysicalStoreModel?.map((PhysicalStoreModel? e) => e?.toJson())
                .toList(),
        'usermodelID': usermodelID
      };

  static final QueryField ID = QueryField(fieldName: "storeOwnerModel.id");
  static final QueryField ONLINESTOREMODEL = QueryField(
      fieldName: "OnlineStoreModel",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (OnlineStoreModel).toString()));
  static final QueryField PHYSICALSTOREMODEL = QueryField(
      fieldName: "PhysicalStoreModel",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (PhysicalStoreModel).toString()));
  static final QueryField USERMODELID = QueryField(fieldName: "usermodelID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "StoreOwnerModel";
    modelSchemaDefinition.pluralName = "StoreOwnerModels";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: StoreOwnerModel.ONLINESTOREMODEL,
        isRequired: false,
        ofModelName: (OnlineStoreModel).toString(),
        associatedKey: OnlineStoreModel.STOREOWNERMODELID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: StoreOwnerModel.PHYSICALSTOREMODEL,
        isRequired: false,
        ofModelName: (PhysicalStoreModel).toString(),
        associatedKey: PhysicalStoreModel.STOREOWNERMODELID));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: StoreOwnerModel.USERMODELID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _StoreOwnerModelModelType extends ModelType<StoreOwnerModel> {
  const _StoreOwnerModelModelType();

  @override
  StoreOwnerModel fromJson(Map<String, dynamic> jsonData) {
    return StoreOwnerModel.fromJson(jsonData);
  }
}
