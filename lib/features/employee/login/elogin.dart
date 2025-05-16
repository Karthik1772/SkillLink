import 'package:flutter/material.dart';
import 'package:skilllink/core/common/custom_buttons.dart';
import 'package:skilllink/core/common/custom_textfield.dart';
import 'package:skilllink/core/themes/app_colors.dart';

class Elogin extends StatefulWidget {
  const Elogin({Key? key}) : super(key: key);

  @override
  State<Elogin> createState() => _EloginState();
}

class _EloginState extends State<Elogin> {
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _email,
                  fillColor: AppColors.white,
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _pass,
                  fillColor: AppColors.white,
                  keyboardType: TextInputType.name,
                  hint: 'Password',
                  textcolor: AppColors.blue,
                  focused: AppColors.blue,
                  hinttextcolor: AppColors.black,
                  prefixIconColor: AppColors.blue,
                  cursor: AppColors.black,
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
                    Navigator.pushNamed(context, '/ehome');
                  },
                ),
                const SizedBox(height: 16),
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
                          Navigator.pushNamed(context, '/ereqister');
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
