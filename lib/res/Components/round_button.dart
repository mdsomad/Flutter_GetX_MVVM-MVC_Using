import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  final bool loading;
  final String title;
  final double height, white;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.loading = false,
    this.white = 60,
    this.height = 50,
    this.textColor = AppColor.primaryTextColor,
    this.buttonColor = AppColor.primaryButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: white,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(50)),
      child: loading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            ))
          : Center(
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white))),
    );
  }
}
