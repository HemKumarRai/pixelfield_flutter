part of 'collection_bloc.dart';

abstract class CollectionEvent {
  const CollectionEvent();
}

class OnGettingCollectionListEvent extends CollectionEvent {
  final bool withLoading;

  OnGettingCollectionListEvent( {this.withLoading = true});
}