import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:admin_page/contollers/auth/auth_contoller.dart';
import 'package:admin_page/pages/auth/widgets/auth_buttons.dart';

class AuthPortrait extends StatelessWidget {
  AuthPortrait({super.key, required this.email, required this.password});

  final AuthController _controller = GetIt.I<AuthController>();
  final TextEditingController email;
  final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appTheme.authTheme.authBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: Builder(
            builder: (context) {
              _controller.messageStream.stream.listen(
                (message) => showSnackBar(context, message),
              );

              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/logo.svg",
                          colorFilter: ColorFilter.mode(
                            context.appTheme.authTheme.logoBackgoundColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: AuthButtons(
                          email: email,
                          password: password,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, AuthMessage message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message.data.name),
      ),
    );
  }
}
