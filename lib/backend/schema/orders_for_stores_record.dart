import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'orders_for_stores_record.g.dart';

abstract class OrdersForStoresRecord
    implements Built<OrdersForStoresRecord, OrdersForStoresRecordBuilder> {
  static Serializer<OrdersForStoresRecord> get serializer =>
      _$ordersForStoresRecordSerializer;

  @nullable
  String get bundleId;

  @nullable
  String get type;

  @nullable
  String get id;

  @nullable
  DateTime get createdDate;

  @nullable
  double get total;

  @nullable
  String get store;

  @nullable
  String get status;

  @nullable
  int get amountOfProducts;

  @nullable
  String get guide;

  @nullable
  String get statusForAdmin;

  @nullable
  bool get isByGuide;

  @nullable
  bool get isSentBySeller;

  @nullable
  bool get isCollectedByAdmin;

  @nullable
  String get deliveredBy;

  @nullable
  String get assignedDeliverer;

  @nullable
  String get shipmentType;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrdersForStoresRecordBuilder builder) =>
      builder
        ..bundleId = ''
        ..type = ''
        ..id = ''
        ..total = 0.0
        ..store = ''
        ..status = ''
        ..amountOfProducts = 0
        ..guide = ''
        ..statusForAdmin = ''
        ..isByGuide = false
        ..isSentBySeller = false
        ..isCollectedByAdmin = false
        ..deliveredBy = ''
        ..assignedDeliverer = ''
        ..shipmentType = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ordersForStores');

  static Stream<OrdersForStoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrdersForStoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrdersForStoresRecord._();
  factory OrdersForStoresRecord(
          [void Function(OrdersForStoresRecordBuilder) updates]) =
      _$OrdersForStoresRecord;

  static OrdersForStoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrdersForStoresRecordData({
  String bundleId,
  String type,
  String id,
  DateTime createdDate,
  double total,
  String store,
  String status,
  int amountOfProducts,
  String guide,
  String statusForAdmin,
  bool isByGuide,
  bool isSentBySeller,
  bool isCollectedByAdmin,
  String deliveredBy,
  String assignedDeliverer,
  String shipmentType,
}) =>
    serializers.toFirestore(
        OrdersForStoresRecord.serializer,
        OrdersForStoresRecord((o) => o
          ..bundleId = bundleId
          ..type = type
          ..id = id
          ..createdDate = createdDate
          ..total = total
          ..store = store
          ..status = status
          ..amountOfProducts = amountOfProducts
          ..guide = guide
          ..statusForAdmin = statusForAdmin
          ..isByGuide = isByGuide
          ..isSentBySeller = isSentBySeller
          ..isCollectedByAdmin = isCollectedByAdmin
          ..deliveredBy = deliveredBy
          ..assignedDeliverer = assignedDeliverer
          ..shipmentType = shipmentType));
