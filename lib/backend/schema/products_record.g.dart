// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductsRecord> _$productsRecordSerializer =
    new _$ProductsRecordSerializer();

class _$ProductsRecordSerializer
    implements StructuredSerializer<ProductsRecord> {
  @override
  final Iterable<Type> types = const [ProductsRecord, _$ProductsRecord];
  @override
  final String wireName = 'ProductsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductsRecord object,
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
    value = object.brand;
    if (value != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.brandLogo;
    if (value != null) {
      result
        ..add('brandLogo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryId;
    if (value != null) {
      result
        ..add('categoryId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ean;
    if (value != null) {
      result
        ..add('ean')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.highShift;
    if (value != null) {
      result
        ..add('highShift')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isInSale;
    if (value != null) {
      result
        ..add('isInSale')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.mainImage;
    if (value != null) {
      result
        ..add('mainImage')
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
    value = object.saleImage;
    if (value != null) {
      result
        ..add('saleImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sales;
    if (value != null) {
      result
        ..add('sales')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.satCode;
    if (value != null) {
      result
        ..add('satCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.satDesc;
    if (value != null) {
      result
        ..add('satDesc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sku;
    if (value != null) {
      result
        ..add('sku')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stores;
    if (value != null) {
      result
        ..add('stores')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.views;
    if (value != null) {
      result
        ..add('views')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ProductsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsRecordBuilder();

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
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'brandLogo':
          result.brandLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryId':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ean':
          result.ean = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'highShift':
          result.highShift = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'isInSale':
          result.isInSale = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'mainImage':
          result.mainImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'saleImage':
          result.saleImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sales':
          result.sales = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'satCode':
          result.satCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'satDesc':
          result.satDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sku':
          result.sku = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stores':
          result.stores.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$ProductsRecord extends ProductsRecord {
  @override
  final String id;
  @override
  final String brand;
  @override
  final String brandLogo;
  @override
  final String category;
  @override
  final String categoryId;
  @override
  final String code;
  @override
  final DateTime createdDate;
  @override
  final String description;
  @override
  final String ean;
  @override
  final bool highShift;
  @override
  final BuiltList<String> images;
  @override
  final bool isInSale;
  @override
  final int likes;
  @override
  final String mainImage;
  @override
  final String owner;
  @override
  final String saleImage;
  @override
  final int sales;
  @override
  final String satCode;
  @override
  final String satDesc;
  @override
  final String sku;
  @override
  final BuiltList<String> stores;
  @override
  final String title;
  @override
  final int views;
  @override
  final DocumentReference<Object> reference;

  factory _$ProductsRecord([void Function(ProductsRecordBuilder) updates]) =>
      (new ProductsRecordBuilder()..update(updates)).build();

  _$ProductsRecord._(
      {this.id,
      this.brand,
      this.brandLogo,
      this.category,
      this.categoryId,
      this.code,
      this.createdDate,
      this.description,
      this.ean,
      this.highShift,
      this.images,
      this.isInSale,
      this.likes,
      this.mainImage,
      this.owner,
      this.saleImage,
      this.sales,
      this.satCode,
      this.satDesc,
      this.sku,
      this.stores,
      this.title,
      this.views,
      this.reference})
      : super._();

  @override
  ProductsRecord rebuild(void Function(ProductsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsRecordBuilder toBuilder() =>
      new ProductsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsRecord &&
        id == other.id &&
        brand == other.brand &&
        brandLogo == other.brandLogo &&
        category == other.category &&
        categoryId == other.categoryId &&
        code == other.code &&
        createdDate == other.createdDate &&
        description == other.description &&
        ean == other.ean &&
        highShift == other.highShift &&
        images == other.images &&
        isInSale == other.isInSale &&
        likes == other.likes &&
        mainImage == other.mainImage &&
        owner == other.owner &&
        saleImage == other.saleImage &&
        sales == other.sales &&
        satCode == other.satCode &&
        satDesc == other.satDesc &&
        sku == other.sku &&
        stores == other.stores &&
        title == other.title &&
        views == other.views &&
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
                                                                            $jc($jc($jc($jc($jc($jc(0, id.hashCode), brand.hashCode), brandLogo.hashCode), category.hashCode), categoryId.hashCode),
                                                                                code.hashCode),
                                                                            createdDate.hashCode),
                                                                        description.hashCode),
                                                                    ean.hashCode),
                                                                highShift.hashCode),
                                                            images.hashCode),
                                                        isInSale.hashCode),
                                                    likes.hashCode),
                                                mainImage.hashCode),
                                            owner.hashCode),
                                        saleImage.hashCode),
                                    sales.hashCode),
                                satCode.hashCode),
                            satDesc.hashCode),
                        sku.hashCode),
                    stores.hashCode),
                title.hashCode),
            views.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductsRecord')
          ..add('id', id)
          ..add('brand', brand)
          ..add('brandLogo', brandLogo)
          ..add('category', category)
          ..add('categoryId', categoryId)
          ..add('code', code)
          ..add('createdDate', createdDate)
          ..add('description', description)
          ..add('ean', ean)
          ..add('highShift', highShift)
          ..add('images', images)
          ..add('isInSale', isInSale)
          ..add('likes', likes)
          ..add('mainImage', mainImage)
          ..add('owner', owner)
          ..add('saleImage', saleImage)
          ..add('sales', sales)
          ..add('satCode', satCode)
          ..add('satDesc', satDesc)
          ..add('sku', sku)
          ..add('stores', stores)
          ..add('title', title)
          ..add('views', views)
          ..add('reference', reference))
        .toString();
  }
}

class ProductsRecordBuilder
    implements Builder<ProductsRecord, ProductsRecordBuilder> {
  _$ProductsRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _brand;
  String get brand => _$this._brand;
  set brand(String brand) => _$this._brand = brand;

  String _brandLogo;
  String get brandLogo => _$this._brandLogo;
  set brandLogo(String brandLogo) => _$this._brandLogo = brandLogo;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _categoryId;
  String get categoryId => _$this._categoryId;
  set categoryId(String categoryId) => _$this._categoryId = categoryId;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _ean;
  String get ean => _$this._ean;
  set ean(String ean) => _$this._ean = ean;

  bool _highShift;
  bool get highShift => _$this._highShift;
  set highShift(bool highShift) => _$this._highShift = highShift;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  bool _isInSale;
  bool get isInSale => _$this._isInSale;
  set isInSale(bool isInSale) => _$this._isInSale = isInSale;

  int _likes;
  int get likes => _$this._likes;
  set likes(int likes) => _$this._likes = likes;

  String _mainImage;
  String get mainImage => _$this._mainImage;
  set mainImage(String mainImage) => _$this._mainImage = mainImage;

  String _owner;
  String get owner => _$this._owner;
  set owner(String owner) => _$this._owner = owner;

  String _saleImage;
  String get saleImage => _$this._saleImage;
  set saleImage(String saleImage) => _$this._saleImage = saleImage;

  int _sales;
  int get sales => _$this._sales;
  set sales(int sales) => _$this._sales = sales;

  String _satCode;
  String get satCode => _$this._satCode;
  set satCode(String satCode) => _$this._satCode = satCode;

  String _satDesc;
  String get satDesc => _$this._satDesc;
  set satDesc(String satDesc) => _$this._satDesc = satDesc;

  String _sku;
  String get sku => _$this._sku;
  set sku(String sku) => _$this._sku = sku;

  ListBuilder<String> _stores;
  ListBuilder<String> get stores =>
      _$this._stores ??= new ListBuilder<String>();
  set stores(ListBuilder<String> stores) => _$this._stores = stores;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _views;
  int get views => _$this._views;
  set views(int views) => _$this._views = views;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProductsRecordBuilder() {
    ProductsRecord._initializeBuilder(this);
  }

  ProductsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _brand = $v.brand;
      _brandLogo = $v.brandLogo;
      _category = $v.category;
      _categoryId = $v.categoryId;
      _code = $v.code;
      _createdDate = $v.createdDate;
      _description = $v.description;
      _ean = $v.ean;
      _highShift = $v.highShift;
      _images = $v.images?.toBuilder();
      _isInSale = $v.isInSale;
      _likes = $v.likes;
      _mainImage = $v.mainImage;
      _owner = $v.owner;
      _saleImage = $v.saleImage;
      _sales = $v.sales;
      _satCode = $v.satCode;
      _satDesc = $v.satDesc;
      _sku = $v.sku;
      _stores = $v.stores?.toBuilder();
      _title = $v.title;
      _views = $v.views;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsRecord;
  }

  @override
  void update(void Function(ProductsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductsRecord build() {
    _$ProductsRecord _$result;
    try {
      _$result = _$v ??
          new _$ProductsRecord._(
              id: id,
              brand: brand,
              brandLogo: brandLogo,
              category: category,
              categoryId: categoryId,
              code: code,
              createdDate: createdDate,
              description: description,
              ean: ean,
              highShift: highShift,
              images: _images?.build(),
              isInSale: isInSale,
              likes: likes,
              mainImage: mainImage,
              owner: owner,
              saleImage: saleImage,
              sales: sales,
              satCode: satCode,
              satDesc: satDesc,
              sku: sku,
              stores: _stores?.build(),
              title: title,
              views: views,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'stores';
        _stores?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
