import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

extension IntFormatCustom on num {
  String formatComma() {
    final formatter = NumberFormat.decimalPattern(
      'en_US',
    ); // Or your desired locale
    return formatter.format(this);
  }

  String formatMinutesToHoursAndMinutes() {
    int hours = this ~/ 60; // หาจำนวนชั่วโมง
    int minutes = toInt() % 60; // หาเศษนาที
    return (hours > 0)
        ? '$hours ${'hour'.tr} $minutes ${'minute'.tr}'
        : '$minutes ${'minute'.tr}';
  }

  DateTime formatEpochToDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(
      (toInt() + 25200) * 1000,
    ); //แปลงเป็น timezone ไทย +7 ชั่วโมง
  }

  String formatAddDicimal({
    bool hideDicimalIfInt = true,
    int numberDicimal = 2,
  }) {
    if (this % 1 != 0) {
      // Number has a decimal part
      return toStringAsFixed(numberDicimal);
    } else {
      // Number is an integer
      return toStringAsFixed(0);
    }
  }
}
