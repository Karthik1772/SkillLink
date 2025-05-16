import 'package:flutter/material.dart';
import 'package:skilllink/core/common/custom_buttons.dart';
import 'package:skilllink/core/common/custom_ph_textfield.dart';
import 'package:skilllink/core/common/custom_textfield.dart';
import 'package:skilllink/core/models/country_codes.dart';
import 'package:skilllink/core/themes/app_colors.dart';

class Jregister extends StatefulWidget {
  const Jregister({Key? key}) : super(key: key);

  @override
  State<Jregister> createState() => _JregisterState();
}

class _JregisterState extends State<Jregister> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  CountryCode _selectedCountry = CountryCodes.getCountryByCode(
    'IN',
  ); // Changed to India country code

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Let's create your\naccount.",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              _buildFieldLabel("Full name", true),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _name,
                keyboardType: TextInputType.text,
                hint: "Sadeq S. Mhana",
                textcolor: AppColors.blue,
                focused: AppColors.blue,
                fillColor: AppColors.white,
                hinttextcolor: AppColors.black,
                cursor: AppColors.black,
                prefixIcon: Icons.person,
                prefixIconColor: AppColors.blue,
              ),
              const SizedBox(height: 20),

              // Phone Number Field
              _buildFieldLabel("Phone number", true),
              const SizedBox(height: 8),
              PhoneTextField(
                controller: _phone,
                hint: "Phone number",
                textcolor: AppColors.blue,
                focused: AppColors.blue,
                fillColor: AppColors.white,
                hinttextcolor: AppColors.black,
                cursor: AppColors.black,
                initialCountryCode: 'IN', // Changed to India
                maxLength: 10,
                onCountryChanged: (CountryCode country) {
                  setState(() {
                    _selectedCountry = country;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Email Field
              _buildFieldLabel("Email", true),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                hint: "example@example.com",
                textcolor: AppColors.blue,
                focused: AppColors.blue,
                fillColor: AppColors.white,
                hinttextcolor: AppColors.black,
                cursor: AppColors.black,
                prefixIcon: Icons.email,
                prefixIconColor: AppColors.blue,
              ),
              const SizedBox(height: 20),

              // Password Field
              _buildFieldLabel("Password", true),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _password,
                isObscure: true,
                keyboardType: TextInputType.visiblePassword,
                hint: "Password",
                textcolor: AppColors.blue,
                focused: AppColors.blue,
                fillColor: AppColors.white,
                hinttextcolor: AppColors.black,
                cursor: AppColors.black,
                prefixIcon: Icons.lock,
                prefixIconColor: AppColors.blue,
              ),
              const SizedBox(height: 40),

              // Sign Up Button
              CustomButtons(
                text: 'SIGN UP',
                fontsize: 16,
                buttoncolor: AppColors.blue,
                textcolor: AppColors.white,
                onpressed: () {
                  Navigator.pushNamed(context, '');
                },
              ),
              const SizedBox(height: 16),

              // Sign In Link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.black87),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label, bool isRequired) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        if (isRequired)
          Text(
            "*",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
