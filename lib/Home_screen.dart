import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "asset/images/movie_max_logo.png",
                  width: 100.w,
                  height: 100.h,
                ),
                Spacer(),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white, size: 30.r),
                ),

                SizedBox(width: 5.w),

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 30.r,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
