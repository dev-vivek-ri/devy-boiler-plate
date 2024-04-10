import 'package:intl/intl.dart';

class DateHelper {
  static String weatherDate = "yyyy-MM-dd";
  static String logDate = "yyyy-MM-dd HH:mm:ss.SSSZ";
  static String dayDateMonthYear = "E, dd MMM yyyy";
  static String hHMMA = "HH:mm a";
  static String hhMMA = "hh:mm a";
  static String mMM = "MMM";
  static String dD = "dd";
  static String yYYY = "yyyy";
  static String dayDateMonthYearHourMinuteAmPm = "E, dd MMM yyyy HH:mm a";

  static Duration dateDiffWithToday(
      {required String dateString, required String format}) {
    var today = DateTime.now();
    var date = stringToDate(dateString, format);

    Duration duration = date.difference(today);
    if (duration.inDays < 0) {
      duration = const Duration(days: 0);
    }
    return duration;
  }

  static Duration dateDiff(
      {required String dateString1,
      required String dateString2,
      required String format}) {
    var date1 = stringToDate(dateString1, format);
    var date2 = stringToDate(dateString2, format);

    Duration duration = date1.difference(date2);
    return duration;
  }

  static bool isDateDiffMonth(
      {required String dateString1,
      required String dateString2,
      required String format}) {
    var date1 = stringToDate(dateString1, format);
    var date2 = stringToDate(dateString2, format);

    if (date1.month != date2.month) {
      return true;
    }
    return false;
  }

  static String dateToString(date, format) {
    try {
      return DateFormat(format).format(date);
    } on Exception catch (_) {
      return "";
    }
  }

  static DateTime stringToDate(dateString, format) {
    try {
      return DateFormat(format).parse(dateString, true);
    } on Exception catch (_) {
      try {
        return DateFormat(weatherDate).parse(dateString, true);
      } on Exception catch (_) {
        return DateTime.now();
      }
    }
  }

  static String stringDateToCustomStringDate(
      {required String dataString,
      required String format,
      required String outFormat,
      required bool toConvert}) {
    DateTime date = stringToDate(dataString, format);
    if (toConvert) {
      date = dateToLocal(date);
    }
    return dateToString(date, outFormat);
  }

  static DateTime dateToLocal(dateTime) {
    try {
      dateTime = DateTime.utc(dateTime.year, dateTime.month, dateTime.day,
          dateTime.hour, dateTime.minute, dateTime.second);
      return dateTime.toLocal();
    } on Exception catch (_) {
      return DateTime.now();
    }
  }

  static DateTime dateToUTC(dateTime) {
    try {
      dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
          dateTime.hour, dateTime.minute, dateTime.second);
      return dateTime.toUtc();
    } on Exception catch (_) {
      return DateTime.now();
    }
  }
}
