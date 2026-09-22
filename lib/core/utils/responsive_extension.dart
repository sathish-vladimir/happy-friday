import 'package:flutter/widgets.dart';

class AppResponsive {
  AppResponsive._();

  static double designWidth = 375;
  static double designHeight = 812;

  static late double _screenWidth;
  static late double _screenHeight;
  static bool _initialized = false;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
    _initialized = true;
  }

  static double get scaleWidth {
    assert(_initialized, 'Call AppResponsive.init(context) first');
    return _screenWidth / designWidth;
  }

  static double get scaleHeight {
    assert(_initialized, 'Call AppResponsive.init(context) first');
    return _screenHeight / designHeight;
  }

  static double get scaleText =>
      scaleWidth < scaleHeight ? scaleWidth : scaleHeight;
}

extension ResponsiveExtension on num {
  double get w => this * AppResponsive.scaleWidth;
  double get h => this * AppResponsive.scaleHeight;
  double get sp => this * AppResponsive.scaleText;
  double get r => this * AppResponsive.scaleWidth;
}
