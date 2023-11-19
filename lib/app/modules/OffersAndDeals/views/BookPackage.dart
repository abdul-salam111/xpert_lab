import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../appConst/index.dart';
import '../../index.dart';


class BookPackage extends GetView<OffersAndDealsController> {
  const BookPackage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return bgwidget(
      WillPopScope(
        onWillPop: () async {
          return controller.isloading.value == true ? false : true;
        },
        child: Scaffold(
            bottomNavigationBar: customButtonRec(
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    controller.bookCompletePackage(context: context);
                  }
                },
                bgColor: darkBlue,
                btnName: "Confirm Booking",
                textcolor: whiteColor,
                btnSize: const Size(double.infinity, 50)),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: darkBlue,
              title: const Text(homeSampling),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
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
                                texteditingController:
                                    controller.nameController,
                                prefixicon: Icons.person,
                                hintText: nameHint),
                            10.heightBox,
                            phoneTextField(
                                texteditingController:
                                    controller.phoneController,
                                borderType: "rect"),
                            10.heightBox,
                            customTextFields(
                                Label: addressLabel,
                                borderType: "rect",
                                texteditingController:
                                    controller.addressController,
                                hintText: addresshint,
                                prefixicon: location,
                                keyboradType: TextInputType.emailAddress),
                            10.heightBox,
                            Column(
                              crossAxisAlignment: crossstart,
                              children: [
                                plzselecdateandTime.text
                                    .color(darkBlue)
                                    .bold
                                    .make(),
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
                                ),
                                20.heightBox,
                                TimeRange(
                                  titlePadding: 20,
                                  fromTitle: "From".text.make(),
                                  toTitle: "To".text.make(),
                                  textStyle: TextStyle(
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87),
                                  activeTextStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  borderColor: darkBlue,
                                  backgroundColor: Colors.transparent,
                                  activeBackgroundColor: darkBlue,
                                  firstTime:
                                      const TimeOfDay(hour: 9, minute: 00),
                                  lastTime:
                                      const TimeOfDay(hour: 22, minute: 00),
                                  timeStep: 60,
                                  timeBlock: 30,
                                  onRangeCompleted: (time) {
                                  try{
                                      TimeRangeResult timeRangeResult = time!;
                                    controller.startTime.value =
                                        timeRangeResult.start;
                                    controller.endTime.value =
                                        timeRangeResult.end;
                                  }catch(e){
                                    print(e);
                                  }
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
                ),
                Obx(() => loadingWidget(
                    text: pleasewait, value: controller.isloading.value))
              ],
            )),
      ),
    );
  }
}
