import 'package:cl_store/cl_store.dart';

class ServerStore implements Store {
  @override
  Future<void> deleteCollection(Collection collection) {
    // TODO: implement deleteCollection
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMedia(CLMedia media) {
    // TODO: implement deleteMedia
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement reader
  StoreReader get reader => throw UnimplementedError();

  @override
  void reloadStore() {
    // TODO: implement reloadStore
  }

  @override
  Future<Collection?> updateCollectionFromMap(Map<String, dynamic> map) {
    // TODO: implement updateCollectionFromMap
    throw UnimplementedError();
  }

  @override
  Future<CLMedia?> updateMediaFromMap(Map<String, dynamic> map) {
    // TODO: implement updateMediaFromMap
    throw UnimplementedError();
  }

  @override
  Future<Collection> upsertCollection(Collection collection) {
    // TODO: implement upsertCollection
    throw UnimplementedError();
  }

  @override
  Future<CLMedia?> upsertMedia(CLMedia media, {List<CLMedia>? parents}) {
    // TODO: implement upsertMedia
    throw UnimplementedError();
  }

  @override
  Stream<List<T?>> storeReaderStream<T>(StoreQuery<T> storeQuery) {
    // TODO: implement storeReaderStream
    throw UnimplementedError();
  }
}
