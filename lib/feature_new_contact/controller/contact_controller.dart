import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../entity/contact_entity.dart';
import '../widget/contact_item_widget.dart';
import '../widget/empty_widget.dart';

class ContactController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
List<ContactEntity> contacts = [];

bool isEditing = false;
bool isSearch = false;

  Widget showData() {
    // Ensure hiveBox is available for filtered searches


    if (isSearch) {
      if (contacts.isEmpty) {
        return EmptyWidget();
      }
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final ContactEntity item = contacts[index];
          return ContactItemWidget(contact: item, id: item.id.toString());
        },
      );
    }

    if(contacts.isEmpty){
      return EmptyWidget();
    }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final ContactEntity contact = contacts[index];
            return ContactItemWidget(contact: contact, id: index.toString(),);
          },
        );
  }
  void initializeEditTransaction() {
    if (isEditing) {
      if (Get.arguments != null) {
        ContactEntity contact = Get.arguments;
        fullNameController.text = contact.name;
        phoneNumberController.text = contact.phoneNumber;
      }
    }
  }

  TextEditingController searchController = TextEditingController();
  String index = '';
  bool focus = false;
  int selectedValue = 0;
  String date = 'Date';

  void addTransaction() async {
    try {
      // Clean price string (remove commas)
      if (isEditing) {
        // --- EDIT MODE ---
        // Get the existing money object passed via arguments
        if (Get.arguments is ContactEntity) {
          ContactEntity contact = Get.arguments as ContactEntity;

          // Update its fields
          contact.name = fullNameController.text;
          contact.phoneNumber = phoneNumberController.text; // Save without commas


          isEditing = false;
        }
      } else {
        // --- ADD MODE ---
        if (fullNameController.text.isNotEmpty || phoneNumberController.text.isNotEmpty) {
          ContactEntity newContact = ContactEntity(
            phoneNumber:
            phoneNumberController.text,
            name: fullNameController.text, id: 0,
          );
          contacts.add(newContact);
        }
      }

      // Clear inputs only on success
      fullNameController.clear();
      phoneNumberController.clear();
      Get.back(); // Close the screen/dialog

    } catch (e) {
      print("Error adding/editing transaction: $e");
      Get.snackbar(
        "Error",
        "Something went wrong while saving the transaction.",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }


  void onOutButton(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2099),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: ThemeData.light().textTheme,
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      String month = pickedDate.month.toString().padLeft(2, '0');
      String day = pickedDate.day.toString().padLeft(2, '0');
      date = '${pickedDate.year}/$month/$day';
      update();
    }
  }

  Future<void> deleteContact() async {}
}
