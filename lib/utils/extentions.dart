extension StringExtension on String {
  String get firstChar => isNotEmpty ? substring(0, 1) : '';
}
