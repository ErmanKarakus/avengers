import 'package:flutter/material.dart';

class PopUpWidget{
  static void noInternetToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Check your internet connection or network settings!", textAlign: TextAlign.center,style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.red.shade900,
        duration: const Duration(seconds: 4)));
  }

  static Future alertDialog(BuildContext context, String title, String text) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}