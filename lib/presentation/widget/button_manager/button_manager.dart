import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class ButtonManager extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textFontSize;
  final FontWeight textFontWeight;
  final Color buttonColor;
  final double buttonPadding;
  final double buttonRadius;
  final Function function;

  const ButtonManager(
      {
        Key? key,
        required this.text,
        required this.textColor,
        required this.textFontSize,
        this.textFontWeight=FontWeight.normal,
        required this.buttonColor,
        this.buttonPadding=10,
        required this.buttonRadius,
        required this.function,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 142,
      height: 61,
      child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius)
          ),
          padding:  EdgeInsets.symmetric(
              vertical: buttonPadding
          ),
          color: buttonColor,
          onPressed:(){
            function();
          },
          child: Text(text,
            style:GoogleFonts.roboto(
                fontSize:textFontSize,
                color:textColor,
                fontWeight:textFontWeight,
            ),),
      ),
    );
  }
}