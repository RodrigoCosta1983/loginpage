import 'package:flutter/material.dart';

showSnackbar(
    {required BuildContext context,
    required String texto,
    bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(texto),
     backgroundColor: (isErro)?Colors.red : Colors.green,
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      label: "OK",
      textColor: Colors.white,
      onPressed: (){
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
    

  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

}
