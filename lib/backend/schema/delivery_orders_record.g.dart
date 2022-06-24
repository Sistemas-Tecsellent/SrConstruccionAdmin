// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_orders_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeliveryOrdersRecord> _$deliveryOrdersRecordSerializer =
    new _$DeliveryOrdersRecordSerializer();

class _$DeliveryOrdersRecordSerializer
    implements StructuredSerializer<DeliveryOrdersRecord> {
  @override
  final Iterable<Type> types = const [
    DeliveryOrdersRecord,
    _$DeliveryOrdersRecord
  ];
  @override
  final String wireName = 'DeliveryOrdersRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DeliveryOrdersRecord object,
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
    value = object.assignedDeliverer;
    if (value != null) {
      result
        ..add('assignedDeliverer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderBundle;
    if (value != null) {
      result
        ..add('orderBundle')
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
  DeliveryOrdersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeliveryOrdersRecordBuilder();

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
        case 'assignedDeliverer':
          result.assignedDeliverer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'orderBundle':
          result.orderBundle = serializers.deserialize(value,
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

class _$DeliveryOrdersRecord extends DeliveryOrdersRecord {
  @override
  final String id;
  @override
  final String assignedDeliverer;
  @override
  final String orderBundle;
  @override
  final DocumentReference<Object> reference;

  factory _$DeliveryOrdersRecord(
          [void Function(DeliveryOrdersRecordBuilder) updates]) =>
      (new DeliveryOrdersRecordBuilder()..update(updates)).build();

  _$DeliveryOrdersRecord._(
      {this.id, this.assignedDeliverer, this.orderBundle, this.reference})
      : super._();

  @override
  DeliveryOrdersRecord rebuild(
          void Function(DeliveryOrdersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeliveryOrdersRecordBuilder toBuilder() =>
      new DeliveryOrdersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeliveryOrdersRecord &&
        id == other.id &&
        assignedDeliverer == other.assignedDeliverer &&
        orderBundle == other.orderBundle &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), assignedDeliverer.hashCode),
            orderBundle.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeliveryOrdersRecord')
          ..add('id', id)
          ..add('assignedDeliverer', assignedDeliverer)
          ..add('orderBundle', orderBundle)
          ..add('reference', reference))
        .toString();
  }
}

class DeliveryOrdersRecordBuilder
    implements Builder<DeliveryOrdersRecord, DeliveryOrdersRecordBuilder> {
  _$DeliveryOrdersRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _assignedDeliverer;
  String get assignedDeliverer => _$this._assignedDeliverer;
  set assignedDeliverer(String assignedDeliverer) =>
      _$this._assignedDeliverer = assignedDeliverer;

  String _orderBundle;
  String get orderBundle => _$this._orderBundle;
  set orderBundle(String orderBundle) => _$this._orderBundle = orderBundle;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DeliveryOrdersRecordBuilder() {
    DeliveryOrdersRecord._initializeBuilder(this);
  }

  DeliveryOrdersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _assignedDeliverer = $v.assignedDeliverer;
      _orderBundle = $v.orderBundle;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeliveryOrdersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeliveryOrdersRecord;
  }

  @override
  void update(void Function(DeliveryOrdersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeliveryOrdersRecord build() {
    final _$result = _$v ??
        new _$DeliveryOrdersRecord._(
            id: id,
            assignedDeliverer: assignedDeliverer,
            orderBundle: orderBundle,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
