// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_for_stores_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrdersForStoresRecord> _$ordersForStoresRecordSerializer =
    new _$OrdersForStoresRecordSerializer();

class _$OrdersForStoresRecordSerializer
    implements StructuredSerializer<OrdersForStoresRecord> {
  @override
  final Iterable<Type> types = const [
    OrdersForStoresRecord,
    _$OrdersForStoresRecord
  ];
  @override
  final String wireName = 'OrdersForStoresRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, OrdersForStoresRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.bundleId;
    if (value != null) {
      result
        ..add('bundleId')
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
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.store;
    if (value != null) {
      result
        ..add('store')
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
    value = object.amountOfProducts;
    if (value != null) {
      result
        ..add('amountOfProducts')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.guide;
    if (value != null) {
      result
        ..add('guide')
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
    value = object.isByGuide;
    if (value != null) {
      result
        ..add('isByGuide')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isSentBySeller;
    if (value != null) {
      result
        ..add('isSentBySeller')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isCollectedByAdmin;
    if (value != null) {
      result
        ..add('isCollectedByAdmin')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deliveredBy;
    if (value != null) {
      result
        ..add('deliveredBy')
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
    value = object.shipmentType;
    if (value != null) {
      result
        ..add('shipmentType')
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
  OrdersForStoresRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrdersForStoresRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'bundleId':
          result.bundleId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'store':
          result.store = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amountOfProducts':
          result.amountOfProducts = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'guide':
          result.guide = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'statusForAdmin':
          result.statusForAdmin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isByGuide':
          result.isByGuide = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isSentBySeller':
          result.isSentBySeller = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isCollectedByAdmin':
          result.isCollectedByAdmin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'deliveredBy':
          result.deliveredBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assignedDeliverer':
          result.assignedDeliverer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shipmentType':
          result.shipmentType = serializers.deserialize(value,
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

class _$OrdersForStoresRecord extends OrdersForStoresRecord {
  @override
  final String bundleId;
  @override
  final String type;
  @override
  final String id;
  @override
  final DateTime createdDate;
  @override
  final double total;
  @override
  final String store;
  @override
  final String status;
  @override
  final int amountOfProducts;
  @override
  final String guide;
  @override
  final String statusForAdmin;
  @override
  final bool isByGuide;
  @override
  final bool isSentBySeller;
  @override
  final bool isCollectedByAdmin;
  @override
  final String deliveredBy;
  @override
  final String assignedDeliverer;
  @override
  final String shipmentType;
  @override
  final DocumentReference<Object> reference;

  factory _$OrdersForStoresRecord(
          [void Function(OrdersForStoresRecordBuilder) updates]) =>
      (new OrdersForStoresRecordBuilder()..update(updates)).build();

  _$OrdersForStoresRecord._(
      {this.bundleId,
      this.type,
      this.id,
      this.createdDate,
      this.total,
      this.store,
      this.status,
      this.amountOfProducts,
      this.guide,
      this.statusForAdmin,
      this.isByGuide,
      this.isSentBySeller,
      this.isCollectedByAdmin,
      this.deliveredBy,
      this.assignedDeliverer,
      this.shipmentType,
      this.reference})
      : super._();

  @override
  OrdersForStoresRecord rebuild(
          void Function(OrdersForStoresRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrdersForStoresRecordBuilder toBuilder() =>
      new OrdersForStoresRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrdersForStoresRecord &&
        bundleId == other.bundleId &&
        type == other.type &&
        id == other.id &&
        createdDate == other.createdDate &&
        total == other.total &&
        store == other.store &&
        status == other.status &&
        amountOfProducts == other.amountOfProducts &&
        guide == other.guide &&
        statusForAdmin == other.statusForAdmin &&
        isByGuide == other.isByGuide &&
        isSentBySeller == other.isSentBySeller &&
        isCollectedByAdmin == other.isCollectedByAdmin &&
        deliveredBy == other.deliveredBy &&
        assignedDeliverer == other.assignedDeliverer &&
        shipmentType == other.shipmentType &&
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
                                                                        0,
                                                                        bundleId
                                                                            .hashCode),
                                                                    type
                                                                        .hashCode),
                                                                id.hashCode),
                                                            createdDate
                                                                .hashCode),
                                                        total.hashCode),
                                                    store.hashCode),
                                                status.hashCode),
                                            amountOfProducts.hashCode),
                                        guide.hashCode),
                                    statusForAdmin.hashCode),
                                isByGuide.hashCode),
                            isSentBySeller.hashCode),
                        isCollectedByAdmin.hashCode),
                    deliveredBy.hashCode),
                assignedDeliverer.hashCode),
            shipmentType.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrdersForStoresRecord')
          ..add('bundleId', bundleId)
          ..add('type', type)
          ..add('id', id)
          ..add('createdDate', createdDate)
          ..add('total', total)
          ..add('store', store)
          ..add('status', status)
          ..add('amountOfProducts', amountOfProducts)
          ..add('guide', guide)
          ..add('statusForAdmin', statusForAdmin)
          ..add('isByGuide', isByGuide)
          ..add('isSentBySeller', isSentBySeller)
          ..add('isCollectedByAdmin', isCollectedByAdmin)
          ..add('deliveredBy', deliveredBy)
          ..add('assignedDeliverer', assignedDeliverer)
          ..add('shipmentType', shipmentType)
          ..add('reference', reference))
        .toString();
  }
}

