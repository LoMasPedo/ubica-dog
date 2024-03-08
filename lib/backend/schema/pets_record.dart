import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetsRecord extends FirestoreRecord {
  PetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "type_pet" field.
  String? _typePet;
  String get typePet => _typePet ?? '';
  bool hasTypePet() => _typePet != null;

  // "birthdate" field.
  int? _birthdate;
  int get birthdate => _birthdate ?? 0;
  bool hasBirthdate() => _birthdate != null;

  // "admission" field.
  DateTime? _admission;
  DateTime? get admission => _admission;
  bool hasAdmission() => _admission != null;

  // "race" field.
  String? _race;
  String get race => _race ?? '';
  bool hasRace() => _race != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _typePet = snapshotData['type_pet'] as String?;
    _birthdate = castToType<int>(snapshotData['birthdate']);
    _admission = snapshotData['admission'] as DateTime?;
    _race = snapshotData['race'] as String?;
    _photo = snapshotData['photo'] as String?;
    _uid = snapshotData['uid'] as String?;
    _owner = snapshotData['owner'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pets');

  static Stream<PetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetsRecord.fromSnapshot(s));

  static Future<PetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetsRecord.fromSnapshot(s));

  static PetsRecord fromSnapshot(DocumentSnapshot snapshot) => PetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetsRecordData({
  String? name,
  String? description,
  String? typePet,
  int? birthdate,
  DateTime? admission,
  String? race,
  String? photo,
  String? uid,
  String? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'type_pet': typePet,
      'birthdate': birthdate,
      'admission': admission,
      'race': race,
      'photo': photo,
      'uid': uid,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetsRecordDocumentEquality implements Equality<PetsRecord> {
  const PetsRecordDocumentEquality();

  @override
  bool equals(PetsRecord? e1, PetsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.typePet == e2?.typePet &&
        e1?.birthdate == e2?.birthdate &&
        e1?.admission == e2?.admission &&
        e1?.race == e2?.race &&
        e1?.photo == e2?.photo &&
        e1?.uid == e2?.uid &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(PetsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.typePet,
        e?.birthdate,
        e?.admission,
        e?.race,
        e?.photo,
        e?.uid,
        e?.owner
      ]);

  @override
  bool isValidKey(Object? o) => o is PetsRecord;
}
