import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/controller/db/data.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/constants/colors.dart';
import 'package:hadith/model/hadith_model.dart';
import 'package:hadith/view/screens/hadith_details.dart';
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
                padding: EdgeInsets.only(top: 30.h),
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
                        SizedBox(
                          height: 20.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: Text(
                              "ألأحاديث الاربعون",
                              style: GoogleFonts.tajawal(
                                color: ColorApp.primary,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return HadithDetails(
                                        hadith: hadith,
                                      );
                                    },
                                  ));
                                },
                                child: CustomAyah(
                                  hadithKey: hadith.key.toString(),
                                  hadithName: hadith.name.toString(),
                                ),
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
