extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String smallize() {
    return '${this[0].toLowerCase()}${substring(1)}';
  }
}
