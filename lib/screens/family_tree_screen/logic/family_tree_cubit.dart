import 'package:bloc/bloc.dart';
import 'package:wallet_hunter/utils/shared_preference/pref_value.dart';

import '../../family_member_list_screen/model/family_member_entity.dart';
import '../../head_registration_screen/model/head_model_entity.dart';

part 'family_tree_state.dart';

class FamilyTreeCubit extends Cubit<FamilyTreeState> {
  FamilyTreeCubit() : super(FamilyTreeInitial());

  Future<void> loadFamilyTree() async {
    emit(FamilyTreeLoading());
    try {
      HeadModelEntity headModel = await PrefValue.headModel();

      List<FamilyMemberEntity> members = await PrefValue.familyMemberList();

      List<FamilyMemberEntity> spouseChildrenList =
          members.where((m) => m.relationWithHead == "Spouse" || m.relationWithHead == "Child").toList();

      List<FamilyMemberEntity> grandChildrenList =
          members.where((m) => m.relationWithHead == "Grandson" || m.relationWithHead == "Granddaughter").toList();

      List<FamilyMemberEntity> extendedFamilyList = members
          .where((m) =>
              m.relationWithHead == "Father" || m.relationWithHead == "Mother" || m.relationWithHead == "Sibling")
          .toList();
      emit(FamilyTreeSuccess(
        head: headModel,
        spouseChildren: spouseChildrenList,
        grandChildren: grandChildrenList,
        extendedFamily: extendedFamilyList,
      ));
    } catch (e) {
      emit(FamilyTreeError("Failed to load family tree"));
    }
  }
}
