import 'package:flutter_dotenv/flutter_dotenv.dart';

class Feature {
  static bool isLocal = false;
  static bool isDev = true;
  static bool isUAT = false;
  static bool isProd = false;
  static bool isLogging = true;
  static bool isAnaltics = true;

  bool getENV() {
    return dotenv.env['ENV'] == 'dev';
  }

  String? getAPIURL() {
    String? url;

    url = dotenv.env['API_URL_DEV'];

    if (isLocal) {
      url = dotenv.env['API_URL_LOCAL'];
    }

    if (isDev) {
      url = dotenv.env['API_URL_DEV'];
    }

    if (isUAT) {
      url = dotenv.env['API_URL_QA'];
    }

    if (isProd) {
      url = dotenv.env['API_URL_PROD'];
    }

    return url;
  }

  String? getRazorpayURL() {
    String? url = dotenv.env['RAZOR_PAY_PUBLIC_KEY_TEST'];

    if (isLocal) {
      url = dotenv.env['RAZOR_PAY_PUBLIC_KEY_TEST'];
    }

    if (isDev) {
      url = dotenv.env['RAZOR_PAY_PUBLIC_KEY_TEST'];
    }

    if (isUAT) {
      url = dotenv.env['RAZOR_PAY_PUBLIC_KEY_TEST'];
    }

    if (isProd) {
      url = dotenv.env['RAZOR_PAY_PUBLIC_KEY_TEST'];
    }

    return url;
  }

  String? getWeatherAPIKey() {
    return dotenv.env['WEATHER_API_KEY'];
  }

  String? getDeeplinkURL() {
    return dotenv.env['DEEP_LINK_URL'];
  }

  String? getAmplitudeID() {
    return dotenv.env['AMPLITUDE_ID'];
  }
}
