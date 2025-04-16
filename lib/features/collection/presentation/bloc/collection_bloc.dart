import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/features/collection/domain/model/collection_model.dart';
import 'package:pixelfield/features/collection/domain/use_cases/collections_use_cases.dart';
import 'package:pixelfield/features/core/network/error/failures.dart';

part 'collection_event.dart';

part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionsUseCase collectionsUseCase;

  CollectionListModel collectionListModel = CollectionListModel();

  CollectionBloc({required this.collectionsUseCase})
      : super(LoadingGetCollectionsState()) {
    on<OnGettingCollectionListEvent>(_onGettingCollectionsEvent);
  }

  FutureOr<void> _onGettingCollectionsEvent(OnGettingCollectionListEvent event,
      Emitter<CollectionState> emitter) async {
    if (event.withLoading) {
      emitter(LoadingGetCollectionsState());
    }
    final result = await collectionsUseCase.call();
    result.fold((l) {
      if (l is NoDataFound) {
        emitter(EmptyGetCollectionsState());
      } else if (l is NoInterNetConnection) {
        emitter(NoInternetConnectionState());
      } else {
        emitter(ErrorGetCollectionsState(l.errorMessage));
      }
    }, (r) {
      collectionListModel = r;
      emitter(SuccessGetCollectionsState(collectionListModel));
    });
  }
}
