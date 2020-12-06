import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget progressBarIndicator() {
  return Dialog(
    child: new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new CircularProgressIndicator(),
        new Text("Loading"),
      ],
    ),
  );
}
