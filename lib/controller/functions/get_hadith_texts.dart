import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/controller/utils/constants/colors.dart';

class HadithText {
  static getHadithText(BuildContext context, String text) {
    text = text.replaceAll('(', '{');
    text = text.replaceAll(')', '}');

    List<String> split = text.split(RegExp("{"));

    List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
      var texts = e.split("}");

      if (texts.length > 1) {
        return List.from(t)
          ..addAll(
              ["{${texts.first}}", "${e.substring(texts.first.length + 1)}"]);
      }
      return List.from(t)..add("{${texts.first}");
    });

    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        style: GoogleFonts.tajawal(fontSize: 20.sp, color: ColorApp.yellow),
        //style: DefaultTextStyle.of(context).style,
        children: [TextSpan(text: split.first)]..addAll(hadiths
            .map((text) => text.contains("{")
                ? TextSpan(
                    text: text,
                    style: GoogleFonts.tajawal(
                        color: ColorApp.primary, fontWeight: FontWeight.bold))
                : TextSpan(text: text))
            .toList()),
      ),
      textDirection: TextDirection.rtl,
    );
  }
}
