import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShoesRecord extends FirestoreRecord {
  ShoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['Price']);
    _image = snapshotData['Image'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Shoes');

  static Stream<ShoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShoesRecord.fromSnapshot(s));

  static Future<ShoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShoesRecord.fromSnapshot(s));

  static ShoesRecord fromSnapshot(DocumentSnapshot snapshot) => ShoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShoesRecordData({
  String? name,
  double? price,
  String? image,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'Price': price,
      'Image': image,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShoesRecordDocumentEquality implements Equality<ShoesRecord> {
  const ShoesRecordDocumentEquality();

  @override
  bool equals(ShoesRecord? e1, ShoesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description;
  }

  @override
  int hash(ShoesRecord? e) =>
      const ListEquality().hash([e?.name, e?.price, e?.image, e?.description]);

  @override
  bool isValidKey(Object? o) => o is ShoesRecord;
}
