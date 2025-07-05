import 'package:intl/intl.dart';

class FunctionalConst {
  Stream<String> getTimeStream() {
    return Stream<String>.periodic(const Duration(seconds: 1), (int _) {
      DateTime now = DateTime.now();

      String cTime = DateFormat("hh:mm").format(now);

      return cTime;
    });
  }

  String extractTwoSentences(String subheading) {
    if (subheading.trim().isEmpty) return '';

    final parts = subheading.split('.');
    if (parts.length >= 2) {
      return "${parts[0].trim()}. ${parts[1].trim()}.";
    } else if (parts.length == 1 && parts[0].trim().isNotEmpty) {
      return "${parts[0].trim()}.";
    } else {
      return '-';
    }
  }
}
