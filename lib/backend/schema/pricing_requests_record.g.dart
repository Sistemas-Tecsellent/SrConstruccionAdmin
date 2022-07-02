// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_requests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PricingRequestsRecord> _$pricingRequestsRecordSerializer =
    new _$PricingRequestsRecordSerializer();

class _$PricingRequestsRecordSerializer
    implements StructuredSerializer<PricingRequestsRecord> {
  @override
  final Iterable<Type> types = const [
    PricingRequestsRecord,
    _$PricingRequestsRecord
  ];
  @override
  final String wireName = 'PricingRequestsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PricingRequestsRecord object,
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
    value = object.checkoutId;
    if (value != null) {
      result
        ..add('checkoutId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownerName;
    if (value != null) {
      result
        ..add('ownerName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.onwerAddress;
    if (value != null) {
      result
        ..add('onwerAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownerPhone;
    if (value != null) {
      result
        ..add('ownerPhone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productsTotal;
    if (value != null) {
      result
        ..add('productsTotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.shipmentPrice;
    if (value != null) {
      result
        ..add('shipmentPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.assignedTo;
    if (value != null) {
      result
        ..add('assignedTo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deliveryTime;
    if (value != null) {
      result
        ..add('deliveryTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deliveryDate;
    if (value != null) {
      result
        ..add('deliveryDate')
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
  PricingRequestsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PricingRequestsRecordBuilder();

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
        case 'checkoutId':
          result.checkoutId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ownerName':
          result.ownerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'onwerAddress':
          result.onwerAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ownerPhone':
          result.ownerPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productsTotal':
          result.productsTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'shipmentPrice':
          result.shipmentPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assignedTo':
          result.assignedTo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deliveryTime':
          result.deliveryTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'deliveryDate':
          result.deliveryDate = serializers.deserialize(value,
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

class _$PricingRequestsRecord extends PricingRequestsRecord {
  @override
  final String id;
  @override
  final String checkoutId;
  @override
  final String owner;
  @override
  final String ownerName;
  @override
  final String onwerAddress;
  @override
  final String ownerPhone;
  @override
  final double productsTotal;
  @override
  final String shipmentPrice;
  @override
  final String assignedTo;
  @override
  final String deliveryTime;
  @override
  final bool active;
  @override
  final String deliveryDate;
  @override
  final DocumentReference<Object> reference;

  factory _$PricingRequestsRecord(
          [void Function(PricingRequestsRecordBuilder) updates]) =>
      (new PricingRequestsRecordBuilder()..update(updates)).build();

  _$PricingRequestsRecord._(
      {this.id,
      this.checkoutId,
      this.owner,
      this.ownerName,
      this.onwerAddress,
      this.ownerPhone,
      this.productsTotal,
      this.shipmentPrice,
      this.assignedTo,
      this.deliveryTime,
      this.active,
      this.deliveryDate,
      this.reference})
      : super._();

  @override
  PricingRequestsRecord rebuild(
          void Function(PricingRequestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PricingRequestsRecordBuilder toBuilder() =>
      new PricingRequestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PricingRequestsRecord &&
        id == other.id &&
        checkoutId == other.checkoutId &&
        owner == other.owner &&
        ownerName == other.ownerName &&
        onwerAddress == other.onwerAddress &&
        ownerPhone == other.ownerPhone &&
        productsTotal == other.productsTotal &&
        shipmentPrice == other.shipmentPrice &&
        assignedTo == other.assignedTo &&
        deliveryTime == other.deliveryTime &&
        active == other.active &&
        deliveryDate == other.deliveryDate &&
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
                                                $jc($jc(0, id.hashCode),
                                                    checkoutId.hashCode),
                                                owner.hashCode),
                                            ownerName.hashCode),
                                        onwerAddress.hashCode),
                                    ownerPhone.hashCode),
                                productsTotal.hashCode),
                            shipmentPrice.hashCode),
                        assignedTo.hashCode),
                    deliveryTime.hashCode),
                active.hashCode),
            deliveryDate.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PricingRequestsRecord')
          ..add('id', id)
          ..add('checkoutId', checkoutId)
          ..add('owner', owner)
          ..add('ownerName', ownerName)
          ..add('onwerAddress', onwerAddress)
          ..add('ownerPhone', ownerPhone)
          ..add('productsTotal', productsTotal)
          ..add('shipmentPrice', shipmentPrice)
          ..add('assignedTo', assignedTo)
          ..add('deliveryTime', deliveryTime)
          ..add('active', active)
          ..add('deliveryDate', deliveryDate)
          ..add('reference', reference))
        .toString();
  }
}

class PricingRequestsRecordBuilder
    implements Builder<PricingRequestsRecord, PricingRequestsRecordBuilder> {
  _$PricingRequestsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _checkoutId;
  String get checkoutId => _$this._checkoutId;
  set checkoutId(String checkoutId) => _$this._checkoutId = checkoutId;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  String _ownerName;
  String get ownerName => _$this._ownerName;
  set ownerName(String ownerName) => _$this._ownerName = ownerName;

  String _onwerAddress;
  String get onwerAddress => _$this._onwerAddress;
  set onwerAddress(String onwerAddress) => _$this._onwerAddress = onwerAddress;

  String _ownerPhone;
  String get ownerPhone => _$this._ownerPhone;
  set ownerPhone(String ownerPhone) => _$this._ownerPhone = ownerPhone;

  double _productsTotal;
  double get productsTotal => _$this._productsTotal;
  set productsTotal(double productsTotal) =>
      _$this._productsTotal = productsTotal;

  String _shipmentPrice;
  String get shipmentPrice => _$this._shipmentPrice;
  set shipmentPrice(String shipmentPrice) =>
      _$this._shipmentPrice = shipmentPrice;

  String _assignedTo;
  String get assignedTo => _$this._assignedTo;
  set assignedTo(String assignedTo) => _$this._assignedTo = assignedTo;

  String _deliveryTime;
  String get deliveryTime => _$this._deliveryTime;
  set deliveryTime(String deliveryTime) => _$this._deliveryTime = deliveryTime;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  String _deliveryDate;
  String get deliveryDate => _$this._deliveryDate;
  set deliveryDate(String deliveryDate) => _$this._deliveryDate = deliveryDate;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PricingRequestsRecordBuilder() {
    PricingRequestsRecord._initializeBuilder(this);
  }

  PricingRequestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _checkoutId = $v.checkoutId;
      _owner = $v.owner;
      _ownerName = $v.ownerName;
      _onwerAddress = $v.onwerAddress;
      _ownerPhone = $v.ownerPhone;
      _productsTotal = $v.productsTotal;
      _shipmentPrice = $v.shipmentPrice;
      _assignedTo = $v.assignedTo;
      _deliveryTime = $v.deliveryTime;
      _active = $v.active;
      _deliveryDate = $v.deliveryDate;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PricingRequestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PricingRequestsRecord;
  }

  @override
  void update(void Function(PricingRequestsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PricingRequestsRecord build() {
    final _$result = _$v ??
        new _$PricingRequestsRecord._(
            id: id,
            checkoutId: checkoutId,
            owner: owner,
            ownerName: ownerName,
            onwerAddress: onwerAddress,
            ownerPhone: ownerPhone,
            productsTotal: productsTotal,
            shipmentPrice: shipmentPrice,
            assignedTo: assignedTo,
            deliveryTime: deliveryTime,
            active: active,
            deliveryDate: deliveryDate,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
