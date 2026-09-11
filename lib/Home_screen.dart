import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movie_max/Api_calling/Popular_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieController controller = Get.put(MovieController());

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
        child: Obx(() {
          if (controller.isLoading.value) {
            return _buildShimmerLoading();
          }

          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  children: [
                    Image.asset(
                      "asset/images/movie_max_logo.png",
                      width: 100.w,
                      height: 100.h,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.white, size: 30.r),
                    ),
                    SizedBox(width: 5.w),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.account_circle, color: Colors.white, size: 30.r),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              SizedBox(
                height: 40.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  itemCount: tabs.length,
                  separatorBuilder: (_, __) => SizedBox(width: 10.w),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => setState(() => _selectIndex = index),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: _selectIndex == index ? Colors.red.shade900 : Colors.white,
                          fontSize: 14.sp,
                          fontWeight: _selectIndex == index ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.h),

              Padding(
                padding: EdgeInsets.only(left: 14.w),
                child: Text(
                  "TRENDING NOW",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),

              SizedBox(height: 8.h),

              SizedBox(
                height: 180.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  itemCount: controller.popularMovies.length,
                  itemBuilder: (_, i) {
                    final movie = controller.popularMovies[i];
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          movie.fullPosterUrl,
                          width: 120.w,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return _shimmerBox(width: 120.w, height: 180.h);
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 120.w,
                              height: 180.h,
                              color: Colors.grey[900],
                              child: const Icon(Icons.broken_image, color: Colors.white54),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20.h),
            ],
          );
        }),
      ),
    );
  }

  // Reusable shimmer box for any rectangular placeholder
  Widget _shimmerBox({required double width, required double height, double radius = 10}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[700]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius.r),
        ),
      ),
    );
  }

  // Full-screen shimmer skeleton shown while all movie data is loading
  Widget _buildShimmerLoading() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            children: [
              _shimmerBox(width: 100.w, height: 40.h, radius: 6),
              const Spacer(),
              _shimmerBox(width: 30.r, height: 30.r, radius: 15),
              SizedBox(width: 10.w),
              _shimmerBox(width: 30.r, height: 30.r, radius: 15),
            ],
          ),
        ),

        SizedBox(height: 10.h),

        SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            itemCount: 5,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (_, __) => _shimmerBox(width: 70.w, height: 20.h, radius: 6),
          ),
        ),

        SizedBox(height: 14.h),

        Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: _shimmerBox(width: 140.w, height: 20.h, radius: 6),
        ),

        SizedBox(height: 8.h),

        SizedBox(
          height: 180.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            itemCount: 5,
            itemBuilder: (_, __) => Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: _shimmerBox(width: 120.w, height: 180.h),
            ),
          ),
        ),
      ],
    );
  }
}