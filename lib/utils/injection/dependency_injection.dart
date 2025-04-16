import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:pixelfield/features/collection/data/data_sources/remote/collection_impl_api.dart';
import 'package:pixelfield/features/collection/data/repositories/collection_repo_impl.dart';
import 'package:pixelfield/features/collection/domain/repositories/abstract_collections_repository.dart';
import 'package:pixelfield/features/collection/domain/use_cases/collections_use_cases.dart';


final sl = GetIt.instance;

Future<void> initInjections() async {
   initArticlesInjections();
}

void initArticlesInjections() {
  sl.registerSingleton<CollectionsImplApi>(CollectionsImplApi());

  sl.registerSingleton<AbstractCollectionsRepository>(
    CollectionsRepositoryImpl(sl<CollectionsImplApi>()),
  );

  sl.registerSingleton<CollectionsUseCase>(
    CollectionsUseCase(sl<AbstractCollectionsRepository>()),
  );
}

