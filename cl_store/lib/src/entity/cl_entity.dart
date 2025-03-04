abstract class CLEntity {
  bool get isMarkedDeleted;
  bool get isMarkedEditted;
  bool get isMarkedForUpload;

  bool isContentSame(covariant CLEntity other);

  bool get hasServerUID;
  bool isChangedAfter(CLEntity other);
  int? get entityId;

  DateTime? get entityOriginalDate;
  DateTime get entityCreatedDate;
}
