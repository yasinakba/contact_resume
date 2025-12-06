import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const kPurpleColor = Color(0xFF6C63FF);
const kRedColor = Color(0xFFFF2D55);
const kGreenColor = Color(0xFF00C89C);

void customDialog({required BuildContext context, required String title,required VoidCallback onYesPressed})async{
  showDialog(
  context: context,
  builder: (context) => AlertDialog(
  title: Expanded(
    child: RichText(textDirection: TextDirection.ltr,maxLines: 6,textAlign: TextAlign.start,text: TextSpan(children: [
    TextSpan(text: 'Are you sure about delete ',style: TextStyle(fontSize: 16.sp,color: Colors.black87,fontFamily: 'roph')),
    TextSpan(text: '${title} ',style: TextStyle(color: Colors.red,fontFamily: 'roph',fontSize: 17.sp)),
    TextSpan(text: '?',style: TextStyle(color: Colors.black,fontFamily: 'roph',fontSize: 17.sp)),
    ],),),
  ),
  actions: [
  TextButton(onPressed:onYesPressed, child: Text('Yes'.tr)),
  TextButton(onPressed: () {
    Get.back();
  }, child: Text('No'.tr)),
  ],
  ));
}

TextStyle fontOnly = TextStyle(fontSize: 17.sp);