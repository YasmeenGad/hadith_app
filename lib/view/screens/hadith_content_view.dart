import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith/controller/functions/get_hadith_texts.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/constants/texts.dart';

class HadithContentView extends StatefulWidget {
  const HadithContentView({required this.data});
  final String data;

  @override
  State<HadithContentView> createState() => _HadithContentViewState();
}

class _HadithContentViewState extends State<HadithContentView> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.h, right: 5.w, bottom: 20.h),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: HadithText.getHadithText(context, widget.data),
          )
        ],
      ),
    );
  }
}
