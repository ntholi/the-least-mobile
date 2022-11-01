import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter extends JsonConverter<Timestamp?, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    return Timestamp.fromDate(json as DateTime);
  }

  @override
  Object toJson(Timestamp? object) {
    if (object != null) {
      return object;
    }
    return FieldValue.serverTimestamp();
  }
}
