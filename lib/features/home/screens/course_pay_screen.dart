import 'package:cource_test/core/custom/custom_alert.dart';
import 'package:cource_test/core/custom/custom_button.dart';
import 'package:cource_test/core/custom/custom_textfield.dart';
import 'package:cource_test/core/extensions/num_extension.dart';
import 'package:cource_test/features/main/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CoursePayScreen extends StatefulWidget {
  const CoursePayScreen({super.key});

  @override
  State<CoursePayScreen> createState() => _CoursePayScreenState();
}

class _CoursePayScreenState extends State<CoursePayScreen> {
  final TextEditingController _firstNameComtroller = TextEditingController();
  final TextEditingController _lastNameComtroller = TextEditingController();
  final TextEditingController _phoneComtroller = TextEditingController();
  final TextEditingController _birthComtroller = TextEditingController();
  final _bithMaskFormatter = MaskTextInputFormatter(
    mask: '####-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  var phoneNumberMaskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );
  @override
  void dispose() {
    _firstNameComtroller.dispose();
    _lastNameComtroller.dispose();
    _phoneComtroller.dispose();
    _birthComtroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Course",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.height,
            CustomTextField(
                hintText: "Enter your first name",
                controller: _firstNameComtroller,
                obscureText: false),
            20.height,
            CustomTextField(
                hintText: "Enter your last name",
                controller: _lastNameComtroller,
                obscureText: false),
            20.height,
            CustomTextField(
                hintText: "Enter your phone number",
                inputFormatter: [phoneNumberMaskFormatter],
                keyboardType: TextInputType.number,
                controller: _phoneComtroller,
                obscureText: false),
            20.height,
            CustomTextField(
                keyboardType: TextInputType.number,
                inputFormatter: [_bithMaskFormatter],
                hintText: "Enter your birthday",
                controller: _birthComtroller,
                obscureText: false),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomButton(
          text: "Pay",
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlert(
                    isGreen: true,
                    title: "Thanks for the payment!",
                    content: "Your payment has been successfully processed.",
                    buttonText: "Continue",
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => MainScreen(index: 0)),
                        (route) => false,
                      );
                    });
              },
            );
          },
          color: Colors.black,
        ),
      ),
    );
  }
}
