import 'package:devy_boiler_plate/common/widget/app_button.dart';
import 'package:devy_boiler_plate/common/widget/app_form_field.dart';
import 'package:devy_boiler_plate/common/widget/app_sized_box.dart';
import 'package:devy_boiler_plate/utils/helper/feedback_helper.dart';
import 'package:devy_boiler_plate/utils/helper/keyboard.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? username;
  String? password;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppSizedBox.sized40,
            AppFormField(
              controller: _usernameController,
              label: AppLocalizations.of(context)!.userName,
              icon: Icons.person,
              errorMessage: AppLocalizations.of(context)!.userNameError,
              onChanged: (value) {
                username = value;
              },
            ),
            AppSizedBox.sized10,
            AppFormField(
              controller: _passwordController,
              isPassword: true,
              label: AppLocalizations.of(context)!.password,
              errorMessage: AppLocalizations.of(context)!.passwordError,
              icon: Icons.password,
              onChanged: (value) {
                password = value;
              },
            ),
            AppSizedBox.sized40,
            AppButton(
                buttonName: AppLocalizations.of(context)!.login,
                onClick: () {
                  KeyboardUtil.hideKeyboard(context);
                  if (_formKey.currentState!.validate()) {
                  } else {
                    FeedbackHelper().showSnackBar(
                        context,
                        type: Type.error,
                        AppLocalizations.of(context)!.invalidCredintial);
                  }
                }),
            AppSizedBox.sized20,
            Row(
              children: [
                const Spacer(),
                AppButton(
                    backGroundColor: Theme.of(context).colorScheme.onPrimary,
                    textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    buttonName: AppLocalizations.of(context)!.loginGuest,
                    onClick: () {}),
                const Spacer(),
              ],
            ),
            AppSizedBox.sized40,
          ],
        ),
      ),
    );
  }
}
