part of 'collection_bloc.dart';



abstract class CollectionState {
  const CollectionState();
}

class InitialState extends CollectionState {}


class LoadingGetCollectionsState extends CollectionState {}
class EmptyGetCollectionsState extends CollectionState {}
class NoInternetConnectionState extends CollectionState {}

class ErrorGetCollectionsState extends CollectionState {
  final String errorMsg;

  ErrorGetCollectionsState(this.errorMsg);
}

class SuccessGetCollectionsState extends CollectionState {
  final CollectionListModel collectionListModel;

  SuccessGetCollectionsState(this.collectionListModel);
}