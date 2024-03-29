import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "addressHome" field.
  String? _addressHome;
  String get addressHome => _addressHome ?? '';
  bool hasAddressHome() => _addressHome != null;

  // "pets" field.
  List<DocumentReference>? _pets;
  List<DocumentReference> get pets => _pets ?? const [];
  bool hasPets() => _pets != null;

  // "roles" field.
  String? _roles;
  String get roles => _roles ?? '';
  bool hasRoles() => _roles != null;

  // "ubication" field.
  LatLng? _ubication;
  LatLng? get ubication => _ubication;
  bool hasUbication() => _ubication != null;

  // "ride" field.
  DocumentReference? _ride;
  DocumentReference? get ride => _ride;
  bool hasRide() => _ride != null;

  // "rides" field.
  List<DocumentReference>? _rides;
  List<DocumentReference> get rides => _rides ?? const [];
  bool hasRides() => _rides != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _addressHome = snapshotData['addressHome'] as String?;
    _pets = getDataList(snapshotData['pets']);
    _roles = snapshotData['roles'] as String?;
    _ubication = snapshotData['ubication'] as LatLng?;
    _ride = snapshotData['ride'] as DocumentReference?;
    _rides = getDataList(snapshotData['rides']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? uid,
  String? email,
  String? displayName,
  String? phoneNumber,
  String? photoUrl,
  DateTime? createdTime,
  String? addressHome,
  String? roles,
  LatLng? ubication,
  DocumentReference? ride,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'email': email,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'addressHome': addressHome,
      'roles': roles,
      'ubication': ubication,
      'ride': ride,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.addressHome == e2?.addressHome &&
        listEquality.equals(e1?.pets, e2?.pets) &&
        e1?.roles == e2?.roles &&
        e1?.ubication == e2?.ubication &&
        e1?.ride == e2?.ride &&
        listEquality.equals(e1?.rides, e2?.rides);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.email,
        e?.displayName,
        e?.phoneNumber,
        e?.photoUrl,
        e?.createdTime,
        e?.addressHome,
        e?.pets,
        e?.roles,
        e?.ubication,
        e?.ride,
        e?.rides
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
