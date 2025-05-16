import 'package:flutter/material.dart';
import 'package:skilllink/core/common/custom_buttons.dart';
import 'package:skilllink/core/common/custom_ph_textfield.dart';
import 'package:skilllink/core/common/custom_textfield.dart';
import 'package:skilllink/core/models/country_codes.dart';
import 'package:skilllink/core/themes/app_colors.dart';

class Eregister extends StatefulWidget {
  const Eregister({Key? key}) : super(key: key);

  @override
  State<Eregister> createState() => _EregisterState();
}

class _EregisterState extends State<Eregister> {
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _businessNumber = TextEditingController();
  final TextEditingController _businessEmail = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _password = TextEditingController();

  CountryCode _selectedCountry = CountryCodes.getCountryByCode('IN'); // Iraq

  @override
  void dispose() {
    _companyName.dispose();
    _businessNumber.dispose();
    _businessEmail.dispose();
    _country.dispose();
    _address.dispose();
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
              const SizedBox(height: 20),
              const Text(
                "Let's create your\naccount.",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Company Name Field
              _buildFieldLabel("Company name", true),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _companyName,
                keyboardType: TextInputType.text,
                hint: "Air India",
                textcolor: AppColors.blue,
                focused: AppColors.blue,
                fillColor: AppColors.white,
                hinttextcolor: AppColors.black,
                cursor: AppColors.black,
                prefixIcon: Icons.business,
                prefixIconColor: AppColors.blue,
              ),
              const SizedBox(height: 10),

              // Business Number Field
              _buildFieldLabel("Business number", true),
              const SizedBox(height: 8),
              PhoneTextField(
                controller: _businessNumber,
                hint: "Phone number",
                textcolor: AppColors.blue,
                focused: AppColors.blue,
                fillColor: AppColors.white,
                hinttextcolor: AppColors.black,
                cursor: AppColors.black,
                initialCountryCode: 'IN',
                maxLength: 10,
                onCountryChanged: (CountryCode country) {
                  setState(() {
                    _selectedCountry = country;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Business Email Field
              _buildFieldLabel("Business email", true),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _businessEmail,
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

              // Country Field
              _buildFieldLabel("Country", true),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _country,
                keyboardType: TextInputType.text,
                hint: "Iraq",
                textcolor: AppColors.blue,
                focused: AppColors.blue,
                fillColor: AppColors.white,
                hinttextcolor: AppColors.black,
                cursor: AppColors.black,
                prefixIcon: Icons.map,
                prefixIconColor: AppColors.blue,
              ),
              const SizedBox(height: 20),

              // Address Field
              _buildFieldLabel("Address", true),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _address,
                keyboardType: TextInputType.text,
                hint: "Karada - 62",
                textcolor: AppColors.blue,
                focused: AppColors.blue,
                fillColor: AppColors.white,
                hinttextcolor: AppColors.black,
                cursor: AppColors.black,
                prefixIcon: Icons.maps_home_work,
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
                        Navigator.pushNamed(context, '/elogin');
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
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
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
