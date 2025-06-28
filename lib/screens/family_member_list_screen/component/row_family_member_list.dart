import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wallet_hunter/route/routing_constant.dart';
import 'package:wallet_hunter/screens/family_member_list_screen/model/family_member_entity.dart';
import 'package:wallet_hunter/utils/other.dart';

import '../../add_family_member_screen/arguments/edit_family_member_arguments.dart';

class RowFamilyMemberList extends StatefulWidget {
  final FamilyMemberEntity member;
  final VoidCallback onMemberDeleted;

  const RowFamilyMemberList({super.key, required this.member, required this.onMemberDeleted});

  @override
  State<RowFamilyMemberList> createState() => _RowFamilyMemberListState();
}

class _RowFamilyMemberListState extends State<RowFamilyMemberList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Slidable(
        key: ValueKey(widget.member.phoneNumber),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.onMemberDeleted();
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getFullName(widget.member.firstName, widget.member.middleName, widget.member.lastName),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.member.relationWithHead ?? '',
                      style: const TextStyle(fontSize: 14, color: Colors.deepPurple),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          widget.member.gender ?? '',
                          style: const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          widget.member.birthDate ?? '',
                          style: const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.deepPurple),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    addFamilyMemberFormScreenRoute,
                    arguments: EditFamilyMemberArguments(
                      isEditFlow: true,
                      familyMember: widget.member,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
