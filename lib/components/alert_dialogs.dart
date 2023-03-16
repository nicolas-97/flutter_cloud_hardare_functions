import 'package:flutter/material.dart';

class AlertsDialogs {

  BuildContext context;

  AlertsDialogs(this.context);

  Future<void> errorLogin(String messages) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Can't login",
            style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w800
                  ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(messages,
                  style: TextStyle(
                    color: Colors.red[200],
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
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