import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_hunter/route/routing_constant.dart';
import 'package:wallet_hunter/screens/add_family_member_screen/arguments/edit_family_member_arguments.dart';
import 'package:wallet_hunter/screens/family_member_list_screen/component/row_family_member_list.dart';
import 'package:wallet_hunter/screens/family_member_list_screen/logic/family_member_list_cubit.dart';
import 'package:wallet_hunter/utils/color_constants.dart';
import 'package:wallet_hunter/utils/custom_snack_bar.dart';
import 'package:wallet_hunter/utils/progress_dialog.dart';
import 'package:wallet_hunter/utils/shared_preference/shared_pref.dart';

import '../../utils/shared_preference/pref_key.dart';
import 'model/family_member_entity.dart';

class FamilyMemberListScreen extends StatefulWidget {
  const FamilyMemberListScreen({super.key});

  static Widget create() {
    return BlocProvider(
      create: (context) => FamilyMemberListCubit(),
      child: const FamilyMemberListScreen(),
    );
  }

  @override
  State<FamilyMemberListScreen> createState() => _FamilyMemberListScreenState();
}

class _FamilyMemberListScreenState extends State<FamilyMemberListScreen> {
  List<FamilyMemberEntity> familyMemberList = [];

  @override
  void initState() {
    super.initState();
    fetchFamilyMembersList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: purple),
      child: Scaffold(
        appBar: familyMemberListAppBar(),
        drawer: SafeArea(
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: purple),
                  child: Text(
                    'Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.temple_buddhist),
                  title: const Text('Linked Temples'),
                  onTap: () {
                    Navigator.pushNamed(context, templeListScreenRoute);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_tree),
                  title: const Text('Family Tree'),
                  onTap: () {
                    Navigator.of(context).pushNamed(familyTreeScreenRoute);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.power_settings_new_rounded),
                  title: const Text('Logout'),
                  onTap: () async {
                    await SharedPref.clearAll();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginScreenRoute,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: purple,
          shape: const CircleBorder(),
          onPressed: () async {
            Navigator.of(context).pushReplacementNamed(addFamilyMemberFormScreenRoute,
                arguments: EditFamilyMemberArguments(isEditFlow: false));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocConsumer<FamilyMemberListCubit, FamilyMemberListState>(
          listener: (context, state) {
            if (state is DeleteFamilyMemberLoading) {
              ProgressDialog.show(context);
            } else if (state is DeleteFamilyMemberSuccess) {
              Navigator.of(context).pop(); //pop dialog
            } else if (state is DeleteFamilyMemberError) {
              Navigator.of(context).pop(); //pop dialog
              showSnackBarRed(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is FamilyMemberListLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: purple,
                ),
              );
            } else if (state is FamilyMemberListSuccess) {
              familyMemberList = state.familyMemberList;
            } else if (state is FamilyMemberListEmpty) {
              return noRecordFoundView();
            } else if (state is DeleteFamilyMemberSuccess) {
              familyMemberList = state.updatedFamilyMemberList;
            }
            return ListView.builder(
                key: ValueKey(familyMemberList),
                itemBuilder: (context, index) {
                  return RowFamilyMemberList(
                    member: familyMemberList[index],
                    onMemberDeleted: () async {
                      String userPhoneNumber = await SharedPref.getString(PrefKey.registeredMobileNumber);
                      String headPhoneNumber = await SharedPref.getString(PrefKey.headphoneNumber);
                      if (userPhoneNumber.isNotEmpty &&
                          headPhoneNumber.isNotEmpty &&
                          headPhoneNumber == userPhoneNumber) {
                        bool? confirm = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Delete Member"),
                            content: const Text("Are you sure you want to delete this family member?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(false),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(true),
                                child: const Text("Delete", style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                        if (confirm ?? false) {
                          context.read<FamilyMemberListCubit>().deleteFamilyMember(familyMemberList[index]);
                        }
                      } else {
                        showSnackBarRed(context, "You Don't have permission to delete a member");
                      }
                    },
                  );
                },
                itemCount: familyMemberList.length);
          },
        ),
      ),
    );
  }

  void fetchFamilyMembersList() {
    context.read<FamilyMemberListCubit>().getFamilyMemberList();
  }

  Widget noRecordFoundView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
          "No Family Members Added Yet",
          textAlign: TextAlign.center,
          style: GoogleFonts.pacifico(
            fontSize: 22,
            color: const Color(0xFF7929D0),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  AppBar familyMemberListAppBar() {
    return AppBar(
      titleSpacing: 0,
      foregroundColor: Colors.white,
      backgroundColor: purple,
      title: const Text(
        "Family Members",
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
