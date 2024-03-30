import 'package:flutter/material.dart';
import 'package:hadith/model/hadith_model.dart';
import 'package:hadith/view/screens/hadith_content_view.dart';

class HadithContentViewBody extends StatelessWidget {
  const HadithContentViewBody({
    required this.data,
    required this.hadith,
  });
  final String data;
  final Hadith hadith;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          HadithContentView(
            data: data,
            hadith: hadith,
          )
        ],
      ),
    );
  }
}
