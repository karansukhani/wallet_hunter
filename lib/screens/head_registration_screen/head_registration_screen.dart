import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_hunter/route/routing_constant.dart';
import 'package:wallet_hunter/screens/head_registration_screen/logic/head_registration_cubit.dart';
import 'package:wallet_hunter/screens/head_registration_screen/model/head_model_entity.dart';
import 'package:wallet_hunter/utils/color_constants.dart';
import 'package:wallet_hunter/utils/custom_snack_bar.dart';
import 'package:wallet_hunter/utils/dob_formatter.dart';
import 'package:wallet_hunter/utils/shared_preference/pref_key.dart';
import 'package:wallet_hunter/utils/shared_preference/shared_pref.dart';

class HeadRegistrationScreen extends StatefulWidget {
  const HeadRegistrationScreen({super.key});

  static Widget create() {
    return BlocProvider(
      create: (_) => HeadRegistrationCubit(),
      child: const HeadRegistrationScreen(),
    );
  }

  @override
  State<HeadRegistrationScreen> createState() => _HeadRegistrationScreenState();
}

class _HeadRegistrationScreenState extends State<HeadRegistrationScreen> {
  final registrationFormKey = GlobalKey<FormState>();

  // Profile Summary fields
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  TextEditingController ageController = TextEditingController();
  String gender = 'Male';
  String maritalStatus = 'Single';
  TextEditingController occupationController = TextEditingController();
  TextEditingController samajController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();

  // Personal Info Fields
  TextEditingController birthDateController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController dutiesController = TextEditingController();

  // Contact Info Fields
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController alternatePhoneController = TextEditingController();
  TextEditingController landlineController = TextEditingController();
  TextEditingController socialLinkController = TextEditingController();

