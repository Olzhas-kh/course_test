import 'package:cource_test/core/custom/custom_button.dart';
import 'package:cource_test/core/extensions/num_extension.dart';
import 'package:cource_test/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final void Function() onTap;
  final bool isGreen;
  const CustomAlert({
    super.key,
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onTap,
    required this.isGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      elevation: 1,
      backgroundColor: isGreen ? Colors.green : AppColors.white,
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    color: isGreen ? AppColors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: isGreen ? AppColors.white : Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              20.height,
              CustomButton(
                text: buttonText,
                onTap: onTap,
                textColor: isGreen ? Colors.green : AppColors.white,
                color: isGreen ? AppColors.white : Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
