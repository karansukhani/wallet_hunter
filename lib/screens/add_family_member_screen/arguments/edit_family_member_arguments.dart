import 'package:wallet_hunter/screens/family_member_list_screen/model/family_member_entity.dart';

class EditFamilyMemberArguments {
  final bool isEditFlow;
  final FamilyMemberEntity? familyMember;

  EditFamilyMemberArguments({
    this.isEditFlow = false,
    this.familyMember,
  });
}
