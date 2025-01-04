import 'dart:ui';

import 'package:flutter/material.dart';

/// the size of the screen of the device that the app is running on
Size size = PlatformDispatcher.instance.views.first.physicalSize /
    PlatformDispatcher.instance.views.first.devicePixelRatio;

/// the padding of the design is set to 16
double designPadding = 16;

/// the padding of the design small is set to 8
double designPaddingSmall = 8;

/// the padding of the design is set to 16
double designPadding20 = 20;

/// the padding center of the design is set to 6
double designPaddingCenter = 6;

/// the radius of the design is set to 8
double designRadiusSmall = 8;

/// the padding between of the design is set to 2
double designPaddingBetween = 6;

/// the radius of the design is set to 12
double designRadius = 12;

/// the radius of the design is set to 8
double designRadius8 = 8;

/// the radius of the design is set to 150
double designRoundedRadius = 150;

///This method is used to get device viewport width.
double get width => size.width;

///This method is used to get device viewport height.
num get height {
  final num statusBar = MediaQueryData.fromView(
    PlatformDispatcher.instance.views.first,
  ).viewPadding.top;
  final num screenHeight = size.height - statusBar;
  return screenHeight;
}
