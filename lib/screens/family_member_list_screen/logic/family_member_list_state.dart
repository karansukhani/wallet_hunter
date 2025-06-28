part of 'family_member_list_cubit.dart';

sealed class FamilyMemberListState {}

class FamilyMemberListInitial extends FamilyMemberListState {}

class FamilyMemberListLoading extends FamilyMemberListState {}

class FamilyMemberListSuccess extends FamilyMemberListState {
  List<FamilyMemberEntity> familyMemberList;

  FamilyMemberListSuccess(this.familyMemberList);
}

class FamilyMemberListEmpty extends FamilyMemberListState {}

class FamilyMemberListError extends FamilyMemberListState {
  String errorMessage;

  FamilyMemberListError(this.errorMessage);
}

class AddFamilyMemberLoading extends FamilyMemberListState {}

class AddFamilyMemberSuccess extends FamilyMemberListState {}

class AddFamilyMemberError extends FamilyMemberListState {
  String errorMessage;

  AddFamilyMemberError(this.errorMessage);
}

class DeleteFamilyMemberLoading extends FamilyMemberListState {}

class DeleteFamilyMemberSuccess extends FamilyMemberListState {
  List<FamilyMemberEntity> updatedFamilyMemberList;

  DeleteFamilyMemberSuccess(this.updatedFamilyMemberList);
}

class DeleteFamilyMemberError extends FamilyMemberListState {
  String errorMessage;

  DeleteFamilyMemberError(this.errorMessage);
}
