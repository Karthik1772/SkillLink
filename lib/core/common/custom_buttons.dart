import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtons extends StatelessWidget { // Changed to StatelessWidget
  final String text;
  final VoidCallback onpressed;
  final Color buttoncolor;
  final Color? loadingcolor;
  final Color textcolor;
  final double fontsize;
  final bool isLoading;
  final Widget? child; // Added child property for flexibility
  const CustomButtons({
    super.key,
    required this.text,
    required this.fontsize,
    required this.buttoncolor,
    required this.textcolor,
    required this.onpressed,
    this.isLoading = false,
    this.loadingcolor,
    this.child, // Make child optional
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor,
          fixedSize: Size(MediaQuery.of(context).size.width, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: isLoading ? null : onpressed,
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: loadingcolor ??
                      Colors
                          .white, // Default to white if loadingcolor is null
                  strokeCap: StrokeCap.round,
                ),
              )
            : child ?? // Use child if provided, otherwise use the text
                Text(
                  text,
                  style: GoogleFonts.varelaRound(
                    color: textcolor,
                    fontSize: fontsize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
      ),
    );
  }
}