class OrdersForStoresRecordBuilder
    implements Builder<OrdersForStoresRecord, OrdersForStoresRecordBuilder> {
  _$OrdersForStoresRecord _$v;

  String _bundleId;
  String get bundleId => _$this._bundleId;
  set bundleId(String bundleId) => _$this._bundleId = bundleId;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  double _total;
  double get total => _$this._total;
  set total(double total) => _$this._total = total;

  String _store;
  String get store => _$this._store;
  set store(String store) => _$this._store = store;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  int _amountOfProducts;
  int get amountOfProducts => _$this._amountOfProducts;
  set amountOfProducts(int amountOfProducts) =>
      _$this._amountOfProducts = amountOfProducts;

  String _guide;
  String get guide => _$this._guide;
  set guide(String guide) => _$this._guide = guide;

  String _statusForAdmin;
  String get statusForAdmin => _$this._statusForAdmin;
  set statusForAdmin(String statusForAdmin) =>
      _$this._statusForAdmin = statusForAdmin;

  bool _isByGuide;
  bool get isByGuide => _$this._isByGuide;
  set isByGuide(bool isByGuide) => _$this._isByGuide = isByGuide;

  bool _isSentBySeller;
  bool get isSentBySeller => _$this._isSentBySeller;
  set isSentBySeller(bool isSentBySeller) =>
      _$this._isSentBySeller = isSentBySeller;

  bool _isCollectedByAdmin;
  bool get isCollectedByAdmin => _$this._isCollectedByAdmin;
  set isCollectedByAdmin(bool isCollectedByAdmin) =>
      _$this._isCollectedByAdmin = isCollectedByAdmin;

  String _deliveredBy;
  String get deliveredBy => _$this._deliveredBy;
  set deliveredBy(String deliveredBy) => _$this._deliveredBy = deliveredBy;

  String _assignedDeliverer;
  String get assignedDeliverer => _$this._assignedDeliverer;
  set assignedDeliverer(String assignedDeliverer) =>
      _$this._assignedDeliverer = assignedDeliverer;

  String _shipmentType;
  String get shipmentType => _$this._shipmentType;
  set shipmentType(String shipmentType) => _$this._shipmentType = shipmentType;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  OrdersForStoresRecordBuilder() {
    OrdersForStoresRecord._initializeBuilder(this);
  }

  OrdersForStoresRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bundleId = $v.bundleId;
      _type = $v.type;
      _id = $v.id;
      _createdDate = $v.createdDate;
      _total = $v.total;
      _store = $v.store;
      _status = $v.status;
      _amountOfProducts = $v.amountOfProducts;
      _guide = $v.guide;
      _statusForAdmin = $v.statusForAdmin;
      _isByGuide = $v.isByGuide;
      _isSentBySeller = $v.isSentBySeller;
      _isCollectedByAdmin = $v.isCollectedByAdmin;
      _deliveredBy = $v.deliveredBy;
      _assignedDeliverer = $v.assignedDeliverer;
      _shipmentType = $v.shipmentType;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrdersForStoresRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrdersForStoresRecord;
  }

  @override
  void update(void Function(OrdersForStoresRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrdersForStoresRecord build() {
    final _$result = _$v ??
        new _$OrdersForStoresRecord._(
            bundleId: bundleId,
            type: type,
            id: id,
            createdDate: createdDate,
            total: total,
            store: store,
            status: status,
            amountOfProducts: amountOfProducts,
            guide: guide,
            statusForAdmin: statusForAdmin,
            isByGuide: isByGuide,
            isSentBySeller: isSentBySeller,
            isCollectedByAdmin: isCollectedByAdmin,
            deliveredBy: deliveredBy,
            assignedDeliverer: assignedDeliverer,
            shipmentType: shipmentType,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
