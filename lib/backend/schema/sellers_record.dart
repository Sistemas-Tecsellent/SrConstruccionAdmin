import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sellers_record.g.dart';

abstract class SellersRecord
    implements Built<SellersRecord, SellersRecordBuilder> {
  static Serializer<SellersRecord> get serializer => _$sellersRecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get sellerId;

  @nullable
  String get storeId;

  @nullable
  bool get isApproved;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SellersRecordBuilder builder) => builder
    ..uid = ''
    ..sellerId = ''
    ..storeId = ''
    ..isApproved = false
    ..email = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sellers');

  static Stream<SellersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SellersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SellersRecord._();
  factory SellersRecord([void Function(SellersRecordBuilder) updates]) =
      _$SellersRecord;

  static SellersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSellersRecordData({
  String uid,
  String sellerId,
  String storeId,
  bool isApproved,
  String email,
}) =>
    serializers.toFirestore(
        SellersRecord.serializer,
        SellersRecord((s) => s
          ..uid = uid
          ..sellerId = sellerId
          ..storeId = storeId
          ..isApproved = isApproved
          ..email = email));
