import 'package:cloud_firestore/cloud_firestore.dart';

class House {
  String? id;
  String name;
  String address;
  String? district;
  num? target;
  num? donated;
  Timestamp? dateCreated;

  House({
    this.id,
    required this.name,
    required this.address,
    this.district,
    this.target,
    this.donated,
    this.dateCreated,
  });

  factory House.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return House(
      id: snapshot.id,
      name: data?['name'],
      address: data?['address'],
      district: data?['district'],
      target: data?['target'],
      donated: data?['donated'],
      dateCreated: data?['dateCreated'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      if (address != null) "address": address,
      if (district != null) "district": district,
      if (target != null) "target": target,
      if (donated != null) "donated": donated,
      if (dateCreated != null) "dateCreated": dateCreated,
    };
  }
}
