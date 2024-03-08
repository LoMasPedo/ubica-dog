import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutesRecord extends FirestoreRecord {
  RoutesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer_ubication" field.
  LatLng? _customerUbication;
  LatLng? get customerUbication => _customerUbication;
  bool hasCustomerUbication() => _customerUbication != null;

  // "uid_customer" field.
  String? _uidCustomer;
  String get uidCustomer => _uidCustomer ?? '';
  bool hasUidCustomer() => _uidCustomer != null;

  // "employee_ubication" field.
  LatLng? _employeeUbication;
  LatLng? get employeeUbication => _employeeUbication;
  bool hasEmployeeUbication() => _employeeUbication != null;

  // "uid_employee" field.
  String? _uidEmployee;
  String get uidEmployee => _uidEmployee ?? '';
  bool hasUidEmployee() => _uidEmployee != null;

  // "initial_ubication" field.
  LatLng? _initialUbication;
  LatLng? get initialUbication => _initialUbication;
  bool hasInitialUbication() => _initialUbication != null;

  void _initializeFields() {
    _customerUbication = snapshotData['customer_ubication'] as LatLng?;
    _uidCustomer = snapshotData['uid_customer'] as String?;
    _employeeUbication = snapshotData['employee_ubication'] as LatLng?;
    _uidEmployee = snapshotData['uid_employee'] as String?;
    _initialUbication = snapshotData['initial_ubication'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('routes');

  static Stream<RoutesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoutesRecord.fromSnapshot(s));

  static Future<RoutesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoutesRecord.fromSnapshot(s));

  static RoutesRecord fromSnapshot(DocumentSnapshot snapshot) => RoutesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoutesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoutesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoutesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoutesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoutesRecordData({
  LatLng? customerUbication,
  String? uidCustomer,
  LatLng? employeeUbication,
  String? uidEmployee,
  LatLng? initialUbication,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_ubication': customerUbication,
      'uid_customer': uidCustomer,
      'employee_ubication': employeeUbication,
      'uid_employee': uidEmployee,
      'initial_ubication': initialUbication,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoutesRecordDocumentEquality implements Equality<RoutesRecord> {
  const RoutesRecordDocumentEquality();

  @override
  bool equals(RoutesRecord? e1, RoutesRecord? e2) {
    return e1?.customerUbication == e2?.customerUbication &&
        e1?.uidCustomer == e2?.uidCustomer &&
        e1?.employeeUbication == e2?.employeeUbication &&
        e1?.uidEmployee == e2?.uidEmployee &&
        e1?.initialUbication == e2?.initialUbication;
  }

  @override
  int hash(RoutesRecord? e) => const ListEquality().hash([
        e?.customerUbication,
        e?.uidCustomer,
        e?.employeeUbication,
        e?.uidEmployee,
        e?.initialUbication
      ]);

  @override
  bool isValidKey(Object? o) => o is RoutesRecord;
}
