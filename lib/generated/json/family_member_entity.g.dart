import 'package:wallet_hunter/generated/json/base/json_convert_content.dart';
import 'package:wallet_hunter/screens/family_member_list_screen/model/family_member_entity.dart';

FamilyMemberEntity $FamilyMemberEntityFromJson(Map<String, dynamic> json) {
  final FamilyMemberEntity familyMemberEntity = FamilyMemberEntity();
  final String? firstName = jsonConvert.convert<String>(json['firstName']);
  if (firstName != null) {
    familyMemberEntity.firstName = firstName;
  }
  final String? middleName = jsonConvert.convert<String>(json['middleName']);
  if (middleName != null) {
    familyMemberEntity.middleName = middleName;
  }
  final String? lastName = jsonConvert.convert<String>(json['lastName']);
  if (lastName != null) {
    familyMemberEntity.lastName = lastName;
  }
  final String? birthDate = jsonConvert.convert<String>(json['birthDate']);
  if (birthDate != null) {
    familyMemberEntity.birthDate = birthDate;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    familyMemberEntity.age = age;
  }
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    familyMemberEntity.gender = gender;
  }
  final String? maritalStatus = jsonConvert.convert<String>(json['maritalStatus']);
  if (maritalStatus != null) {
    familyMemberEntity.maritalStatus = maritalStatus;
  }
  final String? qualification = jsonConvert.convert<String>(json['qualification']);
  if (qualification != null) {
    familyMemberEntity.qualification = qualification;
  }
  final String? occupation = jsonConvert.convert<String>(json['occupation']);
  if (occupation != null) {
    familyMemberEntity.occupation = occupation;
  }
  final String? exactNatureOfDuties = jsonConvert.convert<String>(json['exactNatureOfDuties']);
  if (exactNatureOfDuties != null) {
    familyMemberEntity.exactNatureOfDuties = exactNatureOfDuties;
  }
  final String? bloodGroup = jsonConvert.convert<String>(json['bloodGroup']);
  if (bloodGroup != null) {
    familyMemberEntity.bloodGroup = bloodGroup;
  }
  final String? relationWithHead = jsonConvert.convert<String>(json['relationWithHead']);
  if (relationWithHead != null) {
    familyMemberEntity.relationWithHead = relationWithHead;
  }
  final String? photoPath = jsonConvert.convert<String>(json['photoPath']);
  if (photoPath != null) {
    familyMemberEntity.photoPath = photoPath;
  }
  final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
  if (phoneNumber != null) {
    familyMemberEntity.phoneNumber = phoneNumber;
  }
  final String? alternativeNumber = jsonConvert.convert<String>(json['alternativeNumber']);
  if (alternativeNumber != null) {
    familyMemberEntity.alternativeNumber = alternativeNumber;
  }
  final String? landlineNumber = jsonConvert.convert<String>(json['landlineNumber']);
  if (landlineNumber != null) {
    familyMemberEntity.landlineNumber = landlineNumber;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    familyMemberEntity.email = email;
  }
  final String? socialMediaLink = jsonConvert.convert<String>(json['socialMediaLink']);
  if (socialMediaLink != null) {
    familyMemberEntity.socialMediaLink = socialMediaLink;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    familyMemberEntity.country = country;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    familyMemberEntity.state = state;
  }
  final String? district = jsonConvert.convert<String>(json['district']);
  if (district != null) {
    familyMemberEntity.district = district;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    familyMemberEntity.city = city;
  }
  final String? streetName = jsonConvert.convert<String>(json['streetName']);
  if (streetName != null) {
    familyMemberEntity.streetName = streetName;
  }
  final String? landmark = jsonConvert.convert<String>(json['landmark']);
  if (landmark != null) {
    familyMemberEntity.landmark = landmark;
  }
  final String? buildingName = jsonConvert.convert<String>(json['buildingName']);
  if (buildingName != null) {
    familyMemberEntity.buildingName = buildingName;
  }
  final String? doorNumber = jsonConvert.convert<String>(json['doorNumber']);
  if (doorNumber != null) {
    familyMemberEntity.doorNumber = doorNumber;
  }
  final String? flatNumber = jsonConvert.convert<String>(json['flatNumber']);
  if (flatNumber != null) {
    familyMemberEntity.flatNumber = flatNumber;
  }
  final String? pincode = jsonConvert.convert<String>(json['pincode']);
  if (pincode != null) {
    familyMemberEntity.pincode = pincode;
  }
  final String? nativeCity = jsonConvert.convert<String>(json['nativeCity']);
  if (nativeCity != null) {
    familyMemberEntity.nativeCity = nativeCity;
  }
  final String? nativeState = jsonConvert.convert<String>(json['nativeState']);
  if (nativeState != null) {
    familyMemberEntity.nativeState = nativeState;
  }
  return familyMemberEntity;
}

