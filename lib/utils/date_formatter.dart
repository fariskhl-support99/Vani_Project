class VaniDateFormatter {
  static String formatChatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0 && now.day == dateTime.day) {
      final hour = dateTime.hour > 12 ? dateTime.hour - 12 : (dateTime.hour == 0 ? 12 : dateTime.hour);
      final period = dateTime.hour >= 12 ? 'م' : 'ص';
      final minute = dateTime.minute.toString().padLeft(2, '0');
      return '$hour:$minute $period';
    } else if (difference.inDays == 1 || (difference.inDays == 0 && now.day != dateTime.day)) {
      return 'أمس';
    } else if (difference.inDays < 7) {
      return _getArabicDayName(dateTime.weekday);
    } else {
      return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
    }
  }

  static String _getArabicDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday: return 'الإثنين';
      case DateTime.tuesday: return 'الثلاثاء';
      case DateTime.wednesday: return 'الأربعاء';
      case DateTime.thursday: return 'الخميس';
      case DateTime.friday: return 'الجمعة';
      case DateTime.saturday: return 'السبت';
      case DateTime.sunday: return 'الأحد';
      default: return '';
    }
  }
}
