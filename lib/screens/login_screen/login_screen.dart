import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_hunter/route/routing_constant.dart';
import 'package:wallet_hunter/utils/custom_snack_bar.dart';
import 'package:wallet_hunter/utils/progress_dialog.dart';
import 'package:wallet_hunter/utils/shared_preference/pref_key.dart';
import 'package:wallet_hunter/utils/shared_preference/shared_pref.dart';

import 'logic/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Widget create() {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  TextEditingController otpController = TextEditingController();
  FocusNode otpFocusNode = FocusNode();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  bool showOtp = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is OtpLoading) {
          ProgressDialog.show(context);
        } else if (state is OtpSent) {
          Navigator.of(context).pop(); // Pop dialog
          showSnackBarGreen(context, "OTP sent to your mobile successfully");
          otpFocusNode.requestFocus();
          setState(() => showOtp = true);
        } else if (state is OtpVerified) {
          Navigator.of(context).pop(); // Pop dialog
          SharedPref.setString(PrefKey.registeredMobileNumber, phoneController.text);
          await showSnackBarGreen(context, "OTP Verified!");
          Navigator.of(context).pushReplacementNamed(headRegistrationScreenRoute);
        } else if (state is OtpFailed) {
          Navigator.of(context).pop(); // Pop dialog

          showSnackBarRed(context, state.message);
          otpFocusNode.requestFocus();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF2F1FF),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFEDEAFF), Color(0xFFFCE9F1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.groups_rounded, size: 64, color: Colors.pinkAccent),
                      SizedBox(height: 12),
                      Text(
                        "Family Connect",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Unite Your Family Legacy",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 220),
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2)),
                      ],
                    ),
                    child: Form(
                      key: loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Phone Verification",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Enter your mobile number to receive a verification code.",
                            style: TextStyle(color: Colors.black54, fontSize: 14),
                          ),
                          const SizedBox(height: 20),
                          const Text("Mobile Number", style: TextStyle(fontWeight: FontWeight.w500)),
                          const SizedBox(height: 4),
                          TextFormField(
                            controller: phoneController,
                            focusNode: phoneFocusNode,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            validator: (text) {
                              if ((text ?? '').length < 10) return "Enter a valid mobile number";
                              return null;
                            },
                            onChanged: (text) {
                              if (showOtp) {
                                setState(() {
                                  showOtp = false;
                                });
                              }
                            },
                            onFieldSubmitted: (_) {
                              if (loginFormKey.currentState!.validate()) {
                                context.read<LoginCubit>().sendOtp(phoneController.text);
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "e.g., 1234567890",
                              counterText: '',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            ),
                          ),
                          const SizedBox(height: 16),
                          if (showOtp)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Enter OTP", style: TextStyle(fontWeight: FontWeight.w500)),
                                const SizedBox(height: 4),
                                TextFormField(
                                  controller: otpController,
                                  focusNode: otpFocusNode,
                                  keyboardType: TextInputType.number,
                                  maxLength: 4,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  validator: (text) {
                                    if ((text ?? '').length < 4) return "Enter valid 4-digit OTP";
                                    return null;
                                  },
                                  onFieldSubmitted: (_) {
                                    if (loginFormKey.currentState!.validate()) {
                                      context.read<LoginCubit>().verifyOtp(otpController.text);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "4-digit OTP",
                                    counterText: '',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                    suffixIcon: TextButton(
                                      onPressed: () {
                                        context.read<LoginCubit>().sendOtp(phoneController.text);
                                      },
                                      child: const Text("Resend"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (loginFormKey.currentState!.validate()) {
                                  if (!showOtp) {
                                    context.read<LoginCubit>().sendOtp(phoneController.text);
                                  } else {
                                    context.read<LoginCubit>().verifyOtp(otpController.text);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6C63FF),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                showOtp ? "Login" : "Send OTP",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
