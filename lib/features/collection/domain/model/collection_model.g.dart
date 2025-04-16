// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionListModel _$CollectionListModelFromJson(Map<String, dynamic> json) =>
    CollectionListModel(
      collections: (json['collections'] as List<dynamic>?)
          ?.map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionListModelToJson(
        CollectionListModel instance) =>
    <String, dynamic>{
      'collections': instance.collections,
    };

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      tag: json['tag'] as String?,
      license: json['license'] as String?,
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'tag': instance.tag,
      'license': instance.license,
    };
