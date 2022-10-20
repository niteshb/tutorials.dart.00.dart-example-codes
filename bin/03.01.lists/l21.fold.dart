import 'package:dart_examples_classified/vayavya/console/embellish.dart';

void main() {
  List<int> a = [1, 2, 3, 4];
  List<int> b = [];
  heading('List.reduce()');
  // reduce needs at least one element
  print('a.sum: ${listSumByReduce(a)}');

  // runtime error: StateError (Bad state: No element)
  try {
    print('b.sum: ${listSumByReduce(b)}');
  } catch (err) {
    print('b.sum: ERROR: $err');
  }

  heading('List.fold()');
  print('a.sum: ${listSumByFold(a)}');
  print('b.sum: ${listSumByFold(b)}');

  heading('List allPositive?');
  bool allPositive = a.fold<bool>(true, (a, b) => a && b > 0);
  print('all positive by fold():  $allPositive');
  print('all positive by every(): ${a.every((e) => e > 0)}');
  stars();
}

int listSumByReduce(List<int> a) {
  int sum = a.reduce((value, element) => value + element);
  return sum;
}

int listSumByFold(List<int> a) {
  int sum = a.fold(0, (value, element) => value + element);
  return sum;
}
