import 'package:dart_examples_classified/vayavya/console/embellish.dart';
import 'package:intl/intl.dart';

String scream(int length) => "A${'a' * length}h!";

main() {
  final values = [1, 2, 3, 5, 10, 50, 100];
  // imperative screams
  heading('imperative screams');
  for (var length in values) {
    print(scream(length));
  }
  // functional scream
  heading('functional screams');
  values.map(scream).forEach(print);
  // Use more Iterable features
  // The core List and Iterable classes support fold(), where(), join(), skip(),
  // and more. Dart also has built-in support for maps and sets.
  heading('more functional magic');
  values.skip(1).take(3).map(scream).forEach(print);
  heading('more functional magic2');
  f(int i) => NumberFormat('0').format(i).padLeft(3, ' ');
  values.map((e) => '${f(e)}. ${scream(e)}').forEach(print);
}
