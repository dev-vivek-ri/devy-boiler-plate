import 'package:devy_boiler_plate/presentation/auth/login_page.dart';
import 'package:devy_boiler_plate/presentation/auth/service/auth.dart';
import 'package:devy_boiler_plate/common/widget/logo_widget.dart';
import 'package:devy_boiler_plate/presentation/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  static const routeName = '/splash-screen';

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    context.read<Auth>().checkLogin().then((value) {
      if (context.read<Auth>().getIsLogin) {
        _load();
      }
    });
    Future.delayed(const Duration(milliseconds: 4500), () {
      context.read<Auth>().checkLogin().then((value) {
        if (context.read<Auth>().getIsLogin) {
          Navigator.pushReplacementNamed(context, DashboardPage.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        }
      });
    });
    super.initState();
  }

  void _load() {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LogoWidget()),
    );
  }
}
