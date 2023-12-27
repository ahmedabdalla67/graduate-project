import 'package:flutter/material.dart';

const Color kMainColor = Colors.blue;

const String kFontFamily = 'Baloo2';

String? token = '';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size for each chunk
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

// void removeFromCache() {
//   CacheHelper.removeData(key: 'token').then((value) =>
//       Navigator.pushReplacement(context as BuildContext,
//           MaterialPageRoute(builder: (context) => const LoginView())));
// }
