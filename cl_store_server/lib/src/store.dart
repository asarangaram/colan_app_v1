import 'package:cl_store/cl_store.dart';

class ServerStore implements Store {
  @override
  Future<void> deleteCollection(Collection collection) {
    // TODO(anandas): : implement deleteCollection
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMedia(CLMedia media) {
    // TODO(anandas): : implement deleteMedia
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO(anandas): : implement dispose
  }

  @override
  // TODO(anandas): : implement reader
  StoreReader get reader => throw UnimplementedError();

  @override
  void reloadStore() {
    // TODO(anandas): : implement reloadStore
  }

  @override
  Future<Collection?> updateCollectionFromMap(Map<String, dynamic> map) {
    // TODO(anandas): : implement updateCollectionFromMap
    throw UnimplementedError();
  }

  @override
  Future<CLMedia?> updateMediaFromMap(Map<String, dynamic> map) {
    // TODO(anandas): : implement updateMediaFromMap
    throw UnimplementedError();
  }

  @override
  Future<Collection> upsertCollection(Collection collection) {
    // TODO(anandas): : implement upsertCollection
    throw UnimplementedError();
  }

  @override
  Future<CLMedia?> upsertMedia(CLMedia media, {List<CLMedia>? parents}) {
    // TODO(anandas): : implement upsertMedia
    throw UnimplementedError();
  }

  @override
  Stream<List<T?>> storeReaderStream<T>(StoreQuery<T> storeQuery) {
    // TODO(anandas): : implement storeReaderStream
    throw UnimplementedError();
  }
}
