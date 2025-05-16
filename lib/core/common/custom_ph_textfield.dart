import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skilllink/core/models/country_codes.dart';
import 'package:skilllink/core/themes/app_colors.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Color textcolor;
  final Color focused;
  final Color? fillColor;
  final Color hinttextcolor;
  final Color cursor;
  final bool? isEnabled;
  final Function(CountryCode)? onCountryChanged;
  final String initialCountryCode;
  final int maxLength;

  const PhoneTextField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.textcolor,
    required this.focused,
    required this.fillColor,
    required this.hinttextcolor,
    required this.cursor,
    this.isEnabled = true,
    this.onCountryChanged,
    this.initialCountryCode = 'IN',
    this.maxLength = 10,
  }) : super(key: key);

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  late CountryCode _selectedCountry;
  late int _characterCount;

  @override
  void initState() {
    super.initState();
    _selectedCountry = CountryCodes.getCountryByCode(widget.initialCountryCode);
    _characterCount = widget.controller.text.length;
    
    // Add listener to track character count
    widget.controller.addListener(_updateCharacterCount);
  }

  void _updateCharacterCount() {
    setState(() {
      _characterCount = widget.controller.text.length;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateCharacterCount);
    super.dispose();
  }

  OutlineInputBorder _borderTheme([
    Color borderColor = Colors.grey,
    double width = 1,
  ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: borderColor, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      keyboardType: TextInputType.phone,
      controller: widget.controller,
      cursorColor: widget.cursor,
      cursorHeight: 18,
      style: TextStyle(color: widget.textcolor),
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.maxLength),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor,
        prefixIcon: CountryCodePicker(
          initialSelection: _selectedCountry,
          textColor: widget.textcolor, // Pass the text color to the picker
          onChanged: (CountryCode country) {
            setState(() {
              _selectedCountry = country;
            });
            if (widget.onCountryChanged != null) {
              widget.onCountryChanged!(country);
            }
          },
        ),
        hintStyle: TextStyle(color: widget.hinttextcolor),
        hintText: widget.hint,
        suffixText: "$_characterCount/${widget.maxLength}",
        suffixStyle: TextStyle(color: Colors.grey),
        errorBorder: _borderTheme(AppColors.red, 2),
        focusedBorder: _borderTheme(widget.focused, 2),
        enabledBorder: _borderTheme(),
        disabledBorder: _borderTheme(),
        border: _borderTheme(),
      ),
    );
  }
}