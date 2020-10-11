import 'dart:convert';

import 'package:Eutychia/models/Questionnaire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Questionnaire1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Questionnaire>(
        future: parseJson(),
        builder: (context, AsyncSnapshot<Questionnaire> snapshot) {
          if (snapshot.hasData) {
            return Text('Done');
          } else {
            return Text('waiting');
          }
        });
  }
}

Future<Questionnaire> parseJson() async {
  String jsonString =
      await rootBundle.loadString('assets/questionnaires/questionnaire1.json');
  final jsonResponse = jsonDecode(jsonString);
  return Questionnaire.fromJson(jsonResponse);
}
