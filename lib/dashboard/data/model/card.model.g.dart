// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      medName: json['medName'] as String,
      time: json['time'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'medName': instance.medName,
      'time': instance.time,
      'id': instance.id,
    };
