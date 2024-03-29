import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/colors.dart';
import 'package:hadith/controller/utils/texts.dart';
import 'package:hadith/model/custom_card_model.dart';
import 'package:hadith/view/widgets/custom_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            Assets.svgBackground,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              SvgPicture.asset(Assets.svgLogo),
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextApp.topHomeScreen,
                        TextApp.headerHomeScreen,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomCard(
                      cardModel: CustomCardModel(
                          firstColor: ColorApp.primary,
                          secondColor: ColorApp.darkPrimary,
                          text: TextApp.cardOne,
                          firstPathImage: Assets.svgQuran,
                          secondPathImage: Assets.svgOne)),
                  CustomCard(
                      cardModel: CustomCardModel(
                    firstColor: ColorApp.yellow,
                    secondColor: ColorApp.pink,
                    text: TextApp.cardTwo,
                    firstPathImage: Assets.svgPlay,
                    secondPathImage: Assets.svgTwoo,
                  )),
                  CustomCard(
                      cardModel: CustomCardModel(
                          firstColor: ColorApp.violent,
                          secondColor: ColorApp.red,
                          text: TextApp.cardThree,
                          firstPathImage: Assets.svgSaveInstagram,
                          secondPathImage: Assets.svgThree))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
