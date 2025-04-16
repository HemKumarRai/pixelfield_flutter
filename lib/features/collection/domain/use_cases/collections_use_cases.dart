import 'package:dartz/dartz.dart';
import 'package:pixelfield/features/collection/domain/model/collection_model.dart';
import 'package:pixelfield/features/collection/domain/repositories/abstract_collections_repository.dart';
import 'package:pixelfield/features/core/network/error/failures.dart';
import 'package:pixelfield/utils/usecases/usecases.dart';

class CollectionsUseCase extends UseCase<CollectionListModel> {
  final AbstractCollectionsRepository repository;

  CollectionsUseCase(this.repository);

  @override
  Future<Either<Failure, CollectionListModel>> call() async {
    final result = await repository.getCollections();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
