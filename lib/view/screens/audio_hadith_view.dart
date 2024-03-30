import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/controller/db/data.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/constants/colors.dart';
import 'package:hadith/model/hadith_model.dart';
import 'package:hadith/view/screens/audio_view.dart';
import 'package:hadith/view/widgets/custom_ayah.dart';

class AudioHadithView extends StatefulWidget {
  const AudioHadithView({super.key});

  @override
  State<AudioHadithView> createState() => _AudioHadithViewState();
}

class _AudioHadithViewState extends State<AudioHadithView> {
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
                          height: 16.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              "ألأستماع للأحاديث",
                              style: GoogleFonts.tajawal(
                                color: ColorApp.primary,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
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
                                      return AudioView(
                                          hadith: hadith, path: hadith.audio);
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
