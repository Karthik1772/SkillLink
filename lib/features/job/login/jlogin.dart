import 'package:flutter/material.dart';
import 'package:skilllink/core/common/custom_buttons.dart';
import 'package:skilllink/core/common/custom_textfield.dart';
import 'package:skilllink/core/themes/app_colors.dart';

class Jlogin extends StatefulWidget {
  const Jlogin({super.key});

  @override
  State<Jlogin> createState() => _JloginState();
}

class _JloginState extends State<Jlogin> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 120),
                const Text(
                  'Login to your\naccount.',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  fillColor: AppColors.white,
                  controller: _email,
                  keyboardType: TextInputType.name,
                  hint: 'example@example.com',
                  textcolor: AppColors.blue,
                  focused: AppColors.blue,
                  hinttextcolor: AppColors.black,
                  prefixIconColor: AppColors.blue,
                  cursor: AppColors.black,
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _pass,
                  keyboardType: TextInputType.name,
                  hint: 'Password',
                  textcolor: AppColors.blue,
                  focused: AppColors.blue,
                  hinttextcolor: AppColors.black,
                  prefixIconColor: AppColors.blue,
                  cursor: AppColors.black,
                  fillColor: AppColors.white,
                  prefixIcon: Icons.lock,
                  suffixIconColor: AppColors.blue,
                  isObscure: true,
                ),
                const SizedBox(height: 50),
                CustomButtons(
                  text: 'LOGIN',
                  fontsize: 16,
                  buttoncolor: AppColors.blue,
                  textcolor: AppColors.white,
                  onpressed: () {
                    Navigator.pushNamed(context, '/jhome');
                  },
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "You don't have an account yet? ",
                        style: TextStyle(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/jreqister');
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}