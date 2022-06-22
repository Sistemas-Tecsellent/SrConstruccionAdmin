import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get brand;

  @nullable
  String get brandLogo;

  @nullable
  String get category;

  @nullable
  String get categoryId;

  @nullable
  String get code;

  @nullable
  DateTime get createdDate;

  @nullable
  String get description;

  @nullable
  String get ean;

  @nullable
  bool get highShift;

  @nullable
  BuiltList<String> get images;

  @nullable
  bool get isInSale;

  @nullable
  int get likes;

  @nullable
  String get mainImage;

  @nullable
  String get owner;

  @nullable
  String get saleImage;

  @nullable
  int get sales;

  @nullable
  String get satCode;

  @nullable
  String get satDesc;

  @nullable
  String get sku;

  @nullable
  BuiltList<String> get stores;

  @nullable
  String get title;

  @nullable
  int get views;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..id = ''
    ..brand = ''
    ..brandLogo = ''
    ..category = ''
    ..categoryId = ''
    ..code = ''
    ..description = ''
    ..ean = ''
    ..highShift = false
    ..images = ListBuilder()
    ..isInSale = false
    ..likes = 0
    ..mainImage = ''
    ..owner = ''
    ..saleImage = ''
    ..sales = 0
    ..satCode = ''
    ..satDesc = ''
    ..sku = ''
    ..stores = ListBuilder()
    ..title = ''
    ..views = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductsRecordData({
  String id,
  String brand,
  String brandLogo,
  String category,
  String categoryId,
  String code,
  DateTime createdDate,
  String description,
  String ean,
  bool highShift,
  bool isInSale,
  int likes,
  String mainImage,
  String owner,
  String saleImage,
  int sales,
  String satCode,
  String satDesc,
  String sku,
  String title,
  int views,
}) =>
    serializers.toFirestore(
        ProductsRecord.serializer,
        ProductsRecord((p) => p
          ..id = id
          ..brand = brand
          ..brandLogo = brandLogo
          ..category = category
          ..categoryId = categoryId
          ..code = code
          ..createdDate = createdDate
          ..description = description
          ..ean = ean
          ..highShift = highShift
          ..images = null
          ..isInSale = isInSale
          ..likes = likes
          ..mainImage = mainImage
          ..owner = owner
          ..saleImage = saleImage
          ..sales = sales
          ..satCode = satCode
          ..satDesc = satDesc
          ..sku = sku
          ..stores = null
          ..title = title
          ..views = views));
