import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/modules/commonWidgets/index.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: darkBlue, title: const Text("About Us")),
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Column(
            crossAxisAlignment: crossstart,
            children: [
              10.heightBox,
              "👉Our Services:"
                  .text
                  .color(darkBlue)
                  .fontFamily(regular)
                  .bold
                  .size(15.sp)
                  .make(),
              10.heightBox,
              "Comprehensive Test Options"
                  .text
                  .bold
                  .fontFamily(regular)
                  .size(13.sp)
                  .color(darkBlue)
                  .make(),
              5.heightBox,
              "At Xpert Lab, we offer a comprehensive range of tests to cater to your health needs. Our services include:"
                  .text
                  .justify
                  .color(darkBlue)
                  .size(13.sp)
                  .fontFamily(regular)
                  .make(),
              Padding(
                padding: defaultPadding,
                child:
                    "*Routine Blood Tests\n*COVID-19 Testing Imaging\n*Radiology Services Health\n*Check-ups and Screenings \n*Allergy Testing \n*Genetic Testing"
                        .text
                        .fontFamily(regular)
                        .size(13.sp).justify
                        .color(darkBlue)
                        .make(),
              ),
              10.heightBox,
              "👉Why Choose Us:"
                  .text
                  .color(darkBlue)
                  .fontFamily(regular)
                  .bold
                  .size(15.sp)
                  .make(),
              5.heightBox,
              "Your Health, Our Priority"
                  .text
                  .bold
                  .fontFamily(regular)
                  .size(13.sp)
                  .color(darkBlue)
                  .make(),
              5.heightBox,
              "We take pride in providing top-notch services that prioritize your health and well-being. Here's why you should choose Xpert Lab:"
                  .text
                  .fontFamily(regular).justify
                  .size(13.sp)
                  .color(darkBlue)
                  .make(),
              5.heightBox,
              Padding(
                padding: defaultPadding,
                child:
                    "*Fast and Convenient Booking Process\n*Wide Network of Trusted Testing Centers\n*Highly Qualified and Experienced Medical Professionals\n*Secure and Confidential Handling of Data\n*Transparent Pricing with No Hidden Fees"
                        .text
                        .fontFamily(regular).justify
                        .size(13.sp)
                        .color(darkBlue)
                        .make(),
              ),
              10.heightBox,
              "👉Privacy Policy:"
                  .text
                  .color(darkBlue)
                  .fontFamily(regular)
                  .bold
                  .size(15.sp)
                  .make(),
                  5.heightBox,
              "Your Data Privacy Matters"
                  .text
                  .bold
                  .fontFamily(regular)
                  .size(13.sp)
                  .color(darkBlue)
                  .make(),
              5.heightBox,
              "We take your data privacy seriously. Read our privacy policy to understand how we collect, use, and protect your personal information."
                  .text
                  .fontFamily(regular).justify
                  .size(13.sp)
                  .color(darkBlue)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
