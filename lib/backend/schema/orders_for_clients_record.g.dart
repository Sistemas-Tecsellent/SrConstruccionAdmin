// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_for_clients_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrdersForClientsRecord> _$ordersForClientsRecordSerializer =
    new _$OrdersForClientsRecordSerializer();

class _$OrdersForClientsRecordSerializer
    implements StructuredSerializer<OrdersForClientsRecord> {
  @override
  final Iterable<Type> types = const [
    OrdersForClientsRecord,
    _$OrdersForClientsRecord
  ];
  @override
  final String wireName = 'OrdersForClientsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, OrdersForClientsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerId;
    if (value != null) {
      result
        ..add('customerId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerAddress;
    if (value != null) {
      result
        ..add('customerAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerName;
    if (value != null) {
      result
        ..add('customerName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customerPhone;
    if (value != null) {
      result
        ..add('customerPhone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bundleId;
    if (value != null) {
      result
        ..add('bundleId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.deliverDate;
    if (value != null) {
      result
        ..add('deliverDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.subtotal;
    if (value != null) {
      result
        ..add('subtotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.amountOfProducts;
    if (value != null) {
      result
        ..add('amountOfProducts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.shipmentPrice;
    if (value != null) {
      result
        ..add('shipmentPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.shipmentTimeText;
    if (value != null) {
      result
        ..add('shipmentTimeText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalSuppliersIds;
    if (value != null) {
      result
        ..add('totalSuppliersIds')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.totalWeights;
    if (value != null) {
      result
        ..add('totalWeights')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.deliverer;
    if (value != null) {
      result
        ..add('deliverer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parcelName;
    if (value != null) {
      result
        ..add('parcelName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parcelGuide;
    if (value != null) {
      result
        ..add('parcelGuide')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parcelLink;
    if (value != null) {
      result
        ..add('parcelLink')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statusForClient;
    if (value != null) {
      result
        ..add('statusForClient')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parceImage;
    if (value != null) {
      result
        ..add('parceImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amountOfSuppliers;
    if (value != null) {
      result
        ..add('amountOfSuppliers')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.store;
    if (value != null) {
      result
        ..add('store')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.assignedDeliverer;
    if (value != null) {
      result
        ..add('assignedDeliverer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isFromSellerWiseOrder;
    if (value != null) {
      result
        ..add('isFromSellerWiseOrder')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  OrdersForClientsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrdersForClientsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerId':
          result.customerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerAddress':
          result.customerAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerName':
          result.customerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerPhone':
          result.customerPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bundleId':
          result.bundleId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'deliverDate':
          result.deliverDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subtotal':
          result.subtotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'amountOfProducts':
          result.amountOfProducts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'shipmentPrice':
          result.shipmentPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'shipmentTimeText':
          result.shipmentTimeText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalSuppliersIds':
          result.totalSuppliersIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'totalWeights':
          result.totalWeights = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deliverer':
          result.deliverer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parcelName':
          result.parcelName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parcelGuide':
          result.parcelGuide = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parcelLink':
          result.parcelLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'statusForClient':
          result.statusForClient = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parceImage':
          result.parceImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amountOfSuppliers':
          result.amountOfSuppliers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'store':
          result.store = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assignedDeliverer':
          result.assignedDeliverer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isFromSellerWiseOrder':
          result.isFromSellerWiseOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$OrdersForClientsRecord extends OrdersForClientsRecord {
  @override
  final String id;
  @override
  final String type;
  @override
  final String customerId;
  @override
  final String customerAddress;
  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String bundleId;
  @override
  final DateTime createdDate;
  @override
  final String deliverDate;
  @override
  final String status;
  @override
  final double subtotal;
  @override
  final double total;
  @override
  final int amountOfProducts;
  @override
  final double shipmentPrice;
  @override
  final String shipmentTimeText;
  @override
  final BuiltList<String> totalSuppliersIds;
  @override
  final int totalWeights;
  @override
  final String deliverer;
  @override
  final String parcelName;
  @override
  final String parcelGuide;
  @override
  final String parcelLink;
  @override
  final String statusForClient;
  @override
  final String parceImage;
  @override
  final int amountOfSuppliers;
  @override
  final String store;
  @override
  final String assignedDeliverer;
  @override
  final bool isFromSellerWiseOrder;
  @override
  final DocumentReference<Object> reference;

  factory _$OrdersForClientsRecord(
          [void Function(OrdersForClientsRecordBuilder) updates]) =>
      (new OrdersForClientsRecordBuilder()..update(updates)).build();

  _$OrdersForClientsRecord._(
      {this.id,
      this.type,
      this.customerId,
      this.customerAddress,
      this.customerName,
      this.customerPhone,
      this.bundleId,
      this.createdDate,
      this.deliverDate,
      this.status,
      this.subtotal,
      this.total,
      this.amountOfProducts,
      this.shipmentPrice,
      this.shipmentTimeText,
      this.totalSuppliersIds,
      this.totalWeights,
      this.deliverer,
      this.parcelName,
      this.parcelGuide,
      this.parcelLink,
      this.statusForClient,
      this.parceImage,
      this.amountOfSuppliers,
      this.store,
      this.assignedDeliverer,
      this.isFromSellerWiseOrder,
      this.reference})
      : super._();

  @override
  OrdersForClientsRecord rebuild(
          void Function(OrdersForClientsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersForClientsRecordBuilder toBuilder() =>
      new OrdersForClientsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrdersForClientsRecord &&
        id == other.id &&
        type == other.type &&
        customerId == other.customerId &&
        customerAddress == other.customerAddress &&
        customerName == other.customerName &&
        customerPhone == other.customerPhone &&
        bundleId == other.bundleId &&
        createdDate == other.createdDate &&
        deliverDate == other.deliverDate &&
        status == other.status &&
        subtotal == other.subtotal &&
        total == other.total &&
        amountOfProducts == other.amountOfProducts &&
        shipmentPrice == other.shipmentPrice &&
        shipmentTimeText == other.shipmentTimeText &&
        totalSuppliersIds == other.totalSuppliersIds &&
        totalWeights == other.totalWeights &&
        deliverer == other.deliverer &&
        parcelName == other.parcelName &&
        parcelGuide == other.parcelGuide &&
        parcelLink == other.parcelLink &&
        statusForClient == other.statusForClient &&
        parceImage == other.parceImage &&
        amountOfSuppliers == other.amountOfSuppliers &&
        store == other.store &&
        assignedDeliverer == other.assignedDeliverer &&
        isFromSellerWiseOrder == other.isFromSellerWiseOrder &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, id.hashCode), type.hashCode), customerId.hashCode), customerAddress.hashCode), customerName.hashCode), customerPhone.hashCode), bundleId.hashCode), createdDate.hashCode), deliverDate.hashCode),
                                                                                status.hashCode),
                                                                            subtotal.hashCode),
                                                                        total.hashCode),
                                                                    amountOfProducts.hashCode),
                                                                shipmentPrice.hashCode),
                                                            shipmentTimeText.hashCode),
                                                        totalSuppliersIds.hashCode),
                                                    totalWeights.hashCode),
                                                deliverer.hashCode),
                                            parcelName.hashCode),
                                        parcelGuide.hashCode),
                                    parcelLink.hashCode),
                                statusForClient.hashCode),
                            parceImage.hashCode),
                        amountOfSuppliers.hashCode),
                    store.hashCode),
                assignedDeliverer.hashCode),
            isFromSellerWiseOrder.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrdersForClientsRecord')
          ..add('id', id)
          ..add('type', type)
          ..add('customerId', customerId)
          ..add('customerAddress', customerAddress)
          ..add('customerName', customerName)
          ..add('customerPhone', customerPhone)
          ..add('bundleId', bundleId)
          ..add('createdDate', createdDate)
          ..add('deliverDate', deliverDate)
          ..add('status', status)
          ..add('subtotal', subtotal)
          ..add('total', total)
          ..add('amountOfProducts', amountOfProducts)
          ..add('shipmentPrice', shipmentPrice)
          ..add('shipmentTimeText', shipmentTimeText)
          ..add('totalSuppliersIds', totalSuppliersIds)
          ..add('totalWeights', totalWeights)
          ..add('deliverer', deliverer)
          ..add('parcelName', parcelName)
          ..add('parcelGuide', parcelGuide)
          ..add('parcelLink', parcelLink)
          ..add('statusForClient', statusForClient)
          ..add('parceImage', parceImage)
          ..add('amountOfSuppliers', amountOfSuppliers)
          ..add('store', store)
          ..add('assignedDeliverer', assignedDeliverer)
          ..add('isFromSellerWiseOrder', isFromSellerWiseOrder)
          ..add('reference', reference))
        .toString();
  }
}

class OrdersForClientsRecordBuilder
    implements Builder<OrdersForClientsRecord, OrdersForClientsRecordBuilder> {
  _$OrdersForClientsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _customerId;
  String get customerId => _$this._customerId;
  set customerId(String customerId) => _$this._customerId = customerId;

  String _customerAddress;
  String get customerAddress => _$this._customerAddress;
  set customerAddress(String customerAddress) =>
      _$this._customerAddress = customerAddress;

  String _customerName;
  String get customerName => _$this._customerName;
  set customerName(String customerName) => _$this._customerName = customerName;

  String _customerPhone;
  String get customerPhone => _$this._customerPhone;
  set customerPhone(String customerPhone) =>
      _$this._customerPhone = customerPhone;

  String _bundleId;
  String get bundleId => _$this._bundleId;
  set bundleId(String bundleId) => _$this._bundleId = bundleId;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  String _deliverDate;
  String get deliverDate => _$this._deliverDate;
  set deliverDate(String deliverDate) => _$this._deliverDate = deliverDate;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  double _subtotal;
  double get subtotal => _$this._subtotal;
  set subtotal(double subtotal) => _$this._subtotal = subtotal;

  double _total;
  double get total => _$this._total;
  set total(double total) => _$this._total = total;

  int _amountOfProducts;
  int get amountOfProducts => _$this._amountOfProducts;
  set amountOfProducts(int amountOfProducts) =>
      _$this._amountOfProducts = amountOfProducts;

  double _shipmentPrice;
  double get shipmentPrice => _$this._shipmentPrice;
  set shipmentPrice(double shipmentPrice) =>
      _$this._shipmentPrice = shipmentPrice;

  String _shipmentTimeText;
  String get shipmentTimeText => _$this._shipmentTimeText;
  set shipmentTimeText(String shipmentTimeText) =>
      _$this._shipmentTimeText = shipmentTimeText;

  ListBuilder<String> _totalSuppliersIds;
  ListBuilder<String> get totalSuppliersIds =>
      _$this._totalSuppliersIds ??= new ListBuilder<String>();
  set totalSuppliersIds(ListBuilder<String> totalSuppliersIds) =>
      _$this._totalSuppliersIds = totalSuppliersIds;

  int _totalWeights;
  int get totalWeights => _$this._totalWeights;
  set totalWeights(int totalWeights) => _$this._totalWeights = totalWeights;

  String _deliverer;
  String get deliverer => _$this._deliverer;
  set deliverer(String deliverer) => _$this._deliverer = deliverer;

  String _parcelName;
  String get parcelName => _$this._parcelName;
  set parcelName(String parcelName) => _$this._parcelName = parcelName;

  String _parcelGuide;
  String get parcelGuide => _$this._parcelGuide;
  set parcelGuide(String parcelGuide) => _$this._parcelGuide = parcelGuide;

  String _parcelLink;
  String get parcelLink => _$this._parcelLink;
  set parcelLink(String parcelLink) => _$this._parcelLink = parcelLink;

  String _statusForClient;
  String get statusForClient => _$this._statusForClient;
  set statusForClient(String statusForClient) =>
      _$this._statusForClient = statusForClient;

  String _parceImage;
  String get parceImage => _$this._parceImage;
  set parceImage(String parceImage) => _$this._parceImage = parceImage;

  int _amountOfSuppliers;
  int get amountOfSuppliers => _$this._amountOfSuppliers;
  set amountOfSuppliers(int amountOfSuppliers) =>
      _$this._amountOfSuppliers = amountOfSuppliers;

  String _store;
  String get store => _$this._store;
  set store(String store) => _$this._store = store;

  String _assignedDeliverer;
  String get assignedDeliverer => _$this._assignedDeliverer;
  set assignedDeliverer(String assignedDeliverer) =>
      _$this._assignedDeliverer = assignedDeliverer;

  bool _isFromSellerWiseOrder;
  bool get isFromSellerWiseOrder => _$this._isFromSellerWiseOrder;
  set isFromSellerWiseOrder(bool isFromSellerWiseOrder) =>
      _$this._isFromSellerWiseOrder = isFromSellerWiseOrder;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  OrdersForClientsRecordBuilder() {
    OrdersForClientsRecord._initializeBuilder(this);
  }

  OrdersForClientsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _customerId = $v.customerId;
      _customerAddress = $v.customerAddress;
      _customerName = $v.customerName;
      _customerPhone = $v.customerPhone;
      _bundleId = $v.bundleId;
      _createdDate = $v.createdDate;
      _deliverDate = $v.deliverDate;
      _status = $v.status;
      _subtotal = $v.subtotal;
      _total = $v.total;
      _amountOfProducts = $v.amountOfProducts;
      _shipmentPrice = $v.shipmentPrice;
      _shipmentTimeText = $v.shipmentTimeText;
      _totalSuppliersIds = $v.totalSuppliersIds?.toBuilder();
      _totalWeights = $v.totalWeights;
      _deliverer = $v.deliverer;
      _parcelName = $v.parcelName;
      _parcelGuide = $v.parcelGuide;
      _parcelLink = $v.parcelLink;
      _statusForClient = $v.statusForClient;
      _parceImage = $v.parceImage;
      _amountOfSuppliers = $v.amountOfSuppliers;
      _store = $v.store;
      _assignedDeliverer = $v.assignedDeliverer;
      _isFromSellerWiseOrder = $v.isFromSellerWiseOrder;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrdersForClientsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrdersForClientsRecord;
  }

  @override
  void update(void Function(OrdersForClientsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrdersForClientsRecord build() {
    _$OrdersForClientsRecord _$result;
    try {
      _$result = _$v ??
          new _$OrdersForClientsRecord._(
              id: id,
              type: type,
              customerId: customerId,
              customerAddress: customerAddress,
              customerName: customerName,
              customerPhone: customerPhone,
              bundleId: bundleId,
              createdDate: createdDate,
              deliverDate: deliverDate,
              status: status,
              subtotal: subtotal,
              total: total,
              amountOfProducts: amountOfProducts,
              shipmentPrice: shipmentPrice,
              shipmentTimeText: shipmentTimeText,
              totalSuppliersIds: _totalSuppliersIds?.build(),
              totalWeights: totalWeights,
              deliverer: deliverer,
              parcelName: parcelName,
              parcelGuide: parcelGuide,
              parcelLink: parcelLink,
              statusForClient: statusForClient,
              parceImage: parceImage,
              amountOfSuppliers: amountOfSuppliers,
              store: store,
              assignedDeliverer: assignedDeliverer,
              isFromSellerWiseOrder: isFromSellerWiseOrder,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'totalSuppliersIds';
        _totalSuppliersIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrdersForClientsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
