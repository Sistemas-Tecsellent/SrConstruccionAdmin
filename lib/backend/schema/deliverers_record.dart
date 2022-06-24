import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'deliverers_record.g.dart';

abstract class DeliverersRecord
    implements Built<DeliverersRecord, DeliverersRecordBuilder> {
  static Serializer<DeliverersRecord> get serializer =>
      _$deliverersRecordSerializer;

  @nullable
  String get uid;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  bool get isApproved;

  @nullable
  String get associatedWith;

  @nullable
  String get transport;

  @nullable
  String get isLicenseApproved;

  @nullable
  String get isVehicleCertificateApproved;

  @nullable
  String get isIDDocumentApproved;

  @nullable
  String get isProofOfResidencyApproved;

  @nullable
  String get license;

  @nullable
  String get idDocument;

  @nullable
  String get vehicleCertificate;

  @nullable
  String get proofOfResidency;

  @nullable
  String get licensePlate;

  @nullable
  String get brandModel;

  @nullable
  String get photo1;

  @nullable
  String get photo2;

  @nullable
  String get photo3;

  @nullable
  String get photo4;

  @nullable
  String get bankStatement;

  @nullable
  String get bankAccountHolder;

  @nullable
  String get bank;

  @nullable
  String get bankAccountNo;

  @nullable
  String get bankAccountClabe;

  @nullable
  String get bankAccountPhone;

  @nullable
  String get bankAccountEmail;

  @nullable
  String get phone;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DeliverersRecordBuilder builder) => builder
    ..uid = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..isApproved = false
    ..associatedWith = ''
    ..transport = ''
    ..isLicenseApproved = ''
    ..isVehicleCertificateApproved = ''
    ..isIDDocumentApproved = ''
    ..isProofOfResidencyApproved = ''
    ..license = ''
    ..idDocument = ''
    ..vehicleCertificate = ''
    ..proofOfResidency = ''
    ..licensePlate = ''
    ..brandModel = ''
    ..photo1 = ''
    ..photo2 = ''
    ..photo3 = ''
    ..photo4 = ''
    ..bankStatement = ''
    ..bankAccountHolder = ''
    ..bank = ''
    ..bankAccountNo = ''
    ..bankAccountClabe = ''
    ..bankAccountPhone = ''
    ..bankAccountEmail = ''
    ..phone = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deliverers');

  static Stream<DeliverersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DeliverersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DeliverersRecord._();
  factory DeliverersRecord([void Function(DeliverersRecordBuilder) updates]) =
      _$DeliverersRecord;

  static DeliverersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDeliverersRecordData({
  String uid,
  String email,
  String displayName,
  String photoUrl,
  bool isApproved,
  String associatedWith,
  String transport,
  String isLicenseApproved,
  String isVehicleCertificateApproved,
  String isIDDocumentApproved,
  String isProofOfResidencyApproved,
  String license,
  String idDocument,
  String vehicleCertificate,
  String proofOfResidency,
  String licensePlate,
  String brandModel,
  String photo1,
  String photo2,
  String photo3,
  String photo4,
  String bankStatement,
  String bankAccountHolder,
  String bank,
  String bankAccountNo,
  String bankAccountClabe,
  String bankAccountPhone,
  String bankAccountEmail,
  String phone,
}) =>
    serializers.toFirestore(
        DeliverersRecord.serializer,
        DeliverersRecord((d) => d
          ..uid = uid
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..isApproved = isApproved
          ..associatedWith = associatedWith
          ..transport = transport
          ..isLicenseApproved = isLicenseApproved
          ..isVehicleCertificateApproved = isVehicleCertificateApproved
          ..isIDDocumentApproved = isIDDocumentApproved
          ..isProofOfResidencyApproved = isProofOfResidencyApproved
          ..license = license
          ..idDocument = idDocument
          ..vehicleCertificate = vehicleCertificate
          ..proofOfResidency = proofOfResidency
          ..licensePlate = licensePlate
          ..brandModel = brandModel
          ..photo1 = photo1
          ..photo2 = photo2
          ..photo3 = photo3
          ..photo4 = photo4
          ..bankStatement = bankStatement
          ..bankAccountHolder = bankAccountHolder
          ..bank = bank
          ..bankAccountNo = bankAccountNo
          ..bankAccountClabe = bankAccountClabe
          ..bankAccountPhone = bankAccountPhone
          ..bankAccountEmail = bankAccountEmail
          ..phone = phone));
