import 'package:bloc/bloc.dart';
import 'package:wallet_hunter/screens/family_member_list_screen/model/family_member_entity.dart';
import 'package:wallet_hunter/utils/shared_preference/pref_key.dart';
import 'package:wallet_hunter/utils/shared_preference/pref_value.dart';
import 'package:wallet_hunter/utils/shared_preference/shared_pref.dart';

part 'family_member_list_state.dart';

class FamilyMemberListCubit extends Cubit<FamilyMemberListState> {
  FamilyMemberListCubit() : super(FamilyMemberListInitial());

  Future<void> getFamilyMemberList() async {
    emit(FamilyMemberListLoading());

    List<FamilyMemberEntity> familyMemberList = await PrefValue.familyMemberList();

    if (familyMemberList.isEmpty) {
      emit(FamilyMemberListEmpty());
    } else {
      emit(FamilyMemberListSuccess(familyMemberList));
    }
  }

  Future<void> addFamilyMember(FamilyMemberEntity familyMemberData) async {
    emit(AddFamilyMemberLoading());
    List<FamilyMemberEntity> familyMemberList = await PrefValue.familyMemberList();

    familyMemberList.add(familyMemberData);
    await SharedPref.setString(PrefKey.familyMembersList, familyMemberList.toString());
    emit(AddFamilyMemberSuccess());
  }

  Future<void> updateFamilyMember(FamilyMemberEntity updatedMember) async {
    emit(AddFamilyMemberLoading());
    List<FamilyMemberEntity> familyMemberList = await PrefValue.familyMemberList();

    int index = familyMemberList
        .indexWhere((member) => member.phoneNumber != null && member.phoneNumber == updatedMember.phoneNumber);

    if (index != -1) {
      familyMemberList[index] = updatedMember;

      await SharedPref.setString(
        PrefKey.familyMembersList,
        familyMemberList.toString(),
      );

      emit(AddFamilyMemberSuccess());
    } else {
      emit(AddFamilyMemberError("Family member not found for update."));
    }
  }

  Future<void> deleteFamilyMember(FamilyMemberEntity memberToDelete) async {
    emit(DeleteFamilyMemberLoading());

    try {
      List<FamilyMemberEntity> familyMemberList = await PrefValue.familyMemberList();

      familyMemberList.removeWhere(
          (member) => member.phoneNumber == memberToDelete.phoneNumber && member.email == memberToDelete.email);

      await SharedPref.setString(
        PrefKey.familyMembersList,
        familyMemberList.toString(),
      );

      if (familyMemberList.isEmpty) {
        emit(FamilyMemberListEmpty());
      } else {
        emit(DeleteFamilyMemberSuccess(familyMemberList));
      }
    } catch (e) {
      emit(DeleteFamilyMemberError("Failed to delete member: $e"));
    }
  }
}
