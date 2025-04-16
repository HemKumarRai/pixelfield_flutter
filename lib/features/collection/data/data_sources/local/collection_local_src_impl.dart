import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixelfield/common/constants/constants.dart';
import 'package:pixelfield/features/collection/data/data_sources/local/collection_local_src.dart';

class CollectionLocalSrcImpl implements CollectionLocalSrc {
  @override
  Future<String?> getCollectionList() async {
    final pixelfieldKv = await Hive.openBox(localStorageKey);

    String? response = pixelfieldKv.get("data_cache");

    return response??"";
  }

  @override
  Future<void> saveCollectionList(String response) async {
    final pixelfieldKv = await Hive.openBox(localStorageKey);
    await pixelfieldKv.put('data_cache', response);
  }
}
