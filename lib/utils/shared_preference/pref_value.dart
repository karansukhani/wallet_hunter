import 'dart:convert';

import 'package:wallet_hunter/screens/family_member_list_screen/model/family_member_entity.dart';
import 'package:wallet_hunter/screens/head_registration_screen/model/head_model_entity.dart';
import 'package:wallet_hunter/utils/shared_preference/pref_key.dart';
import 'package:wallet_hunter/utils/shared_preference/shared_pref.dart';

class PrefValue {
  static Future<List<FamilyMemberEntity>> familyMemberList() async {
    String familyMembers = await SharedPref.getString(PrefKey.familyMembersList);

    if (familyMembers.isEmpty) {
      return [];
    }
    List<FamilyMemberEntity> familyMemberList = (json.decode(familyMembers) as List<dynamic>)
        .map<FamilyMemberEntity>((item) => FamilyMemberEntity.fromJson(item))
        .toList();
    return familyMemberList;
  }

  static Future<HeadModelEntity> headModel() async {
    String headModelStr = await SharedPref.getString(PrefKey.headModel);
    HeadModelEntity headModel = HeadModelEntity.fromJson(json.decode(headModelStr));
    return headModel;
  }
}
