final f = () async* {
  throw Exception('some error: 1');
}() as Stream<int>;

final f1 = Stream.fromFuture(Future.error(Exception('some error: 2')));

Stream<int> getNumbersWithException() async* {
  for (var i = 0; i < 10; i++) {
    yield i;
    if (i == 3) {
      // method 0: not really a method
      // throw Exception('some error: 0'); // this is wrong. this will stop the stream and generate runtime error

      // method 1: this is not as good as the next one. In debug mode, execution stops here
      // yield* f;

      // method 2:
      // somehow this magically returns a Stream<int>. Note that f1 (defined as global up there is Stream<dynamic>)
      yield* Stream.fromFuture(Future.error(Exception('some error: 2')));
    }
  }
}

void main(List<String> args) {
  getNumbersWithException()
      .handleError((x) => print('error in the stream: $x'))
      .listen(
    (event) {
      print('Observed: $event');
    },
    // this will work only if there is no handleError
    // comment that line to see this work
    onError: (err) {
      print('subscription got an error in the stream: $err');
    },
    onDone: () {
      print('stream done');
    },
    // seemingly this has no effect
    cancelOnError: true,
  );
}
