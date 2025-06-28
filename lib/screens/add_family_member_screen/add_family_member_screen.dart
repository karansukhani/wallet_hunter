import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_hunter/route/routing_constant.dart';
import 'package:wallet_hunter/screens/add_family_member_screen/arguments/edit_family_member_arguments.dart';
import 'package:wallet_hunter/screens/family_member_list_screen/logic/family_member_list_cubit.dart';
import 'package:wallet_hunter/screens/family_member_list_screen/model/family_member_entity.dart';
import 'package:wallet_hunter/utils/custom_snack_bar.dart';
import 'package:wallet_hunter/utils/dob_formatter.dart';
import 'package:wallet_hunter/utils/progress_dialog.dart';

import '../../utils/color_constants.dart';

class FamilyMemberFormScreen extends StatefulWidget {
  final bool isEditFlow;
  final FamilyMemberEntity? existingMember;

  const FamilyMemberFormScreen({
    super.key,
    this.isEditFlow = false,
    this.existingMember,
  });

  static Widget create(EditFamilyMemberArguments arguments) {
    return BlocProvider(
      create: (context) => FamilyMemberListCubit(),
      child: FamilyMemberFormScreen(isEditFlow: arguments.isEditFlow, existingMember: arguments.familyMember),
    );
  }

  @override
  State<FamilyMemberFormScreen> createState() => _FamilyMemberFormScreenState();
}

class _FamilyMemberFormScreenState extends State<FamilyMemberFormScreen> {
  final addFamilyMemberFormKey = GlobalKey<FormState>();

  String selectedCountry = "India";
  String selectedGender = "Male";
  String selectedRelationshipToHead = "Father";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String maritalStatus = "Single";
  TextEditingController qualificationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController dutiesController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();

  TextEditingController alternativeNumberController = TextEditingController();
  TextEditingController landlineNumberController = TextEditingController();
  TextEditingController socialLinkController = TextEditingController();

