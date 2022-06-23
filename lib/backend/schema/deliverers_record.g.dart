// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliverers_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeliverersRecord> _$deliverersRecordSerializer =
    new _$DeliverersRecordSerializer();

class _$DeliverersRecordSerializer
    implements StructuredSerializer<DeliverersRecord> {
  @override
  final Iterable<Type> types = const [DeliverersRecord, _$DeliverersRecord];
  @override
  final String wireName = 'DeliverersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DeliverersRecord object,
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
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
    value = object.associatedWith;
    if (value != null) {
      result
        ..add('associatedWith')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transport;
    if (value != null) {
      result
        ..add('transport')
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
  DeliverersRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeliverersRecordBuilder();

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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isApproved':
          result.isApproved = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'associatedWith':
          result.associatedWith = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'transport':
          result.transport = serializers.deserialize(value,
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

class _$DeliverersRecord extends DeliverersRecord {
  @override
  final String uid;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final bool isApproved;
  @override
  final String associatedWith;
  @override
  final String transport;
  @override
  final DocumentReference<Object> reference;

  factory _$DeliverersRecord(
          [void Function(DeliverersRecordBuilder) updates]) =>
      (new DeliverersRecordBuilder()..update(updates)).build();

  _$DeliverersRecord._(
      {this.uid,
      this.email,
      this.displayName,
      this.photoUrl,
      this.isApproved,
      this.associatedWith,
      this.transport,
      this.reference})
      : super._();

  @override
  DeliverersRecord rebuild(void Function(DeliverersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeliverersRecordBuilder toBuilder() =>
      new DeliverersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeliverersRecord &&
        uid == other.uid &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        isApproved == other.isApproved &&
        associatedWith == other.associatedWith &&
        transport == other.transport &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, uid.hashCode), email.hashCode),
                            displayName.hashCode),
                        photoUrl.hashCode),
                    isApproved.hashCode),
                associatedWith.hashCode),
            transport.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeliverersRecord')
          ..add('uid', uid)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('isApproved', isApproved)
          ..add('associatedWith', associatedWith)
          ..add('transport', transport)
          ..add('reference', reference))
        .toString();
  }
}

class DeliverersRecordBuilder
    implements Builder<DeliverersRecord, DeliverersRecordBuilder> {
  _$DeliverersRecord _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  bool _isApproved;
  bool get isApproved => _$this._isApproved;
  set isApproved(bool isApproved) => _$this._isApproved = isApproved;

  String _associatedWith;
  String get associatedWith => _$this._associatedWith;
  set associatedWith(String associatedWith) =>
      _$this._associatedWith = associatedWith;

  String _transport;
  String get transport => _$this._transport;
  set transport(String transport) => _$this._transport = transport;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DeliverersRecordBuilder() {
    DeliverersRecord._initializeBuilder(this);
  }

  DeliverersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _isApproved = $v.isApproved;
      _associatedWith = $v.associatedWith;
      _transport = $v.transport;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeliverersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeliverersRecord;
  }

  @override
  void update(void Function(DeliverersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeliverersRecord build() {
    final _$result = _$v ??
        new _$DeliverersRecord._(
            uid: uid,
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            isApproved: isApproved,
            associatedWith: associatedWith,
            transport: transport,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