Map<String, dynamic> $FamilyMemberEntityToJson(FamilyMemberEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['firstName'] = entity.firstName;
  data['middleName'] = entity.middleName;
  data['lastName'] = entity.lastName;
  data['birthDate'] = entity.birthDate;
  data['age'] = entity.age;
  data['gender'] = entity.gender;
  data['maritalStatus'] = entity.maritalStatus;
  data['qualification'] = entity.qualification;
  data['occupation'] = entity.occupation;
  data['exactNatureOfDuties'] = entity.exactNatureOfDuties;
  data['bloodGroup'] = entity.bloodGroup;
  data['relationWithHead'] = entity.relationWithHead;
  data['photoPath'] = entity.photoPath;
  data['phoneNumber'] = entity.phoneNumber;
  data['alternativeNumber'] = entity.alternativeNumber;
  data['landlineNumber'] = entity.landlineNumber;
  data['email'] = entity.email;
  data['socialMediaLink'] = entity.socialMediaLink;
  data['country'] = entity.country;
  data['state'] = entity.state;
  data['district'] = entity.district;
  data['city'] = entity.city;
  data['streetName'] = entity.streetName;
  data['landmark'] = entity.landmark;
  data['buildingName'] = entity.buildingName;
  data['doorNumber'] = entity.doorNumber;
  data['flatNumber'] = entity.flatNumber;
  data['pincode'] = entity.pincode;
  data['nativeCity'] = entity.nativeCity;
  data['nativeState'] = entity.nativeState;
  return data;
}

extension FamilyMemberEntityExtension on FamilyMemberEntity {
  FamilyMemberEntity copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? birthDate,
    int? age,
    String? gender,
    String? maritalStatus,
    String? qualification,
    String? occupation,
    String? exactNatureOfDuties,
    String? bloodGroup,
    String? relationWithHead,
    String? photoPath,
    String? phoneNumber,
    String? alternativeNumber,
    String? landlineNumber,
    String? email,
    String? socialMediaLink,
    String? country,
    String? state,
    String? district,
    String? city,
    String? streetName,
    String? landmark,
    String? buildingName,
    String? doorNumber,
    String? flatNumber,
    String? pincode,
    String? nativeCity,
    String? nativeState,
  }) {
    return FamilyMemberEntity()
      ..firstName = firstName ?? this.firstName
      ..middleName = middleName ?? this.middleName
      ..lastName = lastName ?? this.lastName
      ..birthDate = birthDate ?? this.birthDate
      ..age = age ?? this.age
      ..gender = gender ?? this.gender
      ..maritalStatus = maritalStatus ?? this.maritalStatus
      ..qualification = qualification ?? this.qualification
      ..occupation = occupation ?? this.occupation
      ..exactNatureOfDuties = exactNatureOfDuties ?? this.exactNatureOfDuties
      ..bloodGroup = bloodGroup ?? this.bloodGroup
      ..relationWithHead = relationWithHead ?? this.relationWithHead
      ..photoPath = photoPath ?? this.photoPath
      ..phoneNumber = phoneNumber ?? this.phoneNumber
      ..alternativeNumber = alternativeNumber ?? this.alternativeNumber
      ..landlineNumber = landlineNumber ?? this.landlineNumber
      ..email = email ?? this.email
      ..socialMediaLink = socialMediaLink ?? this.socialMediaLink
      ..country = country ?? this.country
      ..state = state ?? this.state
      ..district = district ?? this.district
      ..city = city ?? this.city
      ..streetName = streetName ?? this.streetName
      ..landmark = landmark ?? this.landmark
      ..buildingName = buildingName ?? this.buildingName
      ..doorNumber = doorNumber ?? this.doorNumber
      ..flatNumber = flatNumber ?? this.flatNumber
      ..pincode = pincode ?? this.pincode
      ..nativeCity = nativeCity ?? this.nativeCity
      ..nativeState = nativeState ?? this.nativeState;
  }
}
