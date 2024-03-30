import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadith/controller/SaveHadithCubit/save_hadith_cubit.dart';
import 'package:hadith/controller/utils/app_routes.dart';

void main() {
  runApp(const HadithApp());
}

class HadithApp extends StatelessWidget {
  const HadithApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider<SaveHadith>(
          create: (context) => SaveHadith(),
          child: MaterialApp.router(
            routerConfig: RoutesApp.router,
            title: "Azkar",
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
