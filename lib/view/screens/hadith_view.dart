import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith/controller/db/data.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/constants/colors.dart';
import 'package:hadith/controller/utils/constants/texts.dart';
import 'package:hadith/model/hadith_model.dart';
import 'package:hadith/view/widgets/custom_ayah.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 30.h, right: 5.w),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      Assets.svgBackground,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(""),
                            SvgPicture.asset(
                              Assets.svgLogo,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                                onPressed: () {
                                  GoRouter.of(context).pop();
                                },
                                icon: const Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextApp.topHomeScreen,
                            TextApp.headerHomeScreen,
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      Assets.svgBackground,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    FutureBuilder(
                      future: Data.getAllData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Hadith>> snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    crossAxisSpacing: 15.w,
                                    mainAxisSpacing: 15.h),
                            itemCount: Data.hadithList.length,
                            itemBuilder: (context, index) {
                              Hadith hadith = snapshot.data![index];
                              return CustomAyah(
                                hadithKey: hadith.key.toString(),
                                hadithName: hadith.name.toString(),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: ColorApp.primary,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
