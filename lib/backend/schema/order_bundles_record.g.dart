// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_bundles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderBundlesRecord> _$orderBundlesRecordSerializer =
    new _$OrderBundlesRecordSerializer();

class _$OrderBundlesRecordSerializer
    implements StructuredSerializer<OrderBundlesRecord> {
  @override
  final Iterable<Type> types = const [OrderBundlesRecord, _$OrderBundlesRecord];
  @override
  final String wireName = 'OrderBundlesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderBundlesRecord object,
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
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bundleTotal;
    if (value != null) {
      result
        ..add('bundleTotal')
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
    value = object.customerEmail;
    if (value != null) {
      result
        ..add('customerEmail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.expressStatus;
    if (value != null) {
      result
        ..add('expressStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.normalStatus;
    if (value != null) {
      result
        ..add('normalStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.largePeriodOrderStatus;
    if (value != null) {
      result
        ..add('largePeriodOrderStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceStatus;
    if (value != null) {
      result
        ..add('serviceStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentMethod;
    if (value != null) {
      result
        ..add('paymentMethod')
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
    value = object.customerAddress;
    if (value != null) {
      result
        ..add('customerAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bundleSubtotal;
    if (value != null) {
      result
        ..add('bundleSubtotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bundleShipmentPrice;
    if (value != null) {
      result
        ..add('bundleShipmentPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ordersAmount;
    if (value != null) {
      result
        ..add('ordersAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.normalOrderId;
    if (value != null) {
      result
        ..add('normalOrderId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  OrderBundlesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderBundlesRecordBuilder();

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
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'bundleTotal':
          result.bundleTotal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customerEmail':
          result.customerEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expressStatus':
          result.expressStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'normalStatus':
          result.normalStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'largePeriodOrderStatus':
          result.largePeriodOrderStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'serviceStatus':
          result.serviceStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'paymentMethod':
          result.paymentMethod = serializers.deserialize(value,
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
        case 'customerAddress':
          result.customerAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bundleSubtotal':
          result.bundleSubtotal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bundleShipmentPrice':
          result.bundleShipmentPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ordersAmount':
          result.ordersAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'normalOrderId':
          result.normalOrderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$OrderBundlesRecord extends OrderBundlesRecord {
  @override
  final String id;
  @override
  final DateTime createdDate;
  @override
  final String bundleTotal;
  @override
  final String status;
  @override
  final String customerEmail;
  @override
  final String expressStatus;
  @override
  final String normalStatus;
  @override
  final String largePeriodOrderStatus;
  @override
  final String serviceStatus;
  @override
  final String paymentMethod;
  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String customerAddress;
  @override
  final String bundleSubtotal;
  @override
  final String bundleShipmentPrice;
  @override
  final int ordersAmount;
  @override
  final String owner;
  @override
  final String normalOrderId;
  @override
  final DocumentReference<Object> reference;

  factory _$OrderBundlesRecord(
          [void Function(OrderBundlesRecordBuilder) updates]) =>
      (new OrderBundlesRecordBuilder()..update(updates)).build();

  _$OrderBundlesRecord._(
      {this.id,
      this.createdDate,
      this.bundleTotal,
      this.status,
      this.customerEmail,
      this.expressStatus,
      this.normalStatus,
      this.largePeriodOrderStatus,
      this.serviceStatus,
      this.paymentMethod,
      this.customerName,
      this.customerPhone,
      this.customerAddress,
      this.bundleSubtotal,
      this.bundleShipmentPrice,
      this.ordersAmount,
      this.owner,
      this.normalOrderId,
      this.reference})
      : super._();

  @override
  OrderBundlesRecord rebuild(
          void Function(OrderBundlesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderBundlesRecordBuilder toBuilder() =>
      new OrderBundlesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderBundlesRecord &&
        id == other.id &&
        createdDate == other.createdDate &&
        bundleTotal == other.bundleTotal &&
        status == other.status &&
        customerEmail == other.customerEmail &&
        expressStatus == other.expressStatus &&
        normalStatus == other.normalStatus &&
        largePeriodOrderStatus == other.largePeriodOrderStatus &&
        serviceStatus == other.serviceStatus &&
        paymentMethod == other.paymentMethod &&
        customerName == other.customerName &&
        customerPhone == other.customerPhone &&
        customerAddress == other.customerAddress &&
        bundleSubtotal == other.bundleSubtotal &&
        bundleShipmentPrice == other.bundleShipmentPrice &&
        ordersAmount == other.ordersAmount &&
        owner == other.owner &&
        normalOrderId == other.normalOrderId &&
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
                                                                            $jc(
                                                                                0,
                                                                                id
                                                                                    .hashCode),
                                                                            createdDate
                                                                                .hashCode),
                                                                        bundleTotal
                                                                            .hashCode),
                                                                    status
                                                                        .hashCode),
                                                                customerEmail
                                                                    .hashCode),
                                                            expressStatus
                                                                .hashCode),
                                                        normalStatus.hashCode),
                                                    largePeriodOrderStatus
                                                        .hashCode),
                                                serviceStatus.hashCode),
                                            paymentMethod.hashCode),
                                        customerName.hashCode),
                                    customerPhone.hashCode),
                                customerAddress.hashCode),
                            bundleSubtotal.hashCode),
                        bundleShipmentPrice.hashCode),
                    ordersAmount.hashCode),
                owner.hashCode),
            normalOrderId.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderBundlesRecord')
          ..add('id', id)
          ..add('createdDate', createdDate)
          ..add('bundleTotal', bundleTotal)
          ..add('status', status)
          ..add('customerEmail', customerEmail)
          ..add('expressStatus', expressStatus)
          ..add('normalStatus', normalStatus)
          ..add('largePeriodOrderStatus', largePeriodOrderStatus)
          ..add('serviceStatus', serviceStatus)
          ..add('paymentMethod', paymentMethod)
          ..add('customerName', customerName)
          ..add('customerPhone', customerPhone)
          ..add('customerAddress', customerAddress)
          ..add('bundleSubtotal', bundleSubtotal)
          ..add('bundleShipmentPrice', bundleShipmentPrice)
          ..add('ordersAmount', ordersAmount)
          ..add('owner', owner)
          ..add('normalOrderId', normalOrderId)
          ..add('reference', reference))
        .toString();
  }
}

class OrderBundlesRecordBuilder
    implements Builder<OrderBundlesRecord, OrderBundlesRecordBuilder> {
  _$OrderBundlesRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  String _bundleTotal;
  String get bundleTotal => _$this._bundleTotal;
  set bundleTotal(String bundleTotal) => _$this._bundleTotal = bundleTotal;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _customerEmail;
  String get customerEmail => _$this._customerEmail;
  set customerEmail(String customerEmail) =>
      _$this._customerEmail = customerEmail;

  String _expressStatus;
  String get expressStatus => _$this._expressStatus;
  set expressStatus(String expressStatus) =>
      _$this._expressStatus = expressStatus;

  String _normalStatus;
  String get normalStatus => _$this._normalStatus;
  set normalStatus(String normalStatus) => _$this._normalStatus = normalStatus;

  String _largePeriodOrderStatus;
  String get largePeriodOrderStatus => _$this._largePeriodOrderStatus;
  set largePeriodOrderStatus(String largePeriodOrderStatus) =>
      _$this._largePeriodOrderStatus = largePeriodOrderStatus;

  String _serviceStatus;
  String get serviceStatus => _$this._serviceStatus;
  set serviceStatus(String serviceStatus) =>
      _$this._serviceStatus = serviceStatus;

  String _paymentMethod;
  String get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  String _customerName;
  String get customerName => _$this._customerName;
  set customerName(String customerName) => _$this._customerName = customerName;

  String _customerPhone;
  String get customerPhone => _$this._customerPhone;
  set customerPhone(String customerPhone) =>
      _$this._customerPhone = customerPhone;

  String _customerAddress;
  String get customerAddress => _$this._customerAddress;
  set customerAddress(String customerAddress) =>
      _$this._customerAddress = customerAddress;

  String _bundleSubtotal;
  String get bundleSubtotal => _$this._bundleSubtotal;
  set bundleSubtotal(String bundleSubtotal) =>
      _$this._bundleSubtotal = bundleSubtotal;

  String _bundleShipmentPrice;
  String get bundleShipmentPrice => _$this._bundleShipmentPrice;
  set bundleShipmentPrice(String bundleShipmentPrice) =>
      _$this._bundleShipmentPrice = bundleShipmentPrice;

  int _ordersAmount;
  int get ordersAmount => _$this._ordersAmount;
  set ordersAmount(int ordersAmount) => _$this._ordersAmount = ordersAmount;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  String _normalOrderId;
  String get normalOrderId => _$this._normalOrderId;
  set normalOrderId(String normalOrderId) =>
      _$this._normalOrderId = normalOrderId;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  OrderBundlesRecordBuilder() {
    OrderBundlesRecord._initializeBuilder(this);
  }

  OrderBundlesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _createdDate = $v.createdDate;
      _bundleTotal = $v.bundleTotal;
      _status = $v.status;
      _customerEmail = $v.customerEmail;
      _expressStatus = $v.expressStatus;
      _normalStatus = $v.normalStatus;
      _largePeriodOrderStatus = $v.largePeriodOrderStatus;
      _serviceStatus = $v.serviceStatus;
      _paymentMethod = $v.paymentMethod;
      _customerName = $v.customerName;
      _customerPhone = $v.customerPhone;
      _customerAddress = $v.customerAddress;
      _bundleSubtotal = $v.bundleSubtotal;
      _bundleShipmentPrice = $v.bundleShipmentPrice;
      _ordersAmount = $v.ordersAmount;
      _owner = $v.owner;
      _normalOrderId = $v.normalOrderId;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderBundlesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderBundlesRecord;
  }

  @override
  void update(void Function(OrderBundlesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderBundlesRecord build() {
    final _$result = _$v ??
        new _$OrderBundlesRecord._(
            id: id,
            createdDate: createdDate,
            bundleTotal: bundleTotal,
            status: status,
            customerEmail: customerEmail,
            expressStatus: expressStatus,
            normalStatus: normalStatus,
            largePeriodOrderStatus: largePeriodOrderStatus,
            serviceStatus: serviceStatus,
            paymentMethod: paymentMethod,
            customerName: customerName,
            customerPhone: customerPhone,
            customerAddress: customerAddress,
            bundleSubtotal: bundleSubtotal,
            bundleShipmentPrice: bundleShipmentPrice,
            ordersAmount: ordersAmount,
            owner: owner,
            normalOrderId: normalOrderId,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
