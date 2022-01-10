import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class DensityUtils {
  static double getScreenHeight() {
    return MediaQueryData.fromWindow(window).size.height;
  }

  static double getScreenWidth() {
    return MediaQueryData.fromWindow(window).size.width;
  }

  ///屏幕size
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  ///   屏幕宽度
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  ///  屏幕高度
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  ///   百分比屏幕宽度
  static double screenPercentageWidth(BuildContext context, {double percentage = 1}) {
    return MediaQuery.of(context).size.width * percentage;
  }

  /// 如果是ios设备，是否需要适配刘海屏
  static bool iphoneX(BuildContext context) {
    if (Platform.isIOS) {
      return MediaQuery.of(context).padding.bottom > 0;
    }
    return false;
  }

  /// 距离上面的距离，比如ios的刘海屏
  static double paddingTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// ios刘海屏，屏幕底部的padding
  static double paddingBottom(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
}
