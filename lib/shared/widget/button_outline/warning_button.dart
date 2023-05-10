// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineWarningButton extends StatefulWidget {
  final String label;
  final Function onPressed;

  const OutlineWarningButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  OutlineWarningButtonState createState() => OutlineWarningButtonState();
}

class OutlineWarningButtonState extends State<OutlineWarningButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 42,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: _isPressed ? const Color(0xffFFA800) : Colors.white,
          foregroundColor: const Color(0xffb27500),
          side: const BorderSide(
            color: Color(0xffFFA800),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
          widget.onPressed();
        },
        child: Text(
          widget.label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: _isPressed ? Colors.white : const Color(0xffFFA800),
          ),
        ),
      ),
    );
  }
}
