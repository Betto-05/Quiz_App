import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<dynamic> quitGame(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: SizedBox(
        height: MediaQuery.of(context).size.height * 0.180,
        child: Image.asset(
          "assets/3.png",
        ),
      ),
      title: Text(
        "Quit Cognify",
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.02,
            color: Colors.blue.shade900),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child:
                        const Text("OK", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.01,
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.blue.shade900),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel",
                        style: TextStyle(color: Colors.blue.shade900)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
