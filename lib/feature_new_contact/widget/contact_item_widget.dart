import 'package:contact_resume/feature_new_contact/controller/contact_controller.dart';
import 'package:contact_resume/feature_new_contact/view/contact_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../localization/constant.dart';
import '../entity/contact_entity.dart';

class ContactItemWidget extends StatelessWidget {
  final ContactEntity contact;
  final String id;
  
  const ContactItemWidget({
    Key? key, 
    required this.contact, 
    required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.isEditing = true;
          controller.index = id;
          controller.phoneNumberController.text = contact.phoneNumber;
          controller.fullNameController.text = contact.name;
          Get.to(() => ContactManager(), arguments: contact);
        },
        onLongPress: () {
          customDialog(
              context: context, 
              title: contact.name, 
              onYesPressed: () async {
                await controller.deleteContact();
                Get.back();
                controller.update();
              });
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 10),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              // Avatar Section
              Container(
                height: 50.w,
                width: 50.w,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  contact.name.isNotEmpty ? contact.name[0].toUpperCase() : '?',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              
              // Information Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Icon(IconsaxPlusBold.call, size: 14.sp, color: Colors.grey.shade500),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            contact.phoneNumber,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Action Icon
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  IconsaxPlusLinear.edit_2,
                  color: Colors.grey.shade400,
                  size: 18.sp,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
