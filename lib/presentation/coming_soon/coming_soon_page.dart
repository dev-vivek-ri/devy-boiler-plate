import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  static const routeName = '/coming-soon-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.comingSoon),
      ),
      body:  Center(
        child: Text(AppLocalizations.of(context)!.underDevelopment),
      ),
    );
  }
}
