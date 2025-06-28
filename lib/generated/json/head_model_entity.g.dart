import 'package:wallet_hunter/generated/json/base/json_convert_content.dart';
import 'package:wallet_hunter/screens/head_registration_screen/model/head_model_entity.dart';

HeadModelEntity $HeadModelEntityFromJson(Map<String, dynamic> json) {
  final HeadModelEntity headModelEntity = HeadModelEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    headModelEntity.name = name;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    headModelEntity.age = age;
  }
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    headModelEntity.gender = gender;
  }
  final String? maritalStatus = jsonConvert.convert<String>(json['maritalStatus']);
  if (maritalStatus != null) {
    headModelEntity.maritalStatus = maritalStatus;
  }
  final String? occupation = jsonConvert.convert<String>(json['occupation']);
  if (occupation != null) {
    headModelEntity.occupation = occupation;
  }
  final String? samajName = jsonConvert.convert<String>(json['samajName']);
  if (samajName != null) {
    headModelEntity.samajName = samajName;
  }
  final String? qualification = jsonConvert.convert<String>(json['qualification']);
  if (qualification != null) {
    headModelEntity.qualification = qualification;
  }
  final String? birthDate = jsonConvert.convert<String>(json['birthDate']);
  if (birthDate != null) {
    headModelEntity.birthDate = birthDate;
  }
  final String? bloodGroup = jsonConvert.convert<String>(json['bloodGroup']);
  if (bloodGroup != null) {
    headModelEntity.bloodGroup = bloodGroup;
  }
  final String? exactNatureOfDuties = jsonConvert.convert<String>(json['exactNatureOfDuties']);
  if (exactNatureOfDuties != null) {
    headModelEntity.exactNatureOfDuties = exactNatureOfDuties;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    headModelEntity.email = email;
  }
  final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
  if (phoneNumber != null) {
    headModelEntity.phoneNumber = phoneNumber;
  }
  final String? alternativeNumber = jsonConvert.convert<String>(json['alternativeNumber']);
  if (alternativeNumber != null) {
    headModelEntity.alternativeNumber = alternativeNumber;
  }
  final String? landlineNumber = jsonConvert.convert<String>(json['landlineNumber']);
  if (landlineNumber != null) {
    headModelEntity.landlineNumber = landlineNumber;
  }
  final String? socialMediaLink = jsonConvert.convert<String>(json['socialMediaLink']);
  if (socialMediaLink != null) {
    headModelEntity.socialMediaLink = socialMediaLink;
  }
  final String? flatNumber = jsonConvert.convert<String>(json['flatNumber']);
  if (flatNumber != null) {
    headModelEntity.flatNumber = flatNumber;
  }
  final String? buildingName = jsonConvert.convert<String>(json['buildingName']);
  if (buildingName != null) {
    headModelEntity.buildingName = buildingName;
  }
  final String? streetName = jsonConvert.convert<String>(json['streetName']);
  if (streetName != null) {
    headModelEntity.streetName = streetName;
  }
  final String? landmark = jsonConvert.convert<String>(json['landmark']);
  if (landmark != null) {
    headModelEntity.landmark = landmark;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    headModelEntity.city = city;
  }
  final String? district = jsonConvert.convert<String>(json['district']);
  if (district != null) {
    headModelEntity.district = district;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    headModelEntity.state = state;
  }
  final String? nativeCity = jsonConvert.convert<String>(json['nativeCity']);
  if (nativeCity != null) {
    headModelEntity.nativeCity = nativeCity;
  }
  final String? nativeState = jsonConvert.convert<String>(json['nativeState']);
  if (nativeState != null) {
    headModelEntity.nativeState = nativeState;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    headModelEntity.country = country;
  }
  final String? pincode = jsonConvert.convert<String>(json['pincode']);
  if (pincode != null) {
    headModelEntity.pincode = pincode;
  }
  return headModelEntity;
}

Map<String, dynamic> $HeadModelEntityToJson(HeadModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['age'] = entity.age;
  data['gender'] = entity.gender;
  data['maritalStatus'] = entity.maritalStatus;
  data['occupation'] = entity.occupation;
  data['samajName'] = entity.samajName;
  data['qualification'] = entity.qualification;
  data['birthDate'] = entity.birthDate;
  data['bloodGroup'] = entity.bloodGroup;
  data['exactNatureOfDuties'] = entity.exactNatureOfDuties;
  data['email'] = entity.email;
  data['phoneNumber'] = entity.phoneNumber;
  data['alternativeNumber'] = entity.alternativeNumber;
  data['landlineNumber'] = entity.landlineNumber;
  data['socialMediaLink'] = entity.socialMediaLink;
  data['flatNumber'] = entity.flatNumber;
  data['buildingName'] = entity.buildingName;
  data['streetName'] = entity.streetName;
  data['landmark'] = entity.landmark;
  data['city'] = entity.city;
  data['district'] = entity.district;
  data['state'] = entity.state;
  data['nativeCity'] = entity.nativeCity;
  data['nativeState'] = entity.nativeState;
  data['country'] = entity.country;
  data['pincode'] = entity.pincode;
  return data;
}

extension HeadModelEntityExtension on HeadModelEntity {
  HeadModelEntity copyWith({
    String? name,
    int? age,
    String? gender,
    String? maritalStatus,
    String? occupation,
    String? samajName,
    String? qualification,
    String? birthDate,
    String? bloodGroup,
    String? exactNatureOfDuties,
    String? email,
    String? phoneNumber,
    String? alternativeNumber,
    String? landlineNumber,
    String? socialMediaLink,
    String? flatNumber,
    String? buildingName,
    String? streetName,
    String? landmark,
    String? city,
    String? district,
    String? state,
    String? nativeCity,
    String? nativeState,
    String? country,
    String? pincode,
  }) {
    return HeadModelEntity()
      ..name = name ?? this.name
      ..age = age ?? this.age
      ..gender = gender ?? this.gender
      ..maritalStatus = maritalStatus ?? this.maritalStatus
      ..occupation = occupation ?? this.occupation
      ..samajName = samajName ?? this.samajName
      ..qualification = qualification ?? this.qualification
      ..birthDate = birthDate ?? this.birthDate
      ..bloodGroup = bloodGroup ?? this.bloodGroup
      ..exactNatureOfDuties = exactNatureOfDuties ?? this.exactNatureOfDuties
      ..email = email ?? this.email
      ..phoneNumber = phoneNumber ?? this.phoneNumber
      ..alternativeNumber = alternativeNumber ?? this.alternativeNumber
      ..landlineNumber = landlineNumber ?? this.landlineNumber
      ..socialMediaLink = socialMediaLink ?? this.socialMediaLink
      ..flatNumber = flatNumber ?? this.flatNumber
      ..buildingName = buildingName ?? this.buildingName
      ..streetName = streetName ?? this.streetName
      ..landmark = landmark ?? this.landmark
      ..city = city ?? this.city
      ..district = district ?? this.district
      ..state = state ?? this.state
      ..nativeCity = nativeCity ?? this.nativeCity
      ..nativeState = nativeState ?? this.nativeState
      ..country = country ?? this.country
      ..pincode = pincode ?? this.pincode;
  }
}
