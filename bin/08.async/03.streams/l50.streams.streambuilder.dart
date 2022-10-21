import 'dart:async';

void main() async {
  final streamController = StreamController<int>();

  final streamSubscription = streamController.stream.listen(
    (event) => print('Value emitted: $event'),
    onError: (err) => print('Error: $err'),
    onDone: () => print('Task done'),
  );

  streamController.add(1);
  streamController.addError('this should not have happenned');

  await Future<void>.delayed(Duration(seconds: 1));
  await streamController.close();
  await streamSubscription.cancel();
}
