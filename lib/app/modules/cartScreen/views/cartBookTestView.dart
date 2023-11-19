import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/modules/cartScreen/controllers/cart_screen_controller.dart';
import 'package:xpert_lab/app/modules/cartScreen/views/cartTestReview.dart';
import '../../../appConst/index.dart';
import '../../commonWidgets/index.dart';
import '../../commonWidgets/timeRange.dart';

class CartBooktestView extends GetView<CartScreenController> {
  const CartBooktestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return bgwidget(
      Scaffold(
          bottomNavigationBar: customButtonRec(
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(() => const CartTestReview());
                }
              },
              bgColor: darkBlue,
              btnName: proceedBtn,
              textcolor: whiteColor,
              btnSize: const Size(double.infinity, 50)),
          backgroundColor: Colors.transparent,
          appBar: customAppBar(titletext: homeSampling),
          body: SingleChildScrollView(
            physics: bouncing,
            child: Padding(
                padding: defaultPadding,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: crossstart,
                    children: [
                      20.heightBox,
                      Center(
                        child: Image.asset(
                          delivery,
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      testBooking.text
                          .fontFamily(regular)
                          .size(17.sp)
                          .semiBold
                          .color(darkBlue)
                          .makeCentered(),
                      10.heightBox,
                      homesamplingcollection.text
                          .fontFamily(regular)
                          .size(12.sp)
                          .color(darkBlue)
                          .makeCentered(),
                      10.heightBox,
                      customTextFields(
                          borderType: "rect",
                          Label: nameLabel,
                          texteditingController: controller.nameController,
                          prefixicon: Icons.person,
                          hintText: nameHint),
                      10.heightBox,
                      phoneTextField(
                          texteditingController: controller.phoneController,
                          borderType: "rect"),
                      10.heightBox,
                      customTextFields(
                          Label: addressLabel,
                          borderType: "rect",
                          texteditingController: controller.addressController,
                          hintText: addresshint,
                          prefixicon: location,
                          keyboradType: TextInputType.emailAddress),
                      10.heightBox,
                      Column(
                        crossAxisAlignment: crossstart,
                        children: [
                          plzselecdateandTime.text.color(darkBlue).bold.make(),
                          10.heightBox,
                          DatePicker(
                            
                            DateTime.now(),
                            initialSelectedDate: DateTime.now(),
                            daysCount: 30,
                            selectionColor: Colors.black,
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              controller.date.value = date;
                              
                            },
                            monthTextStyle: TextStyle(fontSize: 12.sp),
                            dayTextStyle: TextStyle(fontSize: 12.sp),
                            dateTextStyle:TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold) ,
                            height: 65.h,
                          ),
                          5.heightBox,
                          TimeRange(
                            titlePadding: 0,
                            fromTitle: "From".text.make(),
                            toTitle: "To".text.make(),
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                            activeTextStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            borderColor: darkBlue,
                            backgroundColor: Colors.transparent,
                            activeBackgroundColor: darkBlue,
                            firstTime: const TimeOfDay(hour: 9, minute: 00),
                            lastTime: const TimeOfDay(hour: 22, minute: 00),
                            timeStep: 60,
                            timeBlock: 30,
                            onRangeCompleted: (time) {
                             try{
                                 TimeRangeResult timeRangeResult = time!;
                              controller.startTime.value =
                                  timeRangeResult.start;
                              controller.endTime.value = timeRangeResult.end;
                             }catch(e){}
                            },
                          )
                        ],
                      )
                          .box
                          .roundedSM
                          .border(color: darkBlue, width: 1)
                          .padding(defaultPadding)
                          .make(),
                      10.heightBox,
                    ],
                  ),
                )),
          )),
    );
  }
}
