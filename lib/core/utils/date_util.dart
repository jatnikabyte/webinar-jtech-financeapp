import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(DateTime? date, {String format = 'dd/MM/yyyy'}) {
    if (date == null) return '-';
    return DateFormat(format).format(date);
  }

  static DateTime? parseDate(
    String dateString, {
    String format = 'yyyy-MM-dd',
  }) {
    try {
      return DateFormat(format).parse(dateString);
    } catch (_) {
      return null;
    }
  }

  static String timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 1) return '${diff.inDays} days ago';
    if (diff.inHours > 1) return '${diff.inHours} hours ago';
    return '${diff.inMinutes} minutes ago';
  }
}
