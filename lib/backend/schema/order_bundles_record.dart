import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_bundles_record.g.dart';

abstract class OrderBundlesRecord
    implements Built<OrderBundlesRecord, OrderBundlesRecordBuilder> {
  static Serializer<OrderBundlesRecord> get serializer =>
      _$orderBundlesRecordSerializer;

  @nullable
  String get id;

  @nullable
  DateTime get createdDate;

  @nullable
  String get bundleTotal;

  @nullable
  String get status;

  @nullable
  String get customerEmail;

  @nullable
  String get expressStatus;

  @nullable
  String get normalStatus;

  @nullable
  String get largePeriodOrderStatus;

  @nullable
  String get serviceStatus;

  @nullable
  String get paymentMethod;

  @nullable
  String get customerName;

  @nullable
  String get customerPhone;

  @nullable
  String get customerAddress;

  @nullable
  String get bundleSubtotal;

  @nullable
  String get bundleShipmentPrice;

  @nullable
  int get ordersAmount;

  @nullable
  String get owner;

  @nullable
  String get normalOrderId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrderBundlesRecordBuilder builder) => builder
    ..id = ''
    ..bundleTotal = ''
    ..status = ''
    ..customerEmail = ''
    ..expressStatus = ''
    ..normalStatus = ''
    ..largePeriodOrderStatus = ''
    ..serviceStatus = ''
    ..paymentMethod = ''
    ..customerName = ''
    ..customerPhone = ''
    ..customerAddress = ''
    ..bundleSubtotal = ''
    ..bundleShipmentPrice = ''
    ..ordersAmount = 0
    ..owner = ''
    ..normalOrderId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orderBundles');

  static Stream<OrderBundlesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrderBundlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrderBundlesRecord._();
  factory OrderBundlesRecord(
          [void Function(OrderBundlesRecordBuilder) updates]) =
      _$OrderBundlesRecord;

  static OrderBundlesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrderBundlesRecordData({
  String id,
  DateTime createdDate,
  String bundleTotal,
  String status,
  String customerEmail,
  String expressStatus,
  String normalStatus,
  String largePeriodOrderStatus,
  String serviceStatus,
  String paymentMethod,
  String customerName,
  String customerPhone,
  String customerAddress,
  String bundleSubtotal,
  String bundleShipmentPrice,
  int ordersAmount,
  String owner,
  String normalOrderId,
}) =>
    serializers.toFirestore(
        OrderBundlesRecord.serializer,
        OrderBundlesRecord((o) => o
          ..id = id
          ..createdDate = createdDate
          ..bundleTotal = bundleTotal
          ..status = status
          ..customerEmail = customerEmail
          ..expressStatus = expressStatus
          ..normalStatus = normalStatus
          ..largePeriodOrderStatus = largePeriodOrderStatus
          ..serviceStatus = serviceStatus
          ..paymentMethod = paymentMethod
          ..customerName = customerName
          ..customerPhone = customerPhone
          ..customerAddress = customerAddress
          ..bundleSubtotal = bundleSubtotal
          ..bundleShipmentPrice = bundleShipmentPrice
          ..ordersAmount = ordersAmount
          ..owner = owner
          ..normalOrderId = normalOrderId));