  TextEditingController districtController = TextEditingController();
  TextEditingController buildingNameController = TextEditingController();
  TextEditingController doorNumberController = TextEditingController();
  TextEditingController flatNumberController = TextEditingController();
  TextEditingController nativeCityController = TextEditingController();
  TextEditingController nativeStateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEditFlow && widget.existingMember != null) {
      final member = widget.existingMember!;
      firstNameController.text = member.firstName ?? '';
      middleNameController.text = member.middleName ?? '';
      lastNameController.text = member.lastName ?? '';
      dobController.text = member.birthDate ?? '';
      ageController.text = member.age?.toString() ?? '';
      qualificationController.text = member.qualification ?? '';
      occupationController.text = member.occupation ?? '';
      dutiesController.text = member.exactNatureOfDuties ?? '';
      bloodGroupController.text = member.bloodGroup ?? '';
      selectedGender = member.gender ?? 'Male';
      maritalStatus = member.maritalStatus ?? 'Single';
      selectedRelationshipToHead = member.relationWithHead ?? 'Father';

      emailController.text = member.email ?? '';
      phoneController.text = member.phoneNumber ?? '';
      alternativeNumberController.text = member.alternativeNumber ?? '';
      landlineNumberController.text = member.landlineNumber ?? '';
      socialLinkController.text = member.socialMediaLink ?? '';

      flatNumberController.text = member.flatNumber ?? '';
      doorNumberController.text = member.doorNumber ?? '';
      buildingNameController.text = member.buildingName ?? '';
      nativeCityController.text = member.nativeCity ?? '';
      nativeStateController.text = member.nativeState ?? '';
      streetNameController.text = member.streetName ?? '';
      landmarkController.text = member.landmark ?? '';
      cityController.text = member.city ?? '';
      districtController.text = member.district ?? '';
      stateController.text = member.state ?? '';
      postalCodeController.text = member.pincode ?? '';
      selectedCountry = member.country ?? 'India';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pushReplacementNamed(context, familyMemberListScreenRoute);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: purple),
            onPressed: () {
              Navigator.pushReplacementNamed(context, familyMemberListScreenRoute);
            },
          ),
          iconTheme: const IconThemeData(color: purple),
          title: Text(
            widget.isEditFlow ? "Edit Family Member" : 'Add Family Member',
            style: const TextStyle(color: purple),
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocListener<FamilyMemberListCubit, FamilyMemberListState>(
          listener: (context, state) async {
            if (state is AddFamilyMemberLoading) {
              ProgressDialog.show(context);
            } else if (state is AddFamilyMemberSuccess) {
              Navigator.of(context).pop(); //pop dialog
              await showSnackBarGreen(
                context,
                widget.isEditFlow ? "Member updated Successfully" : "Family Member Added Successfully",
              );
              Navigator.pushReplacementNamed(context, familyMemberListScreenRoute);
            } else if (state is AddFamilyMemberError) {
              Navigator.of(context).pop(); //pop dialog

              showSnackBarRed(context, state.errorMessage);
            }
          },
          child: Form(
            key: addFamilyMemberFormKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  cardWidget("Personal Details", [
                    TextFormField(
                      controller: firstNameController,
                      decoration: inputDecoration("First Name"),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter a Valid Name";
                        }
                      },
                    ),
                    TextFormField(
                      controller: middleNameController,
                      decoration: inputDecoration("Middle Name"),
                    ),
                    TextFormField(
                      controller: lastNameController,
                      decoration: inputDecoration("Last Name"),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter a Valid Name";
                        }
                      },
                    ),
                    TextFormField(
                      controller: dobController,
                      decoration: inputDecoration("Date of Birth"),
                      inputFormatters: [DateOfBirthInputFormatter()],
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                        controller: ageController,
                        decoration: inputDecoration("Age"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        maxLength: 2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Age is required";
                          }
                          return null;
                        }),
                    TextFormField(
                      controller: qualificationController,
                      decoration: inputDecoration("Qualification"),
                    ),
                    TextFormField(
                      controller: occupationController,
                      decoration: inputDecoration("Occupation"),
                    ),
                    TextFormField(
                      controller: dutiesController,
                      decoration: inputDecoration("Exact Nature of Duties"),
                    ),
                    TextFormField(
                      controller: bloodGroupController,
                      decoration: inputDecoration("Blood Group"),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                      decoration: inputDecoration("Gender"),
                      items: const [
                        DropdownMenuItem(value: "Male", child: Text("Male")),
                        DropdownMenuItem(value: "Female", child: Text("Female")),
                        DropdownMenuItem(value: "Other", child: Text("Other")),
                      ],
                      onChanged: (val) {
                        setState(() {
                          selectedGender = val ?? '';
                        });
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedRelationshipToHead,
                      decoration: inputDecoration("Relationship to Head"),
                      items: const [
                        DropdownMenuItem(value: "Father", child: Text("Father")),
                        DropdownMenuItem(value: "Mother", child: Text("Mother")),
                        DropdownMenuItem(value: "Spouse", child: Text("Spouse")),
                        DropdownMenuItem(value: "Child", child: Text("Child")),
                        DropdownMenuItem(value: "Sibling", child: Text("Sibling")),
                      ],
                      onChanged: (val) {
                        setState(() {
                          selectedRelationshipToHead = val ?? '';
                        });
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: maritalStatus,
                      decoration: inputDecoration("Marital Status"),
                      items: const [
                        DropdownMenuItem(value: "Single", child: Text("Single")),
                        DropdownMenuItem(value: "Married", child: Text("Married")),
                        DropdownMenuItem(value: "Divorced", child: Text("Divorced")),
                        DropdownMenuItem(value: "Widowed", child: Text("Widowed")),
                      ],
                      onChanged: (val) {
                        setState(() {
                          maritalStatus = val!;
                        });
                      },
                    ),
                  ]),
                  const SizedBox(height: 16),
                  cardWidget("Contact Information", [
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email Address is required";
                        }
                        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: inputDecoration("Email Address"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: inputDecoration("Phone Number"),
                      keyboardType: TextInputType.phone,
                      enabled: !widget.isEditFlow,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 10) {
                          return "Please enter a valid Phone Number";
                        }
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    TextFormField(
                      controller: alternativeNumberController,
                      decoration: inputDecoration("Alternative Number"),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    TextFormField(
                      controller: landlineNumberController,
                      decoration: inputDecoration("Landline Number"),
                      keyboardType: TextInputType.phone,
                    ),
                    TextFormField(
                      controller: socialLinkController,
                      decoration: inputDecoration("Social Media Link"),
                      keyboardType: TextInputType.url,
                    ),
                  ]),
                  const SizedBox(height: 16),
                  cardWidget("Address Details", [
                    TextFormField(
                      controller: flatNumberController,
                      decoration: inputDecoration("Flat Number"),
                      validator: (value) => value == null || value.isEmpty ? "Flat Number is required" : null,
                    ),
                    TextFormField(
                      controller: doorNumberController,
                      decoration: inputDecoration("Door Number"),
                      validator: (value) => value == null || value.isEmpty ? "Door Number is required" : null,
                    ),
                    TextFormField(
                      controller: buildingNameController,
                      decoration: inputDecoration("Building Name"),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => value == null || value.isEmpty ? "Building Name is required" : null,
                    ),
                    TextFormField(
                      controller: nativeCityController,
                      decoration: inputDecoration("Native City"),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => value == null || value.isEmpty ? "Native City is required" : null,
                    ),
                    TextFormField(
                      controller: nativeStateController,
                      decoration: inputDecoration("Native State"),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => value == null || value.isEmpty ? "Native State is required" : null,
                    ),
                    TextFormField(
                      controller: streetNameController,
                      decoration: inputDecoration("Street Name"),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => value == null || value.isEmpty ? "Street Name is required" : null,
                    ),
                    TextFormField(
                      controller: landmarkController,
                      decoration: inputDecoration("Landmark"),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => value == null || value.isEmpty ? "Landmark is required" : null,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration: inputDecoration("City"),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => value == null || value.isEmpty ? "City is required" : null,
                    ),
                    TextFormField(
                      controller: districtController,
                      decoration: inputDecoration("District"),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => value == null || value.isEmpty ? "District is required" : null,
                    ),
                    TextFormField(
                      controller: stateController,
                      decoration: inputDecoration("State/Province"),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) => value == null || value.isEmpty ? "State is required" : null,
                    ),
                    TextFormField(
                      controller: postalCodeController,
                      decoration: inputDecoration("Postal Code"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 6,
                      validator: (value) => value == null || value.isEmpty ? "Postal Code is required" : null,
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedCountry,
                      decoration: inputDecoration("Country"),
                      items: const [
                        DropdownMenuItem(value: "India", child: Text("India")),
                        DropdownMenuItem(value: "UAE", child: Text("UAE")),
                        DropdownMenuItem(value: "USA", child: Text("USA")),
                      ],
                      onChanged: (val) {
                        setState(() {
                          selectedCountry = val ?? '';
                        });
                      },
                    ),
                  ]),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: submitForm,
                      child: Text(widget.isEditFlow ? "Update Family Member" : "Save Family Member",
                          style: const TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Form submit method
  void submitForm() {
    if (addFamilyMemberFormKey.currentState?.validate() ?? false) {
      FamilyMemberEntity member = FamilyMemberEntity();
      member.firstName = firstNameController.text.trim();
      member.middleName = middleNameController.text.trim();
      member.lastName = lastNameController.text.trim();
      member.birthDate = dobController.text.trim();
      member.age = int.tryParse(ageController.text.trim()) ?? 0;
      member.gender = selectedGender;
      member.maritalStatus = maritalStatus;
      member.qualification = qualificationController.text.trim();
      member.occupation = occupationController.text.trim();
      member.exactNatureOfDuties = dutiesController.text.trim();
      member.bloodGroup = bloodGroupController.text.trim();
      member.relationWithHead = selectedRelationshipToHead;
      member.email = emailController.text.trim();
      member.phoneNumber = phoneController.text.trim();
      member.alternativeNumber = alternativeNumberController.text.trim();
      member.landlineNumber = landlineNumberController.text.trim();
      member.socialMediaLink = socialLinkController.text.trim();

      member.country = selectedCountry;
      member.state = stateController.text.trim();
      member.district = districtController.text.trim();
      member.city = cityController.text.trim();
      member.streetName = streetNameController.text.trim();
      member.landmark = landmarkController.text.trim();
      member.buildingName = buildingNameController.text.trim();
      member.doorNumber = doorNumberController.text.trim();
      member.flatNumber = flatNumberController.text.trim();
      member.pincode = postalCodeController.text.trim();
      member.nativeCity = nativeCityController.text.trim();
      member.nativeState = nativeStateController.text.trim();

      if (widget.isEditFlow) {
        context.read<FamilyMemberListCubit>().updateFamilyMember(member);
      } else {
        context.read<FamilyMemberListCubit>().addFamilyMember(member);
      }
    }
  }

  Widget cardWidget(String title, List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: purple,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < children.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: children[i],
              ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: purple),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: purple),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    ageController.dispose();
    emailController.dispose();
    phoneController.dispose();
    alternativeNumberController.dispose();
    landlineNumberController.dispose();
    socialLinkController.dispose();
    qualificationController.dispose();
    occupationController.dispose();
    dutiesController.dispose();
    bloodGroupController.dispose();

    streetNameController.dispose();
    landmarkController.dispose();
    buildingNameController.dispose();
    doorNumberController.dispose();
    flatNumberController.dispose();
    cityController.dispose();
    districtController.dispose();
    stateController.dispose();
    nativeCityController.dispose();
    nativeStateController.dispose();
    postalCodeController.dispose();

    super.dispose();
  }
}
