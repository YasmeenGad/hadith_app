import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/app_routes.dart';
import 'package:hadith/controller/utils/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadith/controller/utils/constants/texts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      GoRouter.of(context).push(RoutesApp.homeView);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary,
      body: Stack(
        children: [
          SvgPicture.asset(
            Assets.svgSplash,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svgIslamic),
                SizedBox(
                  height: 20.h,
                ),
                TextApp.splashScreen,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
