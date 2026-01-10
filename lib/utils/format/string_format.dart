extension StringFormatCustom on String {
  String formatPhoneNumber() {
    return length > 6
        ? '${substring(0, 3)}-${substring(3, 6)}-${substring(6, length)}'
        : this;
  }

  DateTime formatToDateTime() {
    return DateTime.parse(this);
  }

  DateTime formatEpochToDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(
        ((int.tryParse(this) ?? 0)) * 1000);
  }

  String formatCheckEmpty() {
    if (isEmpty) {
      return '-';
    } else {
      return this;
    }
  }
}
