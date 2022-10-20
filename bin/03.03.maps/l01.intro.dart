import 'package:dart_examples_classified/vayavya/console/embellish.dart';

void main(List<String> args) {
  Map m = {
    1: 2,
    3: 4,
    5: 6,
  };
  heading('entries');
  m.entries.forEach(print);
  MapEntry me0 = m.entries.first;
  print('first: ${me0.key}, ${me0.value}');
  MapEntry mel = m.entries.last;
  print(' last: ${mel.key}, ${mel.value}');
  print('# of Map Entries: ${m.length}');
  heading('keys');
  m.keys.forEach(print);
  heading('values');
  m.values.forEach(print);
}
