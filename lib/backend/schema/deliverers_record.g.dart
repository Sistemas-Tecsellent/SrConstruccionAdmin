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
    value = object.isLicenseApproved;
    if (value != null) {
      result
        ..add('isLicenseApproved')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isVehicleCertificateApproved;
    if (value != null) {
      result
        ..add('isVehicleCertificateApproved')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isIDDocumentApproved;
    if (value != null) {
      result
        ..add('isIDDocumentApproved')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isProofOfResidencyApproved;
    if (value != null) {
      result
        ..add('isProofOfResidencyApproved')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.license;
    if (value != null) {
      result
        ..add('license')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idDocument;
    if (value != null) {
      result
        ..add('idDocument')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vehicleCertificate;
    if (value != null) {
      result
        ..add('vehicleCertificate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.proofOfResidency;
    if (value != null) {
      result
        ..add('proofOfResidency')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.licensePlate;
    if (value != null) {
      result
        ..add('licensePlate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.brandModel;
    if (value != null) {
      result
        ..add('brandModel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo1;
    if (value != null) {
      result
        ..add('photo1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo2;
    if (value != null) {
      result
        ..add('photo2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo3;
    if (value != null) {
      result
        ..add('photo3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo4;
    if (value != null) {
      result
        ..add('photo4')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankStatement;
    if (value != null) {
      result
        ..add('bankStatement')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankAccountHolder;
    if (value != null) {
      result
        ..add('bankAccountHolder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bank;
    if (value != null) {
      result
        ..add('bank')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankAccountNo;
    if (value != null) {
      result
        ..add('bankAccountNo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankAccountClabe;
    if (value != null) {
      result
        ..add('bankAccountClabe')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankAccountPhone;
    if (value != null) {
      result
        ..add('bankAccountPhone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankAccountEmail;
    if (value != null) {
      result
        ..add('bankAccountEmail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
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
        case 'isLicenseApproved':
          result.isLicenseApproved = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isVehicleCertificateApproved':
          result.isVehicleCertificateApproved = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isIDDocumentApproved':
          result.isIDDocumentApproved = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isProofOfResidencyApproved':
          result.isProofOfResidencyApproved = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'license':
          result.license = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'idDocument':
          result.idDocument = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vehicleCertificate':
          result.vehicleCertificate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'proofOfResidency':
          result.proofOfResidency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'licensePlate':
          result.licensePlate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'brandModel':
          result.brandModel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo1':
          result.photo1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo2':
          result.photo2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo3':
          result.photo3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo4':
          result.photo4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bankStatement':
          result.bankStatement = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bankAccountHolder':
          result.bankAccountHolder = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bank':
          result.bank = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bankAccountNo':
          result.bankAccountNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bankAccountClabe':
          result.bankAccountClabe = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bankAccountPhone':
          result.bankAccountPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bankAccountEmail':
          result.bankAccountEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
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
  final String isLicenseApproved;
  @override
  final String isVehicleCertificateApproved;
  @override
  final String isIDDocumentApproved;
  @override
  final String isProofOfResidencyApproved;
  @override
  final String license;
  @override
  final String idDocument;
  @override
  final String vehicleCertificate;
  @override
  final String proofOfResidency;
  @override
  final String licensePlate;
  @override
  final String brandModel;
  @override
  final String photo1;
  @override
  final String photo2;
  @override
  final String photo3;
  @override
  final String photo4;
  @override
  final String bankStatement;
  @override
  final String bankAccountHolder;
  @override
  final String bank;
  @override
  final String bankAccountNo;
  @override
  final String bankAccountClabe;
  @override
  final String bankAccountPhone;
  @override
  final String bankAccountEmail;
  @override
  final String phone;
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
      this.isLicenseApproved,
      this.isVehicleCertificateApproved,
      this.isIDDocumentApproved,
      this.isProofOfResidencyApproved,
      this.license,
      this.idDocument,
      this.vehicleCertificate,
      this.proofOfResidency,
      this.licensePlate,
      this.brandModel,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.bankStatement,
      this.bankAccountHolder,
      this.bank,
      this.bankAccountNo,
      this.bankAccountClabe,
      this.bankAccountPhone,
      this.bankAccountEmail,
      this.phone,
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
        isLicenseApproved == other.isLicenseApproved &&
        isVehicleCertificateApproved == other.isVehicleCertificateApproved &&
        isIDDocumentApproved == other.isIDDocumentApproved &&
        isProofOfResidencyApproved == other.isProofOfResidencyApproved &&
        license == other.license &&
        idDocument == other.idDocument &&
        vehicleCertificate == other.vehicleCertificate &&
        proofOfResidency == other.proofOfResidency &&
        licensePlate == other.licensePlate &&
        brandModel == other.brandModel &&
        photo1 == other.photo1 &&
        photo2 == other.photo2 &&
        photo3 == other.photo3 &&
        photo4 == other.photo4 &&
        bankStatement == other.bankStatement &&
        bankAccountHolder == other.bankAccountHolder &&
        bank == other.bank &&
        bankAccountNo == other.bankAccountNo &&
        bankAccountClabe == other.bankAccountClabe &&
        bankAccountPhone == other.bankAccountPhone &&
        bankAccountEmail == other.bankAccountEmail &&
        phone == other.phone &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, uid.hashCode), email.hashCode), displayName.hashCode), photoUrl.hashCode), isApproved.hashCode), associatedWith.hashCode), transport.hashCode), isLicenseApproved.hashCode), isVehicleCertificateApproved.hashCode), isIDDocumentApproved.hashCode), isProofOfResidencyApproved.hashCode),
                                                                                license.hashCode),
                                                                            idDocument.hashCode),
                                                                        vehicleCertificate.hashCode),
                                                                    proofOfResidency.hashCode),
                                                                licensePlate.hashCode),
                                                            brandModel.hashCode),
                                                        photo1.hashCode),
                                                    photo2.hashCode),
                                                photo3.hashCode),
                                            photo4.hashCode),
                                        bankStatement.hashCode),
                                    bankAccountHolder.hashCode),
                                bank.hashCode),
                            bankAccountNo.hashCode),
                        bankAccountClabe.hashCode),
                    bankAccountPhone.hashCode),
                bankAccountEmail.hashCode),
            phone.hashCode),
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
          ..add('isLicenseApproved', isLicenseApproved)
          ..add('isVehicleCertificateApproved', isVehicleCertificateApproved)
          ..add('isIDDocumentApproved', isIDDocumentApproved)
          ..add('isProofOfResidencyApproved', isProofOfResidencyApproved)
          ..add('license', license)
          ..add('idDocument', idDocument)
          ..add('vehicleCertificate', vehicleCertificate)
          ..add('proofOfResidency', proofOfResidency)
          ..add('licensePlate', licensePlate)
          ..add('brandModel', brandModel)
          ..add('photo1', photo1)
          ..add('photo2', photo2)
          ..add('photo3', photo3)
          ..add('photo4', photo4)
          ..add('bankStatement', bankStatement)
          ..add('bankAccountHolder', bankAccountHolder)
          ..add('bank', bank)
          ..add('bankAccountNo', bankAccountNo)
          ..add('bankAccountClabe', bankAccountClabe)
          ..add('bankAccountPhone', bankAccountPhone)
          ..add('bankAccountEmail', bankAccountEmail)
          ..add('phone', phone)
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

  String _isLicenseApproved;
  String get isLicenseApproved => _$this._isLicenseApproved;
  set isLicenseApproved(String isLicenseApproved) =>
      _$this._isLicenseApproved = isLicenseApproved;

  String _isVehicleCertificateApproved;
  String get isVehicleCertificateApproved =>
      _$this._isVehicleCertificateApproved;
  set isVehicleCertificateApproved(String isVehicleCertificateApproved) =>
      _$this._isVehicleCertificateApproved = isVehicleCertificateApproved;

  String _isIDDocumentApproved;
  String get isIDDocumentApproved => _$this._isIDDocumentApproved;
  set isIDDocumentApproved(String isIDDocumentApproved) =>
      _$this._isIDDocumentApproved = isIDDocumentApproved;

  String _isProofOfResidencyApproved;
  String get isProofOfResidencyApproved => _$this._isProofOfResidencyApproved;
  set isProofOfResidencyApproved(String isProofOfResidencyApproved) =>
      _$this._isProofOfResidencyApproved = isProofOfResidencyApproved;

  String _license;
  String get license => _$this._license;
  set license(String license) => _$this._license = license;

  String _idDocument;
  String get idDocument => _$this._idDocument;
  set idDocument(String idDocument) => _$this._idDocument = idDocument;

  String _vehicleCertificate;
  String get vehicleCertificate => _$this._vehicleCertificate;
  set vehicleCertificate(String vehicleCertificate) =>
      _$this._vehicleCertificate = vehicleCertificate;

  String _proofOfResidency;
  String get proofOfResidency => _$this._proofOfResidency;
  set proofOfResidency(String proofOfResidency) =>
      _$this._proofOfResidency = proofOfResidency;

  String _licensePlate;
  String get licensePlate => _$this._licensePlate;
  set licensePlate(String licensePlate) => _$this._licensePlate = licensePlate;

  String _brandModel;
  String get brandModel => _$this._brandModel;
  set brandModel(String brandModel) => _$this._brandModel = brandModel;

  String _photo1;
  String get photo1 => _$this._photo1;
  set photo1(String photo1) => _$this._photo1 = photo1;

  String _photo2;
  String get photo2 => _$this._photo2;
  set photo2(String photo2) => _$this._photo2 = photo2;

  String _photo3;
  String get photo3 => _$this._photo3;
  set photo3(String photo3) => _$this._photo3 = photo3;

  String _photo4;
  String get photo4 => _$this._photo4;
  set photo4(String photo4) => _$this._photo4 = photo4;

  String _bankStatement;
  String get bankStatement => _$this._bankStatement;
  set bankStatement(String bankStatement) =>
      _$this._bankStatement = bankStatement;

  String _bankAccountHolder;
  String get bankAccountHolder => _$this._bankAccountHolder;
  set bankAccountHolder(String bankAccountHolder) =>
      _$this._bankAccountHolder = bankAccountHolder;

  String _bank;
  String get bank => _$this._bank;
  set bank(String bank) => _$this._bank = bank;

  String _bankAccountNo;
  String get bankAccountNo => _$this._bankAccountNo;
  set bankAccountNo(String bankAccountNo) =>
      _$this._bankAccountNo = bankAccountNo;

  String _bankAccountClabe;
  String get bankAccountClabe => _$this._bankAccountClabe;
  set bankAccountClabe(String bankAccountClabe) =>
      _$this._bankAccountClabe = bankAccountClabe;

  String _bankAccountPhone;
  String get bankAccountPhone => _$this._bankAccountPhone;
  set bankAccountPhone(String bankAccountPhone) =>
      _$this._bankAccountPhone = bankAccountPhone;

  String _bankAccountEmail;
  String get bankAccountEmail => _$this._bankAccountEmail;
  set bankAccountEmail(String bankAccountEmail) =>
      _$this._bankAccountEmail = bankAccountEmail;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

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
      _isLicenseApproved = $v.isLicenseApproved;
      _isVehicleCertificateApproved = $v.isVehicleCertificateApproved;
      _isIDDocumentApproved = $v.isIDDocumentApproved;
      _isProofOfResidencyApproved = $v.isProofOfResidencyApproved;
      _license = $v.license;
      _idDocument = $v.idDocument;
      _vehicleCertificate = $v.vehicleCertificate;
      _proofOfResidency = $v.proofOfResidency;
      _licensePlate = $v.licensePlate;
      _brandModel = $v.brandModel;
      _photo1 = $v.photo1;
      _photo2 = $v.photo2;
      _photo3 = $v.photo3;
      _photo4 = $v.photo4;
      _bankStatement = $v.bankStatement;
      _bankAccountHolder = $v.bankAccountHolder;
      _bank = $v.bank;
      _bankAccountNo = $v.bankAccountNo;
      _bankAccountClabe = $v.bankAccountClabe;
      _bankAccountPhone = $v.bankAccountPhone;
      _bankAccountEmail = $v.bankAccountEmail;
      _phone = $v.phone;
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
            isLicenseApproved: isLicenseApproved,
            isVehicleCertificateApproved: isVehicleCertificateApproved,
            isIDDocumentApproved: isIDDocumentApproved,
            isProofOfResidencyApproved: isProofOfResidencyApproved,
            license: license,
            idDocument: idDocument,
            vehicleCertificate: vehicleCertificate,
            proofOfResidency: proofOfResidency,
            licensePlate: licensePlate,
            brandModel: brandModel,
            photo1: photo1,
            photo2: photo2,
            photo3: photo3,
            photo4: photo4,
            bankStatement: bankStatement,
            bankAccountHolder: bankAccountHolder,
            bank: bank,
            bankAccountNo: bankAccountNo,
            bankAccountClabe: bankAccountClabe,
            bankAccountPhone: bankAccountPhone,
            bankAccountEmail: bankAccountEmail,
            phone: phone,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
