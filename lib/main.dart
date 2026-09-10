import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otlob/otlob_app.dart';

void main() {
  // Your main application code here

//  Map <String, dynamic> jsonResponse = {
//     "statusCode": 400,
//     "message": "One or more errors occurred!",
//     "errors": {
//         "email": [
//             "Email is not valid."
//         ],
//         "password": [
//             "Password must contain at least one uppercase letter.",
//             "Password must contain at least one special character."
//         ]
//     }
// };
// ErrorModel erroModel = ErrorModel.fromJson(jsonResponse);
// log('Status Code: ${erroModel.statusCode}');
// log('Message: ${erroModel.message}');
// log('Errors: ${erroModel.errors}');

  runApp(const Otlob());
}


// {
//     "statusCode": 400,
//     "message": "One or more errors occurred!",
//     "errors": {
//         "password": [
//             "Password must contain at least one uppercase letter.",
//             "Password must contain at least one special character."
//         ]
//     }
// }



//{
//     "statusCode": 400,
//     "message": "One or more errors occurred!",
//     "errors": {
//         "email": [
//             "Email is not valid."
//         ]
//     }
// }