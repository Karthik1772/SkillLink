import 'package:flutter/material.dart';

class CountryCode {
  final String name;
  final String dialCode;
  final String code;
  final String flag;

  const CountryCode({
    required this.name,
    required this.dialCode,
    required this.code,
    required this.flag,
  });
}

class CountryCodes {
  static const List<CountryCode> codes = [
    CountryCode(name: 'Afghanistan', dialCode: '+93', code: 'AF', flag: '🇦🇫'),
    CountryCode(name: 'Albania', dialCode: '+355', code: 'AL', flag: '🇦🇱'),
    CountryCode(name: 'Algeria', dialCode: '+213', code: 'DZ', flag: '🇩🇿'),
    CountryCode(name: 'Argentina', dialCode: '+54', code: 'AR', flag: '🇦🇷'),
    CountryCode(name: 'Australia', dialCode: '+61', code: 'AU', flag: '🇦🇺'),
    CountryCode(name: 'Austria', dialCode: '+43', code: 'AT', flag: '🇦🇹'),
    CountryCode(name: 'Bangladesh', dialCode: '+880', code: 'BD', flag: '🇧🇩'),
    CountryCode(name: 'Belgium', dialCode: '+32', code: 'BE', flag: '🇧🇪'),
    CountryCode(name: 'Brazil', dialCode: '+55', code: 'BR', flag: '🇧🇷'),
    CountryCode(name: 'Canada', dialCode: '+1', code: 'CA', flag: '🇨🇦'),
    CountryCode(name: 'China', dialCode: '+86', code: 'CN', flag: '🇨🇳'),
    CountryCode(name: 'Egypt', dialCode: '+20', code: 'EG', flag: '🇪🇬'),
    CountryCode(name: 'France', dialCode: '+33', code: 'FR', flag: '🇫🇷'),
    CountryCode(name: 'Germany', dialCode: '+49', code: 'DE', flag: '🇩🇪'),
    CountryCode(name: 'Greece', dialCode: '+30', code: 'GR', flag: '🇬🇷'),
    CountryCode(name: 'India', dialCode: '+91', code: 'IN', flag: '🇮🇳'),
    CountryCode(name: 'Indonesia', dialCode: '+62', code: 'ID', flag: '🇮🇩'),
    CountryCode(name: 'Iran', dialCode: '+98', code: 'IR', flag: '🇮🇷'),
    CountryCode(name: 'Iraq', dialCode: '+964', code: 'IQ', flag: '🇮🇶'),
    CountryCode(name: 'Ireland', dialCode: '+353', code: 'IE', flag: '🇮🇪'),
    CountryCode(name: 'Italy', dialCode: '+39', code: 'IT', flag: '🇮🇹'),
    CountryCode(name: 'Japan', dialCode: '+81', code: 'JP', flag: '🇯🇵'),
    CountryCode(name: 'Jordan', dialCode: '+962', code: 'JO', flag: '🇯🇴'),
    CountryCode(name: 'Kuwait', dialCode: '+965', code: 'KW', flag: '🇰🇼'),
    CountryCode(name: 'Lebanon', dialCode: '+961', code: 'LB', flag: '🇱🇧'),
    CountryCode(name: 'Malaysia', dialCode: '+60', code: 'MY', flag: '🇲🇾'),
    CountryCode(name: 'Mexico', dialCode: '+52', code: 'MX', flag: '🇲🇽'),
    CountryCode(name: 'Morocco', dialCode: '+212', code: 'MA', flag: '🇲🇦'),
    CountryCode(name: 'Netherlands', dialCode: '+31', code: 'NL', flag: '🇳🇱'),
    CountryCode(name: 'New Zealand', dialCode: '+64', code: 'NZ', flag: '🇳🇿'),
    CountryCode(name: 'Nigeria', dialCode: '+234', code: 'NG', flag: '🇳🇬'),
    CountryCode(name: 'Norway', dialCode: '+47', code: 'NO', flag: '🇳🇴'),
    CountryCode(name: 'Pakistan', dialCode: '+92', code: 'PK', flag: '🇵🇰'),
    CountryCode(name: 'Philippines', dialCode: '+63', code: 'PH', flag: '🇵🇭'),
    CountryCode(name: 'Poland', dialCode: '+48', code: 'PL', flag: '🇵🇱'),
    CountryCode(name: 'Portugal', dialCode: '+351', code: 'PT', flag: '🇵🇹'),
    CountryCode(name: 'Qatar', dialCode: '+974', code: 'QA', flag: '🇶🇦'),
    CountryCode(name: 'Russia', dialCode: '+7', code: 'RU', flag: '🇷🇺'),
    CountryCode(name: 'Saudi Arabia', dialCode: '+966', code: 'SA', flag: '🇸🇦'),
    CountryCode(name: 'Singapore', dialCode: '+65', code: 'SG', flag: '🇸🇬'),
    CountryCode(name: 'South Africa', dialCode: '+27', code: 'ZA', flag: '🇿🇦'),
    CountryCode(name: 'South Korea', dialCode: '+82', code: 'KR', flag: '🇰🇷'),
    CountryCode(name: 'Spain', dialCode: '+34', code: 'ES', flag: '🇪🇸'),
    CountryCode(name: 'Sweden', dialCode: '+46', code: 'SE', flag: '🇸🇪'),
    CountryCode(name: 'Switzerland', dialCode: '+41', code: 'CH', flag: '🇨🇭'),
    CountryCode(name: 'Syria', dialCode: '+963', code: 'SY', flag: '🇸🇾'),
    CountryCode(name: 'Thailand', dialCode: '+66', code: 'TH', flag: '🇹🇭'),
    CountryCode(name: 'Turkey', dialCode: '+90', code: 'TR', flag: '🇹🇷'),
    CountryCode(name: 'UAE', dialCode: '+971', code: 'AE', flag: '🇦🇪'),
    CountryCode(name: 'United Kingdom', dialCode: '+44', code: 'GB', flag: '🇬🇧'),
    CountryCode(name: 'United States', dialCode: '+1', code: 'US', flag: '🇺🇸'),
    CountryCode(name: 'Yemen', dialCode: '+967', code: 'YE', flag: '🇾🇪'),
  ];

