import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextApp {
  static Text splashScreen = Text("ألاربعون النوويه",
      style: GoogleFonts.tajawal(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 36.sp));

  static Text topHomeScreen = Text(
    "ألاربعون النوويه",
    textDirection: TextDirection.rtl,
    style: GoogleFonts.tajawal(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.sp),
  );
  static Text headerHomeScreen = Text(
    "لحفظ وسماع الاحاديث النوويه",
    style: GoogleFonts.tajawal(
        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25.sp),
  );

  static Text cardOne = Text(
    "ألأحاديث الاربعون",
    style: GoogleFonts.tajawal(
      color: Colors.white,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
    ),
  );
  static Text cardTwo = Text(
    "ألأستماع للأحاديث",
    style: GoogleFonts.tajawal(
      color: Colors.white,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
    ),
  );
  static Text cardThree = Text(
    "ألأحاديث المحفوظه",
    style: GoogleFonts.tajawal(
      color: Colors.white,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}
