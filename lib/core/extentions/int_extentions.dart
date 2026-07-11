extension NumberFormatExtension on int {
  String get compact {
    if (this >= 1000000000) {
      return '${(this / 1000000000).toStringAsFixed(this % 1000000000 == 0 ? 0 : 1)}B';
    }
    if (this >= 1000000) {
      return '${(this / 1000000).toStringAsFixed(this % 1000000 == 0 ? 0 : 1)}M';
    }
    if (this >= 1000) {
      return '${(this / 1000).toStringAsFixed(this % 1000 == 0 ? 0 : 1)}K';
    }
    return toString();
  }
}
