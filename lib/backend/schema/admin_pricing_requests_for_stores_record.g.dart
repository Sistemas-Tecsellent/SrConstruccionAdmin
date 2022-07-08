// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_pricing_requests_for_stores_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdminPricingRequestsForStoresRecord>
    _$adminPricingRequestsForStoresRecordSerializer =
    new _$AdminPricingRequestsForStoresRecordSerializer();

class _$AdminPricingRequestsForStoresRecordSerializer
    implements StructuredSerializer<AdminPricingRequestsForStoresRecord> {
  @override
  final Iterable<Type> types = const [
    AdminPricingRequestsForStoresRecord,
    _$AdminPricingRequestsForStoresRecord
  ];
  @override
  final String wireName = 'AdminPricingRequestsForStoresRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AdminPricingRequestsForStoresRecord object,
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
    value = object.pricingRequestId;
    if (value != null) {
      result
        ..add('pricingRequestId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seller;
    if (value != null) {
      result
        ..add('seller')
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
    value = object.ownerAddress;
    if (value != null) {
      result
        ..add('ownerAddress')
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
    value = object.shipmentPrice;
    if (value != null) {
      result
        ..add('shipmentPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.store;
    if (value != null) {
      result
        ..add('store')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.subtotal;
    if (value != null) {
      result
        ..add('subtotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.earning;
    if (value != null) {
      result
        ..add('earning')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.deliveryDate;
    if (value != null) {
      result
        ..add('deliveryDate')
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
    value = object.amountOfProducts;
    if (value != null) {
      result
        ..add('amountOfProducts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statusForAdmin;
    if (value != null) {
      result
        ..add('statusForAdmin')
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
  AdminPricingRequestsForStoresRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdminPricingRequestsForStoresRecordBuilder();

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
        case 'pricingRequestId':
          result.pricingRequestId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'seller':
          result.seller = serializers.deserialize(value,
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
        case 'ownerAddress':
          result.ownerAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ownerPhone':
          result.ownerPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipmentPrice':
          result.shipmentPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'store':
          result.store = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'subtotal':
          result.subtotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'earning':
          result.earning = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'deliveryDate':
          result.deliveryDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deliveryTime':
          result.deliveryTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amountOfProducts':
          result.amountOfProducts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'statusForAdmin':
          result.statusForAdmin = serializers.deserialize(value,
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

class _$AdminPricingRequestsForStoresRecord
    extends AdminPricingRequestsForStoresRecord {
  @override
  final String id;
  @override
  final String pricingRequestId;
  @override
  final String seller;
  @override
  final String owner;
  @override
  final String ownerName;
  @override
  final String ownerAddress;
  @override
  final String ownerPhone;
  @override
  final String shipmentPrice;
  @override
  final String store;
  @override
  final double total;
  @override
  final double subtotal;
  @override
  final double earning;
  @override
  final String deliveryDate;
  @override
  final String deliveryTime;
  @override
  final int amountOfProducts;
  @override
  final String status;
  @override
  final String statusForAdmin;
  @override
  final DocumentReference<Object> reference;

  factory _$AdminPricingRequestsForStoresRecord(
          [void Function(AdminPricingRequestsForStoresRecordBuilder)
              updates]) =>
      (new AdminPricingRequestsForStoresRecordBuilder()..update(updates))
          .build();

  _$AdminPricingRequestsForStoresRecord._(
      {this.id,
      this.pricingRequestId,
      this.seller,
      this.owner,
      this.ownerName,
      this.ownerAddress,
      this.ownerPhone,
      this.shipmentPrice,
      this.store,
      this.total,
      this.subtotal,
      this.earning,
      this.deliveryDate,
      this.deliveryTime,
      this.amountOfProducts,
      this.status,
      this.statusForAdmin,
      this.reference})
      : super._();

  @override
  AdminPricingRequestsForStoresRecord rebuild(
          void Function(AdminPricingRequestsForStoresRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminPricingRequestsForStoresRecordBuilder toBuilder() =>
      new AdminPricingRequestsForStoresRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminPricingRequestsForStoresRecord &&
        id == other.id &&
        pricingRequestId == other.pricingRequestId &&
        seller == other.seller &&
        owner == other.owner &&
        ownerName == other.ownerName &&
        ownerAddress == other.ownerAddress &&
        ownerPhone == other.ownerPhone &&
        shipmentPrice == other.shipmentPrice &&
        store == other.store &&
        total == other.total &&
        subtotal == other.subtotal &&
        earning == other.earning &&
        deliveryDate == other.deliveryDate &&
        deliveryTime == other.deliveryTime &&
        amountOfProducts == other.amountOfProducts &&
        status == other.status &&
        statusForAdmin == other.statusForAdmin &&
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
                                                                            0,
                                                                            id
                                                                                .hashCode),
                                                                        pricingRequestId
                                                                            .hashCode),
                                                                    seller
                                                                        .hashCode),
                                                                owner.hashCode),
                                                            ownerName.hashCode),
                                                        ownerAddress.hashCode),
                                                    ownerPhone.hashCode),
                                                shipmentPrice.hashCode),
                                            store.hashCode),
                                        total.hashCode),
                                    subtotal.hashCode),
                                earning.hashCode),
                            deliveryDate.hashCode),
                        deliveryTime.hashCode),
                    amountOfProducts.hashCode),
                status.hashCode),
            statusForAdmin.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AdminPricingRequestsForStoresRecord')
          ..add('id', id)
          ..add('pricingRequestId', pricingRequestId)
          ..add('seller', seller)
          ..add('owner', owner)
          ..add('ownerName', ownerName)
          ..add('ownerAddress', ownerAddress)
          ..add('ownerPhone', ownerPhone)
          ..add('shipmentPrice', shipmentPrice)
          ..add('store', store)
          ..add('total', total)
          ..add('subtotal', subtotal)
          ..add('earning', earning)
          ..add('deliveryDate', deliveryDate)
          ..add('deliveryTime', deliveryTime)
          ..add('amountOfProducts', amountOfProducts)
          ..add('status', status)
          ..add('statusForAdmin', statusForAdmin)
          ..add('reference', reference))
        .toString();
  }
}

class AdminPricingRequestsForStoresRecordBuilder
    implements
        Builder<AdminPricingRequestsForStoresRecord,
            AdminPricingRequestsForStoresRecordBuilder> {
  _$AdminPricingRequestsForStoresRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _pricingRequestId;
  String get pricingRequestId => _$this._pricingRequestId;
  set pricingRequestId(String pricingRequestId) =>
      _$this._pricingRequestId = pricingRequestId;

  String _seller;
  String get seller => _$this._seller;
  set seller(String seller) => _$this._seller = seller;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  String _ownerName;
  String get ownerName => _$this._ownerName;
  set ownerName(String ownerName) => _$this._ownerName = ownerName;

  String _ownerAddress;
  String get ownerAddress => _$this._ownerAddress;
  set ownerAddress(String ownerAddress) => _$this._ownerAddress = ownerAddress;

  String _ownerPhone;
  String get ownerPhone => _$this._ownerPhone;
  set ownerPhone(String ownerPhone) => _$this._ownerPhone = ownerPhone;

  String _shipmentPrice;
  String get shipmentPrice => _$this._shipmentPrice;
  set shipmentPrice(String shipmentPrice) =>
      _$this._shipmentPrice = shipmentPrice;

  String _store;
  String get store => _$this._store;
  set store(String store) => _$this._store = store;

  double _total;
  double get total => _$this._total;
  set total(double total) => _$this._total = total;

  double _subtotal;
  double get subtotal => _$this._subtotal;
  set subtotal(double subtotal) => _$this._subtotal = subtotal;

  double _earning;
  double get earning => _$this._earning;
  set earning(double earning) => _$this._earning = earning;

  String _deliveryDate;
  String get deliveryDate => _$this._deliveryDate;
  set deliveryDate(String deliveryDate) => _$this._deliveryDate = deliveryDate;

  String _deliveryTime;
  String get deliveryTime => _$this._deliveryTime;
  set deliveryTime(String deliveryTime) => _$this._deliveryTime = deliveryTime;

  int _amountOfProducts;
  int get amountOfProducts => _$this._amountOfProducts;
  set amountOfProducts(int amountOfProducts) =>
      _$this._amountOfProducts = amountOfProducts;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _statusForAdmin;
  String get statusForAdmin => _$this._statusForAdmin;
  set statusForAdmin(String statusForAdmin) =>
      _$this._statusForAdmin = statusForAdmin;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AdminPricingRequestsForStoresRecordBuilder() {
    AdminPricingRequestsForStoresRecord._initializeBuilder(this);
  }

  AdminPricingRequestsForStoresRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _pricingRequestId = $v.pricingRequestId;
      _seller = $v.seller;
      _owner = $v.owner;
      _ownerName = $v.ownerName;
      _ownerAddress = $v.ownerAddress;
      _ownerPhone = $v.ownerPhone;
      _shipmentPrice = $v.shipmentPrice;
      _store = $v.store;
      _total = $v.total;
      _subtotal = $v.subtotal;
      _earning = $v.earning;
      _deliveryDate = $v.deliveryDate;
      _deliveryTime = $v.deliveryTime;
      _amountOfProducts = $v.amountOfProducts;
      _status = $v.status;
      _statusForAdmin = $v.statusForAdmin;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminPricingRequestsForStoresRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdminPricingRequestsForStoresRecord;
  }

  @override
  void update(
      void Function(AdminPricingRequestsForStoresRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AdminPricingRequestsForStoresRecord build() {
    final _$result = _$v ??
        new _$AdminPricingRequestsForStoresRecord._(
            id: id,
            pricingRequestId: pricingRequestId,
            seller: seller,
            owner: owner,
            ownerName: ownerName,
            ownerAddress: ownerAddress,
            ownerPhone: ownerPhone,
            shipmentPrice: shipmentPrice,
            store: store,
            total: total,
            subtotal: subtotal,
            earning: earning,
            deliveryDate: deliveryDate,
            deliveryTime: deliveryTime,
            amountOfProducts: amountOfProducts,
            status: status,
            statusForAdmin: statusForAdmin,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
