part of 'family_tree_cubit.dart';

sealed class FamilyTreeState {}

final class FamilyTreeInitial extends FamilyTreeState {}

class FamilyTreeLoading extends FamilyTreeState {}

class FamilyTreeSuccess extends FamilyTreeState {
  final HeadModelEntity head;
  final List<FamilyMemberEntity> spouseChildren;
  final List<FamilyMemberEntity> grandChildren;
  final List<FamilyMemberEntity> extendedFamily;

  FamilyTreeSuccess({
    required this.head,
    required this.spouseChildren,
    required this.grandChildren,
    required this.extendedFamily,
  });
}

class FamilyTreeError extends FamilyTreeState {
  final String message;

  FamilyTreeError(this.message);

  @override
  List<Object?> get props => [message];
}
