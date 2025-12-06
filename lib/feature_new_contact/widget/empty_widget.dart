import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: 360.w,
      child: Column(
        children: [
        const Spacer(),
        SvgPicture.asset('assets/svg/empty.svg'),
        Text('Does not exist any transaction'.tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp,color: Colors.black),),
        const Spacer(),
      ],),
    );
  }
}
