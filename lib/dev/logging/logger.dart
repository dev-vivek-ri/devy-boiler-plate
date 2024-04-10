
import 'package:devy_boiler_plate/dev/feature/feature.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
      methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
  ),
);

Logger loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0, printTime: true),
);

class DevLogger {
  void logStackInfo(dynamic message) {
    if (Feature.isLogging) {
      logger.d(message);
    }
  }

  void logStackError(dynamic message) {
    if (Feature.isLogging) {
      logger.e(message);
    }
  }

  void logStackVerbose(dynamic message) {
    if (Feature.isLogging) {
      logger.t(message);
    }
  }

  void logStackWarning(dynamic message) {
    if (Feature.isLogging) {
      logger.w(message);
    }
  }

  void logNoStackInfo(dynamic message) {
    if (Feature.isLogging) {
      loggerNoStack.d(message);
    }
  }

  void logNoStackError(dynamic message) {
    if (Feature.isLogging) {
      loggerNoStack.e(message);
    }
  }

  void logNoStackVerbose(dynamic message) {
    if (Feature.isLogging) {
      loggerNoStack.t(message);
    }
  }

  void logNoStackWarning(dynamic message) {
    if (Feature.isLogging) {
      loggerNoStack.w(message);
    }
  }
}
