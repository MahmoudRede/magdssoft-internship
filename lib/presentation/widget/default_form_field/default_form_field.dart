import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';


class DefaultFormField extends StatelessWidget {

  final String hint;
  final bool isPassword;
  final TextInputType textInputType;
  final TextEditingController controller;
  final IconData ?suffixIcon;
  final Function ?suffixFunction;
  Widget? prefixWidget;
  final String validText;

   DefaultFormField({
    required this.hint,
    required this.controller,
    required this.textInputType,
    this.isPassword=false,
    this.suffixIcon,
    this.suffixFunction,
    this.prefixWidget,
    required this.validText,
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: AppColor.textFormFilledColor,
        filled: true,
        hintText: hint,
        hintStyle: GoogleFonts.lato(
          fontSize: 15.0,
          color: AppColor.textFormTextColor,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        prefixIcon: prefixWidget,
        suffixIcon: IconButton(onPressed: (){suffixFunction!();}, icon: Icon(suffixIcon),),
      ),
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 15,
      ),
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      validator: (value){
        if(value!.isEmpty){
          return validText;
        }
        else
        {
          return null;
        }
      },
    );
  }
}