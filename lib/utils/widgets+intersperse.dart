// ignore_for_file: file_names

extension Interspersing<E> on List<E> {
  List<E> interspersedWith(E item) {
    final result = List<E>.empty(growable: true);
    for (var i = 0; i < length; i++) {
      result.add(this[i]);
      if (i < length - 1) result.add(item);
    }
    return result;
  }
}