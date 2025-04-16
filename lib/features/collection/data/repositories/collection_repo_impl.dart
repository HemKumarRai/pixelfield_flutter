// import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:pixelfield/features/collection/data/data_sources/local/collection_local_src.dart';
import 'package:pixelfield/features/collection/data/data_sources/local/collection_local_src_impl.dart';
import 'package:pixelfield/features/collection/data/data_sources/remote/collection_impl_api.dart';
import 'package:pixelfield/features/collection/domain/model/collection_model.dart';
import 'package:pixelfield/features/collection/domain/repositories/abstract_collections_repository.dart';
import 'package:pixelfield/features/core/network/error/failures.dart';

class CollectionsRepositoryImpl extends AbstractCollectionsRepository {
  final CollectionsImplApi collectionApi;

  CollectionsRepositoryImpl(this.collectionApi) {
    _localeRepository = CollectionLocalSrcImpl();
  }

  late CollectionLocalSrc _localeRepository;

  @override
  Future<Either<Failure, CollectionListModel>> getCollections() async {
    try {
      bool isConnected = await hasInternetConnection();
      String? savedCollection = await _localeRepository.getCollectionList();
      if ((savedCollection?.isNotEmpty ?? false) && !isConnected) {
        final collectionListModel =
            CollectionListModel.fromJson(jsonDecode(savedCollection!));
        return Right(collectionListModel);
      }
      if (isConnected) {
        final result = await collectionApi.getCollections();
        await _localeRepository.saveCollectionList(jsonEncode(result.toJson()));
        return Right(result);
      } else {
        return const Left(NoInterNetConnection("No Internet Connection"));
      }
    } catch (e) {
      return const Left(NoDataFound("No Data Found", 404));
    }
  }

  Future<bool> hasInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return !(connectivityResult.contains(ConnectivityResult.none));
  }
}
