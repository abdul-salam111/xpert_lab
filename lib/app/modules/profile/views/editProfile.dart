import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/modules/index.dart';
import 'package:intl/intl.dart';

class EditProfile extends GetView<ProfileController> {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: defaultPadding,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: maincenter,
              children: [
                customTextFields(
                    Label: "User Name",
                    hintText: "e.g johnsnow",
                    texteditingController: controller.usernameController,
                    prefixicon: Icons.person),
                20.heightBox,
                customTextFields(
                    Label: "Gender",
                    hintText: "e.g Male",
                    texteditingController: controller.usergenderController,
                    prefixicon: Icons.male),
                20.heightBox,
                dateOfBirth(
                  context: context,
                  prefixicon: calenderIcon,
                  Label: dateOfBirthLabel,
                ),
                20.heightBox,
                customTextFields(
                    Label: "Phone",
                    hintText: "e.g phone",
                    texteditingController: controller.userphoneNumberController,
                    prefixicon: Icons.phone),
                20.heightBox,
                customButton(
                    onPress: () {
                      controller.updateProfile(
                          userName: controller.usernameController.text.toString(),
                          userGender:
                              controller.usergenderController.text.toString(),
                          userDob: controller.dob.value,
                          userPhone:
                              controller.userphoneNumberController.text.toString());
                    },
                    btnName: "Update Profile",
                    bgColor: darkBlue,
                    textcolor: whiteColor,
                    btnSize: Size(double.infinity, 40.h))
              ],
            ),
            Obx(() => loadingWidget(text: "Please wait...",value: controller.isloading.value))
          ],
        ),
      ),
    );
  }

  Widget dateOfBirth(
      {context,
      String? hintText,
      String? Label,
      IconData? prefixicon,
      TextInputType? keyboradType,
      String? borderType = "round"}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 5),
            child: Text(
              dateOfBirthLabel,
              style: textfieldlabelStyle,
            )),
        SizedBox(
          height: 35.h,
          child: Obx(
            () => TextFormField(
              keyboardType: keyboradType,
              onTap: () async {
                await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now())
                    .then((date) {
                  if (date != null) {
                    controller.dob.value = date;
                    print(date);
                  } else {
                    Utils.showToast(
                        msg: "Please select date of birth!", bgcolor: redColor);
                  }
                });
              },
              readOnly: true,
              style: textfieldinputstyle,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    prefixicon,
                    color: darkBlue,
                  ),
                  contentPadding: textfieldpadding,
                  hintText: DateFormat.yMd().format(controller.dob.value),
                  alignLabelWithHint: true,
                  enabledBorder:
                      borderType == "round" ? enableborder : enableborderRec,
                  focusedBorder:
                      borderType == "round" ? focusborder : focusborderRec,
                  border:
                      borderType == "round" ? enableborder : enableborderRec,
                  errorBorder:
                      borderType == "round" ? errorborder : errorBorderRec),
            ),
          ),
        ),
      ],
    );
  }
}
