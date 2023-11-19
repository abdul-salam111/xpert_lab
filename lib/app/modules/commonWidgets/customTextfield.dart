import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert_lab/app/modules/commonWidgets/alignment.dart';
import 'package:xpert_lab/app/modules/commonWidgets/textFieldsBorder.dart';
import 'package:xpert_lab/app/modules/commonWidgets/textStyles.dart';
import '../../appConst/index.dart';

Widget customTextFields(
    {TextEditingController? texteditingController,
    String? hintText,
    String? Label,
    IconData? prefixicon,
    TextInputType? keyboradType,
    String? borderType = "round"}) {
  return Column(
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
          controller: texteditingController,
          keyboardType: keyboradType,
          validator: (val) {
            if (val!.isEmpty) {
              return "Required*";
            }
            return null;
          },
          style: textfieldinputstyle,
          decoration: InputDecoration(
              prefixIcon: Icon(
                prefixicon,
                color: darkBlue,
              ),
              contentPadding: textfieldpadding,
              hintText: hintText,
              alignLabelWithHint: true,
              enabledBorder:
                  borderType == "round" ? enableborder : enableborderRec,
              focusedBorder:
                  borderType == "round" ? focusborder : focusborderRec,
              errorBorder: borderType == "round" ? errorborder : errorBorderRec,
              border: borderType == "round" ? enableborder : errorBorderRec),
        ),
      ),
    ],
  );
}

Widget phoneTextField({texteditingController, String? borderType = "round"}) {
  return Column(
    crossAxisAlignment: crossstart,
    children: [
      Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 5),
          child: Text(
            phoneLabel,
            style: textfieldlabelStyle,
          )),
      SizedBox(
        height: 53.h,
        child: TextFormField(
          controller: texteditingController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          validator: (val) {
            if (val!.isEmpty) {
              return "Required*";
            }
            return null;
          },
          style: textfieldinputstyle,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.phone,
              color: darkBlue,
            ),
            contentPadding: textfieldpadding,
            hintText: phoneHint,
            alignLabelWithHint: true,
            enabledBorder:
                borderType == "round" ? enableborder : enableborderRec,
            focusedBorder: borderType == "round" ? focusborder : focusborderRec,
            errorBorder: borderType == "round" ? errorborder : errorBorderRec,
            border: borderType == "round" ? enableborder : enableborderRec,
          ),
        ),
      ),
    ],
  );
}

Widget commentBox(
    {TextEditingController? texteditingController,
    String? hintText,
    String? Label,
    TextInputType? keyboradType,
    String? borderType = "round"}) {
  return Column(
    crossAxisAlignment: crossstart,
    children: [
      Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 5),
          child: Text(
            Label!,
            style: textfieldlabelStyle,
          )),
      TextFormField(
        minLines: 5,
        maxLines: 7,
        controller: texteditingController,
        keyboardType: keyboradType,
        validator: (val) {
          if (val!.isEmpty) {
            return "Required*";
          }
          return null;
        },
        style: textfieldinputstyle,
        decoration: InputDecoration(
            contentPadding: padding12,
            hintText: hintText,
            alignLabelWithHint: true,
            enabledBorder:
                borderType == "round" ? enableborder : enableborderRec,
            focusedBorder:
                borderType == "round" ? focusborder : focusborderRec,
            errorBorder: borderType == "round" ? errorborder : errorBorderRec,
            border: borderType == "round" ? enableborder : errorBorderRec),
      ),
    ],
  );
}
