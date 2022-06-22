import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'orders_for_clients_record.g.dart';

abstract class OrdersForClientsRecord
    implements Built<OrdersForClientsRecord, OrdersForClientsRecordBuilder> {
  static Serializer<OrdersForClientsRecord> get serializer =>
      _$ordersForClientsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get type;

  @nullable
  String get customerId;

  @nullable
  String get customerAddress;

  @nullable
  String get customerName;

  @nullable
  String get customerPhone;

  @nullable
  String get bundleId;

  @nullable
  DateTime get createdDate;

  @nullable
  String get deliverDate;

  @nullable
  String get status;

  @nullable
  double get subtotal;

  @nullable
  double get total;

  @nullable
  int get amountOfProducts;

  @nullable
  double get shipmentPrice;

  @nullable
  String get shipmentTimeText;

  @nullable
  BuiltList<String> get totalSuppliersIds;

  @nullable
  int get totalWeights;

  @nullable
  String get deliverer;

  @nullable
  String get parcelName;

  @nullable
  String get parcelGuide;

  @nullable
  String get parcelLink;

  @nullable
  String get statusForClient;

  @nullable
  String get parceImage;

  @nullable
  int get amountOfSuppliers;

  @nullable
  String get store;

  @nullable
  String get assignedDeliverer;

  @nullable
  bool get isFromSellerWiseOrder;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OrdersForClientsRecordBuilder builder) =>
      builder
        ..id = ''
        ..type = ''
        ..customerId = ''
        ..customerAddress = ''
        ..customerName = ''
        ..customerPhone = ''
        ..bundleId = ''
        ..deliverDate = ''
        ..status = ''
        ..subtotal = 0.0
        ..total = 0.0
        ..amountOfProducts = 0
        ..shipmentPrice = 0.0
        ..shipmentTimeText = ''
        ..totalSuppliersIds = ListBuilder()
        ..totalWeights = 0
        ..deliverer = ''
        ..parcelName = ''
        ..parcelGuide = ''
        ..parcelLink = ''
        ..statusForClient = ''
        ..parceImage = ''
        ..amountOfSuppliers = 0
        ..store = ''
        ..assignedDeliverer = ''
        ..isFromSellerWiseOrder = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ordersForClients');

  static Stream<OrdersForClientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrdersForClientsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrdersForClientsRecord._();
  factory OrdersForClientsRecord(
          [void Function(OrdersForClientsRecordBuilder) updates]) =
      _$OrdersForClientsRecord;

  static OrdersForClientsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrdersForClientsRecordData({
  String id,
  String type,
  String customerId,
  String customerAddress,
  String customerName,
  String customerPhone,
  String bundleId,
  DateTime createdDate,
  String deliverDate,
  String status,
  double subtotal,
  double total,
  int amountOfProducts,
  double shipmentPrice,
  String shipmentTimeText,
  int totalWeights,
  String deliverer,
  String parcelName,
  String parcelGuide,
  String parcelLink,
  String statusForClient,
  String parceImage,
  int amountOfSuppliers,
  String store,
  String assignedDeliverer,
  bool isFromSellerWiseOrder,
}) =>
    serializers.toFirestore(
        OrdersForClientsRecord.serializer,
        OrdersForClientsRecord((o) => o
          ..id = id
          ..type = type
          ..customerId = customerId
          ..customerAddress = customerAddress
          ..customerName = customerName
          ..customerPhone = customerPhone
          ..bundleId = bundleId
          ..createdDate = createdDate
          ..deliverDate = deliverDate
          ..status = status
          ..subtotal = subtotal
          ..total = total
          ..amountOfProducts = amountOfProducts
          ..shipmentPrice = shipmentPrice
          ..shipmentTimeText = shipmentTimeText
          ..totalSuppliersIds = null
          ..totalWeights = totalWeights
          ..deliverer = deliverer
          ..parcelName = parcelName
          ..parcelGuide = parcelGuide
          ..parcelLink = parcelLink
          ..statusForClient = statusForClient
          ..parceImage = parceImage
          ..amountOfSuppliers = amountOfSuppliers
          ..store = store
          ..assignedDeliverer = assignedDeliverer
          ..isFromSellerWiseOrder = isFromSellerWiseOrder));
