import 'dart:io';
import 'package:flutter/material.dart';
import './app.dart';

class startButton extends StatelessWidget {
  startButton({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        padding: const EdgeInsets.all(15),
        color: const Color(0xffa9a09d),
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
            side: BorderSide(width: 7, color: const Color(0xff000000))),
        child: Text(
          "START",
          style: TextStyle(
            fontFamily: 'Minecraftz2font',
            fontSize: 30,
            color: const Color(0xff000000),
          ),
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          final snackBar = SnackBar(content: Text("Please Wait"));
          Scaffold.of(context).showSnackBar(snackBar);
          final snackBar1 = SnackBar(content: Text(await startServer()));
          Scaffold.of(context).showSnackBar(snackBar1);
          while (await serverStatus() == "Waiting in queue") {
            print('waiting..');
            await queueConfirm();
          }
          await queueConfirm();
          exit(0);
        },
      ),
    );
  }
}
