import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog displayAwesomeDialog( BuildContext context,{ String ?errorMessage, String? meesage}) {
    return AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: errorMessage?? meesage,
          btnOkOnPress: () {},
        )..show();
  }
