import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
 final String title;
 final VoidCallback onTap;
  MyButton({required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(vertical: 20.h),
        alignment: Alignment.center,
        width: 320.w,
        height: 40.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(90), // Shadow color
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 8, // Softness of the shadow
              offset: Offset(4, 4), // Position of the shadow
            ),
          ],
          gradient: LinearGradient(colors: [
            Colors.pink,
            Colors.pinkAccent,
            Colors.orange,
            Colors.pink,
            Colors.pink,
          ]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title.tr,style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w900),),
      ),
    );
  }
}
