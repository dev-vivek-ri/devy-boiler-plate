import 'package:devy_boiler_plate/presentation/auth/component/login_form.dart';
import 'package:devy_boiler_plate/utils/helper/responsive.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login.dart';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ResponsiveLayout(
            mobileLayout: LoginForm(),
            tabletLayout: Row(
              children: [
                SizedBox(width: 200),
                Expanded(child: LoginForm()),
              ],
            ),
            desktopLayout: Row(
              children: [
                SizedBox(width: 400),
                Expanded(child: LoginForm()),
                SizedBox(width: 400),
              ],
            )));
  }
}
