import 'package:devy_boiler_plate/presentation/auth/login_page.dart';
import 'package:devy_boiler_plate/presentation/auth/service/auth.dart';
import 'package:devy_boiler_plate/common/widget/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static const routeName = '/dashboard-page';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
