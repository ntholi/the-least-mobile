import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter extends JsonConverter<Timestamp, DateTime> {
  const TimestampConverter();

  @override
  Timestamp fromJson(DateTime json) {
    return Timestamp.fromDate(json);
  }

  @override
  DateTime toJson(Timestamp object) {
    return object.toDate();
  }
}
