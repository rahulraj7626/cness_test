import 'dart:math';

/// Extention for random select item
extension RandomItem<T> on List<T> {
  T? randomItem() {
    if (isEmpty) return null;
    return this[Random().nextInt(length)];
  }
}
