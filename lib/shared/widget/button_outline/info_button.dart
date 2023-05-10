// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineInfoButton extends StatefulWidget {
  final String label;
  final Function onPressed;

  const OutlineInfoButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  OutlineInfoButtonState createState() => OutlineInfoButtonState();
}

class OutlineInfoButtonState extends State<OutlineInfoButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 42,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: _isPressed ? const Color(0xff8950fc) : Colors.white,
          foregroundColor: const Color(0xff5f37af),
          side: const BorderSide(
            color: Color(0xff8950fc),
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
            color: _isPressed ? Colors.white : const Color(0xff8950fc),
          ),
        ),
      ),
    );
  }
}
