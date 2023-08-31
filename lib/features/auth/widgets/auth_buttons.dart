import 'package:admin_page/features/auth/widgets/text_field.dart';
import 'package:admin_page/features/themes/app_theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  AuthButtons({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
            child: Text(
              "Авторизация",
              style: context.appTheme.authTheme.lableTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
            child: Text(
              "E-mail или телефон",
              style: context.appTheme.authTheme.titleTextStyle,
            ),
          ),
          SizedBox(
            width: 320,
            child: CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty) return "Введите почту";
                if (!EmailValidator.validate(value)) return "Введите корректную почту";
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
            child: Text(
              "Пароль",
              style: context.appTheme.authTheme.titleTextStyle,
            ),
          ),
          SizedBox(
            width: 320,
            child: CustomTextField(
              validator: (value) => null,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Text(
                "Забыли пароль?",
                style: context.appTheme.authTheme.forgetPasswordTextStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("Form is valid");
                  return;
                }
                print("Form is invalid");
              },
              child: SizedBox(
                width: 275,
                height: 60,
                child: Center(
                    child: Text(
                  "Войти",
                  style: context.appTheme.authTheme.loginButtonTextStyle,
                )),
              ),
              style: context.appTheme.authTheme.loginButtonStyle,
            ),
          )
        ],
      ),
    );
  }
}