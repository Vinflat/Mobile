// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Renter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Renter _$RenterFromJson(Map<String, dynamic> json) => Renter(
      json['username'] as String,
      json['password'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['fullName'] as String,
      json['birthDate'] as String,
      json['address'] as String,
      json['gender'] as String,
    );

Map<String, dynamic> _$RenterToJson(Renter instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'phone': instance.phone,
      'fullName': instance.fullName,
      'birthDate': instance.birthDate,
      'address': instance.address,
      'gender': instance.gender,
    };
