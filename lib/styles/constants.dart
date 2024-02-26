import 'package:flutter/material.dart';
import 'variables.dart';

//
// FONT SIZING
//

const String fontFamily = 'Konnect';

const TextStyle kHeading = TextStyle(
  fontSize: 26.0,
  fontWeight: FontWeight.w400,
  fontFamily: fontFamily,
  color: whiteColour,
);

const TextStyle kTitle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontFamily: fontFamily,
  color: whiteColour,
);

const TextStyle kSubHeading = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  fontFamily: fontFamily,
  color: whiteColour,
);

const TextStyle kInput = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  fontFamily: fontFamily,
  color: textColour,
);

const TextStyle kPinPad = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
  fontFamily: fontFamily,
  color: textColour,
);

const TextStyle kPinPadDisabled = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
  fontFamily: fontFamily,
  color: disabledColour,
);

const TextStyle kPinPadClear = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  fontFamily: fontFamily,
  color: errorColor,
);

BoxDecoration kInputFieldBoxDecoration = BoxDecoration(
  color: containerColour,
  borderRadius: BorderRadius.circular(16),
);