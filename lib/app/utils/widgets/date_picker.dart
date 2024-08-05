import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/personal_controller.dart';
import '../const/app_strings.dart';

Widget buildDatePickerField(BuildContext context, PersonalInfoController controller) {
  return Container(
    height: 140,
    width: 320,
    padding: EdgeInsets.only(left: 14, right: 14),
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 19),
        Text(
          AppString.birthday,
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              controller.updateBirthday(pickedDate);
            }
          },
          child: Obx(
                () => Text(
              controller.selectedBirthday.value != null
                  ? "${controller.selectedBirthday.value!.day} - ${controller.selectedBirthday.value!.month} - ${controller.selectedBirthday.value!.year}"
                  : 'DD - MM - YYYY',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        SizedBox(height: 5.5),
        Divider(),
        SizedBox(height: 6),
        Text(
          AppString.age,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black54),
        ),
      ],
    ),
  );
}
