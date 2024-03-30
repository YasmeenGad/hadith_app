// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/controller/SaveHadithCubit/save_hadith_cubit.dart';
import 'package:hadith/controller/SaveHadithCubit/save_hadith_state.dart';
import 'package:hadith/controller/utils/app_images/assets.dart';
import 'package:hadith/controller/utils/constants/colors.dart';
import 'package:hadith/view/screens/audio_view.dart';
import 'package:hadith/view/screens/hadith_details.dart';
import 'package:hadith/view/widgets/custom_ayah.dart';

class SavedHadithView extends StatefulWidget {
  const SavedHadithView({super.key});

  @override
  State<SavedHadithView> createState() => _SavedHadithViewState();
}

class _SavedHadithViewState extends State<SavedHadithView> {
  bool isHadith = true;
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
                              "ألأحاديث المحفوظه",
                              style: GoogleFonts.tajawal(
                                color: ColorApp.primary,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.grey.withOpacity(0.4)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      isHadith = true;
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: isHadith
                                              ? ColorApp.primary
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 10.h),
                                        child: Center(
                                          child: Text(
                                            "الاحاديث الاربعين",
                                            style: GoogleFonts.tajawal(
                                              color: isHadith
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      isHadith = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: isHadith
                                              ? Colors.transparent
                                              : ColorApp.primary,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 10.h),
                                        child: Center(
                                          child: Text(
                                            "الاستماع للاحاديث",
                                            style: GoogleFonts.tajawal(
                                              color: isHadith
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: BlocBuilder<SaveHadith, HadithSavedState>(
                builder: (context, state) {
                  if (state is HadithSavedSuccessfully) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                BlocProvider.of<SaveHadith>(context)
                                            .hadiths
                                            .length >
                                        1
                                    ? 300
                                    : 500,
                            crossAxisSpacing: 15.w,
                            mainAxisSpacing: 15.h),
                        itemCount:
                            BlocProvider.of<SaveHadith>(context).hadiths.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              isHadith
                                  ? Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return HadithDetails(
                                          hadith: BlocProvider.of<SaveHadith>(
                                                  context)
                                              .hadiths[index],
                                        );
                                      },
                                    ))
                                  : Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return AudioView(
                                            hadith: BlocProvider.of<SaveHadith>(
                                                    context)
                                                .hadiths[index],
                                            path: BlocProvider.of<SaveHadith>(
                                                    context)
                                                .hadiths[index]
                                                .audio);
                                      },
                                    ));
                            },
                            child: CustomAyah(
                                hadithKey: BlocProvider.of<SaveHadith>(context)
                                    .hadiths[index]
                                    .key!,
                                hadithName: BlocProvider.of<SaveHadith>(context)
                                    .hadiths[index]
                                    .name!),
                          );
                        },
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.center,
                      child: Text(
                        "لا يوجد احاديث محفوظه",
                        style: GoogleFonts.tajawal(
                            fontSize: 25.sp, color: ColorApp.darkPrimary),
                      ),
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}
