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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the ShoppingBagModel type in your schema. */
@immutable
class ShoppingBagModel extends Model {
  static const classType = const _ShoppingBagModelModelType();
  final String id;
  final String productsAndQuantity;
  final String usermodelID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const ShoppingBagModel._internal(
      {@required this.id, this.productsAndQuantity, this.usermodelID});

  factory ShoppingBagModel(
      {String id, String productsAndQuantity, String usermodelID}) {
    return ShoppingBagModel._internal(
        id: id == null ? UUID.getUUID() : id,
        productsAndQuantity: productsAndQuantity,
        usermodelID: usermodelID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShoppingBagModel &&
        id == other.id &&
        productsAndQuantity == other.productsAndQuantity &&
        usermodelID == other.usermodelID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ShoppingBagModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("productsAndQuantity=" + "$productsAndQuantity" + ", ");
    buffer.write("usermodelID=" + "$usermodelID");
    buffer.write("}");

    return buffer.toString();
  }

  ShoppingBagModel copyWith(
      {String id, String productsAndQuantity, String usermodelID}) {
    return ShoppingBagModel(
        id: id ?? this.id,
        productsAndQuantity: productsAndQuantity ?? this.productsAndQuantity,
        usermodelID: usermodelID ?? this.usermodelID);
  }

  ShoppingBagModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        productsAndQuantity = json['productsAndQuantity'],
        usermodelID = json['usermodelID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'productsAndQuantity': productsAndQuantity,
        'usermodelID': usermodelID
      };

  static final QueryField ID = QueryField(fieldName: "shoppingBagModel.id");
  static final QueryField PRODUCTSANDQUANTITY =
      QueryField(fieldName: "productsAndQuantity");
  static final QueryField USERMODELID = QueryField(fieldName: "usermodelID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ShoppingBagModel";
    modelSchemaDefinition.pluralName = "ShoppingBagModels";

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
        key: ShoppingBagModel.PRODUCTSANDQUANTITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ShoppingBagModel.USERMODELID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _ShoppingBagModelModelType extends ModelType<ShoppingBagModel> {
  const _ShoppingBagModelModelType();

  @override
  ShoppingBagModel fromJson(Map<String, dynamic> jsonData) {
    return ShoppingBagModel.fromJson(jsonData);
  }
}
