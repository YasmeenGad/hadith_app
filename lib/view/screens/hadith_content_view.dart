import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/controller/functions/get_hadith_texts.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/constants/colors.dart';
import 'package:hadith/model/hadith_model.dart';

class HadithContentView extends StatefulWidget {
  const HadithContentView({required this.data, required this.hadith});
  final String data;
  final Hadith hadith;

  @override
  State<HadithContentView> createState() => _HadithContentViewState();
}

class _HadithContentViewState extends State<HadithContentView> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          SvgPicture.asset(Assets.svgBackground),
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(""),
                        SvgPicture.asset(Assets.svgLogo),
                        IconButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h, right: 20.w),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${widget.hadith.key}",
                            style: GoogleFonts.tajawal(fontSize: 16.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(Assets.svgFav),
                              Text(
                                "${widget.hadith.name}",
                                style: GoogleFonts.tajawal(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorApp.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2.sp,
                    endIndent: 70,
                    indent: 70,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: HadithText.getHadithText(context, widget.data),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
