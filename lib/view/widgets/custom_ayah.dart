import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/constants/colors.dart';

class CustomAyah extends StatelessWidget {
  const CustomAyah({required this.hadithKey, required this.hadithName});
  final String hadithKey;
  final String hadithName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(Assets.svgImg),
        SvgPicture.asset(Assets.svgGrey),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${hadithKey}",
              style:
                  GoogleFonts.tajawal(color: ColorApp.yellow, fontSize: 12.sp),
            ),
            Text(
              "${hadithName}",
              style: GoogleFonts.tajawal(
                  color: ColorApp.yellow,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
