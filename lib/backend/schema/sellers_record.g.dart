// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sellers_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SellersRecord> _$sellersRecordSerializer =
    new _$SellersRecordSerializer();

class _$SellersRecordSerializer implements StructuredSerializer<SellersRecord> {
  @override
  final Iterable<Type> types = const [SellersRecord, _$SellersRecord];
  @override
  final String wireName = 'SellersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SellersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sellerId;
    if (value != null) {
      result
        ..add('sellerId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.storeId;
    if (value != null) {
      result
        ..add('storeId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isApproved;
    if (value != null) {
      result
        ..add('isApproved')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
  SellersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SellersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sellerId':
          result.sellerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'storeId':
          result.storeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isApproved':
          result.isApproved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
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

class _$SellersRecord extends SellersRecord {
  @override
  final String uid;
  @override
  final String sellerId;
  @override
  final String storeId;
  @override
  final bool isApproved;
  @override
  final String email;
  @override
  final DocumentReference<Object> reference;

  factory _$SellersRecord([void Function(SellersRecordBuilder) updates]) =>
      (new SellersRecordBuilder()..update(updates)).build();

  _$SellersRecord._(
      {this.uid,
      this.sellerId,
      this.storeId,
      this.isApproved,
      this.email,
      this.reference})
      : super._();

  @override
  SellersRecord rebuild(void Function(SellersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SellersRecordBuilder toBuilder() => new SellersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SellersRecord &&
        uid == other.uid &&
        sellerId == other.sellerId &&
        storeId == other.storeId &&
        isApproved == other.isApproved &&
        email == other.email &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, uid.hashCode), sellerId.hashCode),
                    storeId.hashCode),
                isApproved.hashCode),
            email.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SellersRecord')
          ..add('uid', uid)
          ..add('sellerId', sellerId)
          ..add('storeId', storeId)
          ..add('isApproved', isApproved)
          ..add('email', email)
          ..add('reference', reference))
        .toString();
  }
}

class SellersRecordBuilder
    implements Builder<SellersRecord, SellersRecordBuilder> {
  _$SellersRecord _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _sellerId;
  String get sellerId => _$this._sellerId;
  set sellerId(String sellerId) => _$this._sellerId = sellerId;

  String _storeId;
  String get storeId => _$this._storeId;
  set storeId(String storeId) => _$this._storeId = storeId;

  bool _isApproved;
  bool get isApproved => _$this._isApproved;
  set isApproved(bool isApproved) => _$this._isApproved = isApproved;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SellersRecordBuilder() {
    SellersRecord._initializeBuilder(this);
  }

  SellersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _sellerId = $v.sellerId;
      _storeId = $v.storeId;
      _isApproved = $v.isApproved;
      _email = $v.email;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SellersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SellersRecord;
  }

  @override
  void update(void Function(SellersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SellersRecord build() {
    final _$result = _$v ??
        new _$SellersRecord._(
            uid: uid,
            sellerId: sellerId,
            storeId: storeId,
            isApproved: isApproved,
            email: email,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
