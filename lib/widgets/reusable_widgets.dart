import 'package:flutter/material.dart';
import 'package:zoom_clone_flutter/utils/colors.dart';
import 'package:zoom_clone_flutter/widgets/custom_text.dart';

class ReusableWidgets {
  static AppBar myAppBar({required String title}) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: CustomText(
        text: title,
      ),
      centerTitle: true,
    );
  }
}
