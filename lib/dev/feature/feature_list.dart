import 'dart:convert';

import 'package:devy_boiler_plate/dev/feature/feature.dart';
import 'package:devy_boiler_plate/manager/local_storage/shared_preferences.dart';
import 'package:flutter/material.dart';

class FeatureList extends StatefulWidget {
  const FeatureList({super.key});

  @override
  State<FeatureList> createState() => _FeatureListState();
}

class _FeatureListState extends State<FeatureList> {
  void postEnv(String type, {bool? value}) {
    if (value!) {
      switch (type) {
        case 'dev':
          Feature.isDev = value;
          Feature.isUAT = !value;
          Feature.isProd = !value;
          break;
        case 'uat':
          Feature.isDev = !value;
          Feature.isUAT = value;
          Feature.isProd = !value;
          break;
        case 'prod':
          Feature.isDev = !value;
          Feature.isUAT = !value;
          Feature.isProd = value;
          break;
      }
      setState(() {});
      changeCache();
    }
  }

  Future<void> changeCache() async {
    final Map<String, bool> json = {
      'isLocal': Feature.isLocal,
      'isDev': Feature.isDev,
      'isUAT': Feature.isUAT,
      'isProd': Feature.isProd,
      'isLogging': Feature.isLogging,
    };

    SharedPreferencesManager().setValue(
      Store.feature,
      jsonEncode(json),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          'Feature',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text:
                          "This page is only available to the dev Application.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text:
                              " Turn on and off these feature will hide or disable the features in the app (only for you)",
                        ),
                        TextSpan(
                          text:
                              " There is corresponding remote config from the firebase to do the same in the production app",
                        ),
                        TextSpan(
                          text:
                              " Some feature need to clear the whole app to get reflect. So please restart the application once u made changes in this page",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            SwitchListTile(
              
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Debug Log",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Disable the Debug Log.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onChanged: (bool value) {
                Feature.isLogging = value;
                setState(() {});
                changeCache();
              },
              value: Feature.isLogging,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Environment",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  RichText(
                    text: const TextSpan(
                      text:
                          "Switch between the url to access the different environment",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SwitchListTile(
                    
                    title: const Text("Dev"),
                    onChanged: (bool value) {
                      postEnv('dev', value: value);
                    },
                    value: Feature.isDev,
                  ),
                  SwitchListTile(
                    
                    title: const Text("QA"),
                    onChanged: (bool value) {
                      postEnv('uat', value: value);
                    },
                    value: Feature.isUAT,
                  ),
                  SwitchListTile(
                    
                    title: const Text("Prod"),
                    onChanged: (bool value) {
                      postEnv('prod', value: value);
                    },
                    value: Feature.isProd,
                  ),
                ],
              ),
            ),
            const Divider(),
            
          ],
        ),
      ),
    );
  }
}
