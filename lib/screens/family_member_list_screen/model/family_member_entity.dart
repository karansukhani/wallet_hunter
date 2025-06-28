import 'dart:convert';

import 'package:wallet_hunter/generated/json/base/json_field.dart';
import 'package:wallet_hunter/generated/json/family_member_entity.g.dart';

export 'package:wallet_hunter/generated/json/family_member_entity.g.dart';

@JsonSerializable()
class FamilyMemberEntity {
  String? firstName = '';
  String? middleName = '';
  String? lastName = '';
  String? birthDate = '';
  int? age = 0;
  String? gender = '';
  String? maritalStatus = '';
  String? qualification = '';
  String? occupation = '';
  String? exactNatureOfDuties = '';
  String? bloodGroup = '';
  String? relationWithHead = '';
  String? photoPath = '';
  String? phoneNumber = '';
  String? alternativeNumber = '';
  String? landlineNumber = '';
  String? email = '';
  String? socialMediaLink = '';
  String? country = '';
  String? state = '';
  String? district = '';
  String? city = '';
  String? streetName = '';
  String? landmark = '';
  String? buildingName = '';
  String? doorNumber = '';
  String? flatNumber = '';
  String? pincode = '';
  String? nativeCity = '';
  String? nativeState = '';

  FamilyMemberEntity();

  factory FamilyMemberEntity.fromJson(Map<String, dynamic> json) => $FamilyMemberEntityFromJson(json);

  Map<String, dynamic> toJson() => $FamilyMemberEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