  TextEditingController flatController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController nativeCityController = TextEditingController();
  TextEditingController nativeStateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F9FC),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Head Registration", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: BlocConsumer<HeadRegistrationCubit, HeadRegistrationState>(
          listener: (context, state) async {
            if (state is HeadSubmitted) {
              await SharedPref.setBool(PrefKey.isLogin, true);
              await showSnackBarGreen(context, "Head Registration Successful");
              Navigator.of(context).pushReplacementNamed(familyMemberListScreenRoute);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: registrationFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    sectionHeader(Icons.person, "Profile Information",
                        "Let’s start with your basic details and a profile picture."),
                    const SizedBox(height: 16),
                    registrationTextField("Full Name", nameController, hintText: "Enter your full name"),
                    registrationTextField("Email Address", emailController, validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Address is required";
                      }
                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    }, hintText: "e.g., example@domain.com", type: TextInputType.emailAddress),
                    const SizedBox(height: 20),
                    sectionHeader(Icons.calendar_today, "Personal Details", "Tell us more about yourself."),
                    const SizedBox(height: 16),
                    registrationTextField("Date of Birth", birthDateController,
                        hintText: "DD/MM/YYYY", inputFormatters: [DateOfBirthInputFormatter()]),
                    registrationDropdown(
                        "Gender", gender, ["Male", "Female", "Other"], (val) => setState(() => gender = val)),
                    registrationDropdown("Marital Status", maritalStatus, ["Single", "Married", "Divorced", "Widowed"],
                        (val) => setState(() => maritalStatus = val)),
                    registrationTextField("Occupation", occupationController, hintText: "e.g., Software Engineer"),
                    registrationDropdown(
                      "Samaj Name",
                      samajController.text,
                      ["Gujarati", "Rajasthani", "Marwadi", "Sindhi", "Punjabi", "Other"],
                      (val) => setState(() => samajController.text = val),
                    ),
                    registrationTextField("Qualification", qualificationController, hintText: "e.g., B.Tech, MBA"),
                    registrationTextField("Blood Group", bloodGroupController, hintText: "e.g., A+, B-"),
                    registrationTextField("Exact Nature of Duties", dutiesController,
                        hintText: "Describe your role or duties"),
                    const SizedBox(height: 20),
                    sectionHeader(Icons.phone, "Contact Information", "How can we reach you?"),
                    const SizedBox(height: 16),
                    registrationTextField("Phone Number", phoneController,
                        hintText: "e.g., +1 (555) 123-4567",
                        type: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        maxLength: 10),
                    registrationTextField("Alternate Email", alternatePhoneController, validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }

                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if ((value == null || value.isEmpty) && !emailRegex.hasMatch(value ?? '')) {
                        return "Enter a valid email address";
                      }
                      return null;
                    }, hintText: "example@gmail.com"),
                    //Kept empty validator as this field is not required/compulsory
                    registrationTextField("Landline Number", landlineController, hintText: "e.g., 079-12345678",
                        validator: (value) {
                      return null;
                    }, maxLength: 10),
                    //Keeping this value optional so no validator
                    registrationTextField("Social Media Link", socialLinkController,
                        hintText: "e.g., linkedin.com/in/yourname", validator: (value) {
                      return null;
                    }),
                    const SizedBox(height: 20),
                    sectionHeader(Icons.location_on, "Address Details", "Where do you reside?"),
                    const SizedBox(height: 16),
                    registrationTextField("Native City", nativeCityController, hintText: "e.g., Rajkot"),
                    registrationTextField("Native State", nativeStateController, hintText: "e.g., Gujarat"),
                    registrationTextField("Flat Number", flatController, hintText: "e.g., 302"),
                    registrationTextField("Building Name", buildingController, hintText: "e.g., Krishna Heights"),
                    registrationTextField("Landmark", landmarkController, hintText: "e.g., Near City Mall"),
                    registrationTextField("District", districtController, hintText: "e.g., Ahmedabad"),

                    registrationTextField("Street Name", streetController, hintText: "Street, Building, Apt. No."),
                    registrationTextField("City", cityController, hintText: "City"),
                    registrationTextField(
                      "State/Province",
                      stateController,
                      hintText: "State",
                    ),
                    registrationTextField("Postal Code", pincodeController,
                        hintText: "e.g., 90210",
                        type: TextInputType.number,
                        maxLength: 6,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                    registrationDropdown("Country", countryController.text, ["India", "USA", "UK", "Other"],
                        (val) => setState(() => countryController.text = val)),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ElevatedButton(
            onPressed: () {
              if (registrationFormKey.currentState!.validate()) {
                HeadModelEntity headModel = HeadModelEntity();
                headModel.name = nameController.text;
                headModel.age = int.tryParse(ageController.text) ?? 0;
                headModel.gender = gender;
                headModel.maritalStatus = maritalStatus;
                headModel.occupation = occupationController.text;
                headModel.samajName = samajController.text;
                headModel.qualification = qualificationController.text;
                headModel.birthDate = birthDateController.text;
                headModel.bloodGroup = bloodGroupController.text;
                headModel.exactNatureOfDuties = dutiesController.text;
                headModel.email = emailController.text;
                headModel.phoneNumber = phoneController.text;
                headModel.alternativeNumber = alternatePhoneController.text;
                headModel.landlineNumber = landlineController.text;
                headModel.socialMediaLink = socialLinkController.text;
                headModel.flatNumber = flatController.text;
                headModel.buildingName = buildingController.text;
                headModel.streetName = streetController.text;
                headModel.landmark = landmarkController.text;
                headModel.city = cityController.text;
                headModel.district = districtController.text;
                headModel.state = stateController.text;
                headModel.nativeCity = nativeCityController.text;
                headModel.nativeState = nativeStateController.text;
                headModel.country = countryController.text;
                headModel.pincode = pincodeController.text;
                SharedPref.setString(PrefKey.headModel, headModel.toString());
                SharedPref.setString(PrefKey.headphoneNumber, phoneController.text);
                context.read<HeadRegistrationCubit>().submitForm(headModel);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6C63FF),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Register",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
          ),
        ));
  }

  Widget sectionHeader(IconData icon, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: purple, size: 24),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }

  Widget registrationDropdown(String label, String currentValue, List<String> options, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: options.contains(currentValue) ? currentValue : null,
        onChanged: (val) => onChanged(val!),
        items: options.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        validator: (val) => val == null || val.isEmpty ? "$label is required" : null,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget registrationTextField(String label, TextEditingController controller,
      {TextInputType type = TextInputType.text,
      List<TextInputFormatter>? inputFormatters,
      required String hintText,
      int? maxLength,
      String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
        validator: validator ?? (val) => val == null || val.isEmpty ? "Please enter a valid $label" : null,
      ),
    );
  }
}
