// async means one value return, async* means multiple values returned
// sync* is a generator, async* is stream. Both 'yield'

Stream<int> countStream({int start = 1, int last = 10}) async* {
  if (start > last) {
    throw ('start > last');
  }
  for (int i = start; i <= last; i++) {
    yield i;
  }
}

Future<int> sumAsync(Stream<int> stream) async {
  int value, sum = 0;
  print('awaiting data from stream, sum: $sum');
  await for (value in stream) {
    sum += value;
    print('got $value from stream, sum: $sum');
  }
  return sum;
}

void main() async {
  Stream<int> stream = countStream(start: 3, last: 7);
  print('stream: $stream');
  sumAsync(stream).then((sum) => print('sum: $sum'));
  // another listener will cause runtime error
  // sumAsync(stream).then(print);
  // you can't even run length or isEmpty
  print('main:: main is done');
}
