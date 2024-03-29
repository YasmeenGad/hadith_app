import 'package:flutter/material.dart';

class HadithText {
  static hadithText(BuildContext context, String text) {
    text = text.replaceAll("(", "{");
    text = text.replaceAll(")", "}");
    List<String> splits = text.split(RegExp("{"));
    List<String> hadiths =
        splits.getRange(1, splits.length).fold([], (previousValue, element) {
      var texts = element.split("}");
      if (texts.length > 1) {
        return List.from(previousValue)
          ..addAll(
              ["${texts.first}", "${element.substring(texts.first.length)}"]);
      } else {
        return List.from(previousValue)..addAll(["${texts.first}"]);
      }
    });
  }
}
