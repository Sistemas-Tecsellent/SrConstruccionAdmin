// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoresRecord> _$storesRecordSerializer =
    new _$StoresRecordSerializer();

class _$StoresRecordSerializer implements StructuredSerializer<StoresRecord> {
  @override
  final Iterable<Type> types = const [StoresRecord, _$StoresRecord];
  @override
  final String wireName = 'StoresRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, StoresRecord object,
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
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.banner;
    if (value != null) {
      result
        ..add('banner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categories;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.closedHours;
    if (value != null) {
      result
        ..add('closedHours')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.enabledDays;
    if (value != null) {
      result
        ..add('enabledDays')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.locationCity;
    if (value != null) {
      result
        ..add('locationCity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mapLocation;
    if (value != null) {
      result
        ..add('mapLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.openHours;
    if (value != null) {
      result
        ..add('openHours')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
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
  StoresRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoresRecordBuilder();

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
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'banner':
          result.banner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'closedHours':
          result.closedHours.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'enabledDays':
          result.enabledDays.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'locationCity':
          result.locationCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mapLocation':
          result.mapLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'openHours':
          result.openHours.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
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

class _$StoresRecord extends StoresRecord {
  @override
  final String id;
  @override
  final String address;
  @override
  final String banner;
  @override
  final BuiltList<String> categories;
  @override
  final BuiltList<String> closedHours;
  @override
  final BuiltList<String> enabledDays;
  @override
  final String location;
  @override
  final String locationCity;
  @override
  final String logo;
  @override
  final LatLng mapLocation;
  @override
  final String name;
  @override
  final BuiltList<String> openHours;
  @override
  final String owner;
  @override
  final DocumentReference<Object> reference;

  factory _$StoresRecord([void Function(StoresRecordBuilder) updates]) =>
      (new StoresRecordBuilder()..update(updates)).build();

  _$StoresRecord._(
      {this.id,
      this.address,
      this.banner,
      this.categories,
      this.closedHours,
      this.enabledDays,
      this.location,
      this.locationCity,
      this.logo,
      this.mapLocation,
      this.name,
      this.openHours,
      this.owner,
      this.reference})
      : super._();

  @override
  StoresRecord rebuild(void Function(StoresRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoresRecordBuilder toBuilder() => new StoresRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoresRecord &&
        id == other.id &&
        address == other.address &&
        banner == other.banner &&
        categories == other.categories &&
        closedHours == other.closedHours &&
        enabledDays == other.enabledDays &&
        location == other.location &&
        locationCity == other.locationCity &&
        logo == other.logo &&
        mapLocation == other.mapLocation &&
        name == other.name &&
        openHours == other.openHours &&
        owner == other.owner &&
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
                                                    $jc($jc(0, id.hashCode),
                                                        address.hashCode),
                                                    banner.hashCode),
                                                categories.hashCode),
                                            closedHours.hashCode),
                                        enabledDays.hashCode),
                                    location.hashCode),
                                locationCity.hashCode),
                            logo.hashCode),
                        mapLocation.hashCode),
                    name.hashCode),
                openHours.hashCode),
            owner.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StoresRecord')
          ..add('id', id)
          ..add('address', address)
          ..add('banner', banner)
          ..add('categories', categories)
          ..add('closedHours', closedHours)
          ..add('enabledDays', enabledDays)
          ..add('location', location)
          ..add('locationCity', locationCity)
          ..add('logo', logo)
          ..add('mapLocation', mapLocation)
          ..add('name', name)
          ..add('openHours', openHours)
          ..add('owner', owner)
          ..add('reference', reference))
        .toString();
  }
}

class StoresRecordBuilder
    implements Builder<StoresRecord, StoresRecordBuilder> {
  _$StoresRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _banner;
  String get banner => _$this._banner;
  set banner(String banner) => _$this._banner = banner;

  ListBuilder<String> _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String> categories) =>
      _$this._categories = categories;

  ListBuilder<String> _closedHours;
  ListBuilder<String> get closedHours =>
      _$this._closedHours ??= new ListBuilder<String>();
  set closedHours(ListBuilder<String> closedHours) =>
      _$this._closedHours = closedHours;

  ListBuilder<String> _enabledDays;
  ListBuilder<String> get enabledDays =>
      _$this._enabledDays ??= new ListBuilder<String>();
  set enabledDays(ListBuilder<String> enabledDays) =>
      _$this._enabledDays = enabledDays;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  String _locationCity;
  String get locationCity => _$this._locationCity;
  set locationCity(String locationCity) => _$this._locationCity = locationCity;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  LatLng _mapLocation;
  LatLng get mapLocation => _$this._mapLocation;
  set mapLocation(LatLng mapLocation) => _$this._mapLocation = mapLocation;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<String> _openHours;
  ListBuilder<String> get openHours =>
      _$this._openHours ??= new ListBuilder<String>();
  set openHours(ListBuilder<String> openHours) => _$this._openHours = openHours;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  StoresRecordBuilder() {
    StoresRecord._initializeBuilder(this);
  }

  StoresRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _address = $v.address;
      _banner = $v.banner;
      _categories = $v.categories?.toBuilder();
      _closedHours = $v.closedHours?.toBuilder();
      _enabledDays = $v.enabledDays?.toBuilder();
      _location = $v.location;
      _locationCity = $v.locationCity;
      _logo = $v.logo;
      _mapLocation = $v.mapLocation;
      _name = $v.name;
      _openHours = $v.openHours?.toBuilder();
      _owner = $v.owner;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoresRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StoresRecord;
  }

  @override
  void update(void Function(StoresRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoresRecord build() {
    _$StoresRecord _$result;
    try {
      _$result = _$v ??
          new _$StoresRecord._(
              id: id,
              address: address,
              banner: banner,
              categories: _categories?.build(),
              closedHours: _closedHours?.build(),
              enabledDays: _enabledDays?.build(),
              location: location,
              locationCity: locationCity,
              logo: logo,
              mapLocation: mapLocation,
              name: name,
              openHours: _openHours?.build(),
              owner: owner,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();
        _$failedField = 'closedHours';
        _closedHours?.build();
        _$failedField = 'enabledDays';
        _enabledDays?.build();

        _$failedField = 'openHours';
        _openHours?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StoresRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