  static CountryCode getCountryByCode(String code) {
    return codes.firstWhere(
      (country) => country.code == code,
      orElse: () => codes.firstWhere((country) => country.code == 'US'),
    );
  }
  
  static CountryCode getCountryByDialCode(String dialCode) {
    return codes.firstWhere(
      (country) => country.dialCode == dialCode,
      orElse: () => codes.firstWhere((country) => country.dialCode == '+1'),
    );
  }
}

class CountryCodePicker extends StatefulWidget {
  final Function(CountryCode) onChanged;
  final CountryCode initialSelection;
  final Color textColor;

  const CountryCodePicker({
    Key? key,
    required this.onChanged,
    required this.initialSelection,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  late CountryCode _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = widget.initialSelection;
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Select Country',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: CountryCodes.codes.length,
                  itemBuilder: (context, index) {
                    final country = CountryCodes.codes[index];
                    return ListTile(
                      leading: Text(
                        country.flag,
                        style: TextStyle(fontSize: 24),
                      ),
                      title: Text(country.name),
                      subtitle: Text(
                        country.dialCode,
                        style: TextStyle(
                          color: country.code == _selectedCountry.code ? widget.textColor : null,
                          fontWeight: country.code == _selectedCountry.code ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedCountry = country;
                        });
                        widget.onChanged(country);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showCountryPicker,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_selectedCountry.flag, style: TextStyle(fontSize: 18)),
            const SizedBox(width: 4),
            Text(
              _selectedCountry.dialCode,
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
            const SizedBox(width: 4),
            Container(
              width: 1,
              height: 24,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}