import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/modules/commonWidgets/index.dart';

class CustomerCare extends StatelessWidget {
  const CustomerCare({super.key});

  @override
  Widget build(BuildContext context) {
    return bgwidget(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: bouncing,
            child: Padding(
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: crossstart,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: darkBlue,
                      )),
                  30.heightBox,
                  Image.asset(
                    "assets/icons/customeCare.png",
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.contain,
                  )
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .border(color: darkBlue)
                      .makeCentered(),
                  "Welcome To Your Xpert Lab"
                      .text
                      .fontFamily(regular)
                      .color(darkBlue)
                      .size(20.sp)
                      .makeCentered(),
                  20.heightBox,
                  "Book Your Tests Hassle-Free"
                      .text
                      .bold
                      .fontFamily(regular)
                      .size(13.sp)
                      .color(darkBlue)
                      .make(),
                  5.heightBox,
                  "We are excited to welcome you to Xpert Lab, where you can easily book tests and appointments at your convenience. Our user-friendly platform ensures a seamless experience from start to finish, helping you prioritize your health with ease."
                      .text
                      .justify
                      .fontFamily(regular)
                      .size(13.sp)
                      .color(darkBlue)
                      .make(),
                  5.heightBox,
                  "🤷‍♂️How It Works:"
                      .text
                      .fontFamily(regular)
                      .bold
                      .size(13.sp)
                      .color(darkBlue)
                      .make(),
                  5.heightBox,
                  "👉Simple 3-Step Booking Process"
                      .text
                      .bold
                      .fontFamily(regular)
                      .color(darkBlue)
                      .size(13.sp)
                      .make(),
                  5.heightBox,
                  "✅Step 1: Choose Your Test:"
                      .text
                      .fontFamily(regular)
                      .bold
                      .color(darkBlue)
                      .size(13.sp)
                      .make(),
                  5.heightBox,
                  "Browse our wide selection of available tests and choose the one that suits your needs best. From routine check-ups to specialized screenings, we have you covered."
                      .text
                      .size(13.sp)
                      .color(darkBlue)
                      .fontFamily(regular)
                      .justify
                      .make(),
                  5.heightBox,
                  "✅Step 2: Select a Convenient Date and Time:"
                      .text
                      .bold
                      .color(darkBlue)
                      .fontFamily(regular)
                      .size(13.sp)
                      .make(),
                  5.heightBox,
                  "Pick a date and time that fits your schedule. Our flexible booking system allows you to find the perfect slot for your test."
                      .text
                      .color(darkBlue)
                      .fontFamily(regular)
                      .justify
                      .size(13.sp)
                      .make(),
                  5.heightBox,
                  "✅Step 3: Confirm and Relax:"
                      .text
                      .bold
                      .color(darkBlue)
                      .fontFamily(regular)
                      .size(13.sp)
                      .make(),
                  5.heightBox,
                  "Review your booking details, confirm your appointment, and let us take care of the rest. We'll send you a reminder before your test, so you never miss an important appointment."
                      .text
                      .color(darkBlue)
                      .fontFamily(regular)
                      .justify
                      .size(13.sp)
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      "Contact Us: "
                          .text
                          .bold
                          .fontFamily(regular)
                          .size(13.sp)
                          .color(darkBlue)
                          .make(),
                      5.widthBox,
                      "03169193242 ☎️"
                          .text
                          .color(darkBlue)
                          .fontFamily(regular)
                          .justify
                          .size(13.sp)
                          .make(),
                    ],
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      "Email: "
                          .text
                          .bold
                          .fontFamily(regular)
                          .size(13.sp)
                          .color(darkBlue)
                          .make(),
                      5.widthBox,
                      "abdulsalam@gmail.com 📩"
                          .text
                          .color(darkBlue)
                          .fontFamily(regular)
                          .justify
                          .size(13.sp)
                          .make(),
                    ],
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      "Location: "
                          .text
                          .bold
                          .fontFamily(regular)
                          .size(13.sp)
                          .color(darkBlue)
                          .make(),
                      5.widthBox,
                      "Abbottabad, Sarban Road near to DHQ Hospital"
                          .text
                          .size(13.sp)
                          .maxLines(1)
                          .color(darkBlue)
                          .make()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
