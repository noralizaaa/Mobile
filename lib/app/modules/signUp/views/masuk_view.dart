import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/routes/app_routes.dart';
import '../controllers/masuk_controller.dart';
import '../widget/custom_masuk.dart';

class MasukView extends GetView<MasukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE65100), // Orange background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back button and Sign Up title
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Get.back(),
                    ),
                    Spacer(),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
                SizedBox(height: 20),
                // White form container
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Input Fields
                      CustomMasuk(
                        label: "Full name",
                        controller: controller.fullNameController,
                      ),
                      CustomMasuk(
                        label: "Password",
                        controller: controller.passwordController,
                        isPassword: true,
                      ),
                      CustomMasuk(
                        label: "Email",
                        controller: controller.emailController,
                      ),
                      CustomMasuk(
                        label: "Mobile Number",
                        controller: controller.mobileNumberController,
                      ),
                      CustomMasuk(
                        label: "Date of birth",
                        controller: controller.dobController,
                      ),
                      SizedBox(height: 10),
                      // Terms and conditions
                      Text(
                        "By continuing, you agree to our Terms of Use and Privacy Policy.",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(height: 20),
                      // Sign Up Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.HOMEPAGE);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE95322), // Button color
                            padding: EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "or sign up with",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Social media sign up buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset('assets/icons/google.png'),
                            iconSize: 40,
                            onPressed: () {
                              // Google sign up
                            },
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            icon: Image.asset('assets/icons/facebook.png'),
                            iconSize: 40,
                            onPressed: () {
                              // Facebook sign up
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to Sign In screen
                            Get.toNamed("/signin");
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: TextStyle(
                                    color: Color(0xFFE95322),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}