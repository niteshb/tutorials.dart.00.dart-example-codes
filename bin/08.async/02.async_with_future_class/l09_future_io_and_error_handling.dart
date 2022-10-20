import 'dart:io';

import 'package:dart_examples_classified/vayavya/console/embellish.dart';

String filePath1 = 'res/a_text_file.txt';
String filePath2 = 'a_file_that_isnt.txt';

//String filePath = filePath1; // for going on the non exception path
String filePath = filePath2; // for going on the Exception path

Future<String> readFoo() async {
  try {
    return await File(filePath).readAsString();
  } catch (err) {
    print(err);
  }
  return Future.value('<Nothing1>');
}

void main(List<String> args) async {
  stars();
  // first approach
  await readFoo().then(print);
  stars();
  // second approach
  final sameAsRunningReadFoo =
      Future(File(filePath).readAsString).catchError((err) {
    print(err);
    return '<Nothing2>'; // catchError wraps it as future
  });
  await sameAsRunningReadFoo.then(print);
  stars();
}
