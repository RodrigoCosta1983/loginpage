import 'package:flutter/material.dart';
import 'package:loginpage/_comum/cores.dart';

InputDecoration getAuthenticationInputDecoration(String label) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(45),
    ),
    fillColor: Colors.white,
    filled: true,
    hintText: label,
    // contentPadding: const EdgeInsets.fromLTRB(left, top, right, bottom)
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(45),
      borderSide: const BorderSide(color: MyColors.darkBlue, width: 2),
    ),
    errorBorder: OutlineInputBorder(
   borderRadius: BorderRadius.circular(45),
    borderSide: const BorderSide(color: Colors.red, width: 2),
    ),


  );
}
