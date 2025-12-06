import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../localization/constant.dart';
import '../controller/contact_controller.dart';
import '../utils/thousands_formatter.dart';
import '../widget/my_button.dart';
import '../widget/radio_button_widget.dart';
import '../widget/text_filed_widget_price.dart';

class ContactManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactController>(builder: (controller) {
       bool edit = controller.isEditing;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Text(edit == true? 'Edit transaction'.tr : 'New transection'.tr, style:fontOnly ),
                SizedBox(height: 10.h),
                TextFiledWidget(
                  controller: controller.fullNameController,
                  hint: 'FullName',
                  type: TextInputType.name,
                  icon: IconsaxPlusBold.user,
                ),
                TextFiledWidget(
                  controller: controller.phoneNumberController,
                  hint: 'phoneNumber',
                  type: TextInputType.phone,
                  icon: IconsaxPlusBold.call,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: ()  {
                        controller.onOutButton(context);
                        },
                      child: Text(
                        controller.date == 'Date' ? 'DateTime'.tr : controller.date,
                      ),
                    ),
                    Column(
                      children: [
                        RadioButtonWidget(
                          value: 0,
                          groupValue: controller.selectedValue,
                          title: 'paid'.tr,
                          onChanged: (int value) {
                            controller.selectedValue = value;
                            controller.update();
                          },
                        ),
                        RadioButtonWidget(
                          value: 1,
                          groupValue: controller.selectedValue,
                          title: 'receive'.tr,
                          onChanged: (int value) {
                            controller.selectedValue = value;
                            controller.update();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                MyButton(
                  title: edit == true? 'Edit' : 'Add',
                  onTap: ()  {
                   controller.addTransaction();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
