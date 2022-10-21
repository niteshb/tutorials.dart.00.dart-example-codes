import 'package:dart_examples_classified/vayavya/console/embellish.dart';

/// Splits a stream of consecutive strings into lines.
///
/// The input string is provided in smaller chunks through
/// the `source` stream.
Stream<String> lines(Stream<String> source) async* {
  // Stores any partial line from the previous chunk.
  var partial = '';
  // Wait until a new chunk is available, then process it.
  await for (final chunk in source) {
    var lines = chunk.split('\n');
    lines[0] = partial + lines[0]; // Prepend partial line.
    partial = lines.removeLast(); // Remove new partial line.
    for (final line in lines) {
      yield line; // Add lines to output stream.
    }
  }
  // Add final partial line to output stream, if any.
  if (partial.isNotEmpty) yield partial;
}

Stream<String> streamFromStringList(List<String> strings) async* {
  String string;
  for (string in strings) {
    yield string;
  }
}

void main(List<String> args) async {
  String string;
  Stream<String> streamStrings;
  List<String> strings = [
    'Pass the ',
    'salt.\nMove out of my way!\nShut ',
    'the front door.\nFind my leather jacket',
    '.\nBe there at five.\nClean ',
    'your room.\nComplete these by tomorrow.\nCon',
    'sider the red dress.\nWai',
    't for me.\nGet out!\nMake sur',
    'e you pack warm clothes.\nChoo',
    'se Eamonn, not Sea',
    'mus.\nPlease be q',
    'uiet.\nBe nice to your friend',
    's.\nPlay ball!\n',
  ];
  /*
  heading('List of Strings');
  for (string in strings) {
    print(string);
  }
  streamStrings = streamFromStringList(strings);
  heading('Stream of Strings');
  await for (string in streamStrings) {
    print(string);
  }*/

  heading('Stream of Lines');
  streamStrings = streamFromStringList(strings);
  Stream<String> streamLines = lines(streamStrings);
  await for (string in streamLines) {
    print(string);
  }
}
