import 'package:dartz/dartz.dart';
import 'package:pixelfield/features/collection/domain/model/collection_model.dart';
import 'package:pixelfield/features/core/network/error/failures.dart';

abstract class AbstractCollectionsRepository {
  Future<Either<Failure,CollectionListModel>> getCollections();
}
