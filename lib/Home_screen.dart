import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  final List<String> tabs = [
    "Featured",
    "Trending",
    "TV Shows",
    "Movies",
    "Genres",
    "Top Rated",
    "New Releases",
    "Downloads",
    "My List",
  ];

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
            SizedBox(height: 10.h),

            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() => _selectIndex = index),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: _selectIndex == index
                              ? Colors.red.shade900
                              : Colors.white,
                          fontSize: 14.sp,
                          fontWeight: _selectIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemCount: tabs.length,
              ),
            ),

            SizedBox(height: 10.h),

            Align(
              alignment: AlignmentGeometry.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "TRENDING NOW",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            
          ],

        ),
      ),
    );
  }
}
