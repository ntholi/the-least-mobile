import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/json_converters.dart';

part 'house.freezed.dart';
part 'house.g.dart';

@freezed
class House with _$House {
  const factory House({
    String? id,
    required String name,
    String? description,
    String? address,
    String? district,
    num? target,
    num? donated,
    String? imageUrl,
    @TimestampConverter() Timestamp? dateCreated,
  }) = _House;

  factory House.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return House(
      id: snapshot.id,
      name: data?['name'],
      description: data?['description'],
      address: data?['address'],
      district: data?['district'],
      target: data?['target'],
      donated: data?['donated'],
      dateCreated: data?['dateCreated'],
      imageUrl: data?['imageUrl'],
    );
  }
  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
}
