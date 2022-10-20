import 'package:dart_examples_classified/vayavya/console/embellish.dart';

void main(List<String> args) {
  Iterable<int> iterable = [1, 2, 3, 5, 8, 13, 21];
  print('iterable: $iterable');

  // The difference with a List is that with the Iterable, you can’t guarantee
  // that reading elements by index will be efficient.
  // Iterable, as opposed to List, doesn’t have the [] operator.

  // COMPILE ERROR: The operator '[]' isn't defined for the type 'Iterable<int>'.
  // int value = iterable[1];
  print('elementAt(1): ${iterable.elementAt(1)}');
  print('       first: ${iterable.first}');
  print('        last: ${iterable.last}');

  heading('using for loop');
  for (final element in iterable) {
    print(element);
  }

  // forEach
  heading('using forEach');
  iterable.forEach(print);

  heading('firstWhere');
  int e = iterable.firstWhere((element) => element > 2);
  print('firstWhere element > 2: $e');
}
