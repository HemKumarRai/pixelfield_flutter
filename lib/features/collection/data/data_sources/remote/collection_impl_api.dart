import 'dart:convert';

import 'package:pixelfield/features/collection/data/data_sources/remote/abstract_collection_api.dart';
import 'package:pixelfield/features/collection/domain/model/collection_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class CollectionsImplApi extends AbstractCollectionApi {
  @override
  Future<CollectionListModel> getCollections() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final result = await rootBundle.loadString('assets/json/collection.json');
      return CollectionListModel.fromJson(jsonDecode(result));
    } catch (e) {
      return CollectionListModel();
    }
  }
}
