import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movie_max/Onboardingscreen.dart';

void main() {
  runApp(movie_max());
}

// ignore: camel_case_types
class movie_max extends StatelessWidget {
  const movie_max({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      autoRebuild: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Onboardingscreen(),
      ),
    );
  }
}
