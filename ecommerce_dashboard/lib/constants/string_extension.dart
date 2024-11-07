extension StringExtension on String {
  String capitailize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}