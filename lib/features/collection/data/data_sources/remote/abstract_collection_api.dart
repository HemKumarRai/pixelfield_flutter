
import 'package:pixelfield/features/collection/domain/model/collection_model.dart';

abstract class AbstractCollectionApi {
  Future<CollectionListModel> getCollections();
}
