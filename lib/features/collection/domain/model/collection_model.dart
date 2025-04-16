import 'package:json_annotation/json_annotation.dart';

part 'collection_model.g.dart';

@JsonSerializable()

class CollectionListModel {
  final List<Collection>? collections;

  CollectionListModel({
    this.collections,
  });

  factory CollectionListModel.fromJson(Map<String, dynamic> json) => _$CollectionListModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionListModelToJson(this);
}

@JsonSerializable()
class Collection {
  final String? id;
  final String? imageUrl;
  final String? name;
  final String? tag;
  final String? license;
  Collection({
    this.id,
    this.imageUrl,
    this.name,
    this.tag,
    this.license,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
