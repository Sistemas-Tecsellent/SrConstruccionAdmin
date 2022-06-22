import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'stores_record.g.dart';

abstract class StoresRecord
    implements Built<StoresRecord, StoresRecordBuilder> {
  static Serializer<StoresRecord> get serializer => _$storesRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get address;

  @nullable
  String get banner;

  @nullable
  BuiltList<String> get categories;

  @nullable
  BuiltList<String> get closedHours;

  @nullable
  BuiltList<String> get enabledDays;

  @nullable
  String get location;

  @nullable
  String get locationCity;

  @nullable
  String get logo;

  @nullable
  LatLng get mapLocation;

  @nullable
  String get name;

  @nullable
  BuiltList<String> get openHours;

  @nullable
  String get owner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StoresRecordBuilder builder) => builder
    ..id = ''
    ..address = ''
    ..banner = ''
    ..categories = ListBuilder()
    ..closedHours = ListBuilder()
    ..enabledDays = ListBuilder()
    ..location = ''
    ..locationCity = ''
    ..logo = ''
    ..name = ''
    ..openHours = ListBuilder()
    ..owner = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stores');

  static Stream<StoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StoresRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StoresRecord._();
  factory StoresRecord([void Function(StoresRecordBuilder) updates]) =
      _$StoresRecord;

  static StoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStoresRecordData({
  String id,
  String address,
  String banner,
  String location,
  String locationCity,
  String logo,
  LatLng mapLocation,
  String name,
  String owner,
}) =>
    serializers.toFirestore(
        StoresRecord.serializer,
        StoresRecord((s) => s
          ..id = id
          ..address = address
          ..banner = banner
          ..categories = null
          ..closedHours = null
          ..enabledDays = null
          ..location = location
          ..locationCity = locationCity
          ..logo = logo
          ..mapLocation = mapLocation
          ..name = name
          ..openHours = null
          ..owner = owner));
