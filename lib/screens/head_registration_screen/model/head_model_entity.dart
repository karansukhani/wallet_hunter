import 'dart:convert';

import 'package:wallet_hunter/generated/json/base/json_field.dart';

import '../../../generated/json/head_model_entity.g.dart';

@JsonSerializable()
class HeadModelEntity {
  String? name = '';
  int? age = 0;
  String? gender = '';
  String? maritalStatus = '';
  String? occupation = '';
  String? samajName = '';
  String? qualification = '';
  String? birthDate = '';
  String? bloodGroup = '';
  String? exactNatureOfDuties = '';
  String? email = '';
  String? phoneNumber = '';
  String? alternativeNumber = '';
  String? landlineNumber = '';
  String? socialMediaLink = '';
  String? flatNumber = '';
  String? buildingName = '';
  String? streetName = '';
  String? landmark = '';
  String? city = '';
  String? district = '';
  String? state = '';
  String? nativeCity = '';
  String? nativeState = '';
  String? country = '';
  String? pincode = '';

  HeadModelEntity();

  factory HeadModelEntity.fromJson(Map<String, dynamic> json) => $HeadModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $HeadModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
