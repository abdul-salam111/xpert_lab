import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/modules/index.dart';
import '../../../../appConst/index.dart';
import 'package:intl/intl.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return bgwidget(WillPopScope(
      onWillPop: () async {
        return controller.isLoading.value == true ? false : true;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: darkBlue),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            createAccount,
            style: TextStyle(color: darkBlue, fontFamily: regular),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: bouncing,
              child: Padding(
                padding: padding20,
                child: Column(
                  children: [
                    HeightBox(10.h),
                    mainAppLogo(),
                    10.widthBox,
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: crossstart,
                          children: [
                            20.heightBox,
                            welcomtext,
                            30.heightBox,
                            customTextFields(
                                texteditingController: controller.name,
                                hintText: nameHint,
                                Label: nameLabel,
                                prefixicon: personicon,
                                keyboradType: TextInputType.name),
                            20.heightBox,
                            customTextFields(
                                texteditingController: controller.email,
                                hintText: emailHint,
                                Label: emailLabel,
                                prefixicon: emailicon,
                                keyboradType: TextInputType.emailAddress),
                            20.heightBox,
                            customTextFields(
                                texteditingController: controller.gender,
                                hintText: genderHint,
                                Label: genderLabel,
                                prefixicon: gendericon,
                                keyboradType: TextInputType.name),
                            20.heightBox,
                            phoneTextField(
                                texteditingController: controller.phone),
                            dateOfBirth(
                              context: context,
                              prefixicon: calenderIcon,
                              Label: dateOfBirthLabel,
                            ),
                            20.heightBox,
                            passWordTextField(
                              passwordController: controller.password,
                              hintText: passwordHint,
                              Label: passwordLabel,
                              prefixicon: lockicon,
                            ),
                            30.heightBox,
                            customButton(
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.signUp(
                                      name: controller.name.text.toString(),
                                      email: controller.email.text.toString(),
                                      gender: controller.gender.text.toString(),
                                      phoneno: controller.phone.text.toString(),
                                      password:
                                          controller.password.text.toString(),
                                      dob: controller.dob.value.toString(),
                                    );
                                  }
                                },
                                btnName: createAccount,
                                bgColor: redColor,
                                textcolor: whiteColor,
                                btnSize: Size(double.infinity, 35.h)),
                            20.heightBox,
                            orwidget,
                            20.heightBox,
                            continuewith.text
                                .size(16)
                                .color(darkBlue)
                                .fontFamily(regular)
                                .makeCentered(),
                            20.heightBox,
                            socialLoginicons,
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Obx(() => loadingWidget(
                text: pleasewait, value: controller.isLoading.value))
          ],
        ),
      ),
    ));
  }

  Widget passWordTextField(
      {String? hintText,
      passwordController,
      String? Label,
      IconData? prefixicon,
      String? borderType = "round"}) {
    return Obx(
      () => Column(
        crossAxisAlignment: crossstart,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 5),
              child: Text(
                Label!,
                style: textfieldlabelStyle,
              )),
          SizedBox(
            height: 35.h,
            child: TextFormField(
              controller: passwordController,
              obscureText: controller.isVisible.value,
              style: textfieldinputstyle,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    prefixicon,
                    color: darkBlue,
                  ),
                  contentPadding: textfieldpadding,
                  hintText: hintText,
                  suffixIcon: Icon(
                    controller.isVisible.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: darkBlue,
                  ).box.make().onTap(() {
                    controller.isVisible.value == true
                        ? controller.isVisible.value = false
                        : controller.isVisible.value = true;
                  }),
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
        ],
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
