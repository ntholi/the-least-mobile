// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$$_PaymentFromJson(Map<String, dynamic> json) => _$_Payment(
      id: json['id'] as String?,
      amount: (json['amount'] as num).toDouble(),
      houseId: json['houseId'] as String,
      userId: json['userId'] as String,
      paymentType: $enumDecode(_$PaymentTypeEnumMap, json['paymentType']),
      dateCreated: _$JsonConverterFromJson<DateTime, Timestamp>(
          json['dateCreated'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'houseId': instance.houseId,
      'userId': instance.userId,
      'paymentType': _$PaymentTypeEnumMap[instance.paymentType]!,
      'dateCreated': _$JsonConverterToJson<DateTime, Timestamp>(
          instance.dateCreated, const TimestampConverter().toJson),
    };

const _$PaymentTypeEnumMap = {
  PaymentType.mpesa: 'mpesa',
  PaymentType.card: 'card',
  PaymentType.paypal: 'paypal',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);