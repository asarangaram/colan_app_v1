import 'package:cl_store/src/entity/cl_entity.dart';
import 'package:meta/meta.dart';

import 'entity/cl_entities.dart';
import 'entity_clmedia/cl_media.dart';
import 'entity_collection/collection.dart';

enum DBQueries {
  // Fetch the complete table!
  collections,
  medias,

  collectionById,
  collectionByLabel,

  collectionsVisible,
  collectionsVisibleNotDeleted,
  collectionsExcludeEmpty,
  collectionsEmpty,
  collectionByIdList,
  collectionOnDevice,
  collectionsToSync,

  mediaById,
  mediaByServerUID,
  mediaAll,
  mediaAllIncludingAux,
  mediaByCollectionId,
  mediaByPath,
  mediaByMD5,
  mediaPinned,
  mediaStaled,
  mediaDeleted,
  mediaByIdList,
  mediaByNoteID,
  mediaDownloadPending,
  previewDownloadPending,

  notesAll,
  notesByMediaId,
  notesOrphan,

  // Raw values
  serverUIDAll,
  mediaOnDevice,

  localMediaAll,
}

abstract class StoreQuery<T> {
  const StoreQuery();
}

abstract class StoreReader {
  Future<T?> read<T>(StoreQuery<T> query);
  Future<CLEntities<T>> readMultiple<T extends CLEntity>(StoreQuery<T> query);

  StoreQuery<T> getQuery<T>(DBQueries query, {List<Object?>? parameters});

  Future<T?> get<T>(DBQueries query, {List<Object?>? parameters}) async {
    final q = getQuery(query, parameters: parameters) as StoreQuery<T>;
    return read(q);
  }

  Future<CLEntities<T>> getMultiple<T extends CLEntity>(
    DBQueries query, {
    List<Object?>? parameters,
  }) async {
    final q = getQuery(query, parameters: parameters) as StoreQuery<T>;
    return readMultiple<T>(q);
  }

  Future<CLEntities<Collection>> get collectionsToSync async =>
      getMultiple(DBQueries.collectionsToSync);

  Future<CLEntities<Collection>> get collectionOnDevice async =>
      getMultiple(DBQueries.collectionOnDevice);

  Future<CLEntities<CLMedia>> get mediaOnDevice async =>
      getMultiple(DBQueries.mediaOnDevice);

  Future<Collection?> getCollectionByID(int id) async =>
      get<Collection>(DBQueries.collectionById, parameters: [id]);

  Future<Collection?> getCollectionByLabel(String label) async =>
      get(DBQueries.collectionByLabel, parameters: [label]);

  Future<Collection?> getCollectionById(int id) async =>
      get(DBQueries.collectionById, parameters: [id]);

  Future<CLMedia?> getMediaByID(int id) async =>
      get(DBQueries.mediaById, parameters: [id]);

  Future<CLEntities<Collection>> getCollectionsByIDList(
    List<int> idList,
  ) async =>
      getMultiple(
        DBQueries.collectionByIdList,
        parameters: ['(${idList.join(', ')})'],
      );

  Future<CLEntities<CLMedia>> getMediasByIDList(List<int> idList) async =>
      getMultiple(
        DBQueries.mediaByIdList,
        parameters: ['(${idList.join(', ')})'],
      );

  Future<CLEntities<CLMedia>> getMediaByCollectionId(int collectionId) async =>
      getMultiple(
        DBQueries.mediaByCollectionId,
        parameters: [collectionId],
      );

  Future<CLEntities<CLMedia>> getNotesByMediaId(int mediaId) async =>
      getMultiple(DBQueries.notesByMediaId, parameters: [mediaId]);

  Future<CLEntities<CLMedia>?> getMediaByNoteId(int noteId) async =>
      getMultiple(DBQueries.mediaByNoteID, parameters: [noteId]);

  Future<CLEntities<Collection>?> getCollectionAll() async =>
      getMultiple(DBQueries.collectionsVisibleNotDeleted);

  Future<CLEntities<CLMedia>> getMediaAll() async =>
      getMultiple(DBQueries.mediaAll);

  Future<CLEntities<CLMedia>> getNotesAll() async =>
      getMultiple(DBQueries.notesAll);

  Future<CLMedia?> getMediaByServerUID(int serverUID) async => get(
        DBQueries.mediaByServerUID,
        parameters: [serverUID],
      );

  Future<CLMedia?> getMediaById(int id) async => get(
        DBQueries.mediaById,
        parameters: [id],
      );

  Future<CLMedia?> getMediaByMD5String(String md5String) async => get(
        DBQueries.mediaByMD5,
        parameters: [md5String],
      );
}

@immutable
abstract class Store {
  const Store(this.reader);
  final StoreReader reader;

  Future<Collection> upsertCollection(Collection collection);
  Future<CLMedia?> upsertMedia(CLMedia media, {List<CLMedia>? parents});

  Future<void> deleteCollection(Collection collection);
  Future<void> deleteMedia(CLMedia media);

  Future<Collection?> updateCollectionFromMap(Map<String, dynamic> map);
  Future<CLMedia?> updateMediaFromMap(Map<String, dynamic> map);

  void reloadStore();
  void dispose();

  //Stream<List<T?>> storeReaderStream<T>(StoreQuery<T> storeQuery);
}
