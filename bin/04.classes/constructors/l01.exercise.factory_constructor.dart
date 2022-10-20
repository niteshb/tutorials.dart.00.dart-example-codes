/* https://dart.dev/codelabs/dart-cheatsheet#factory-constructors
Fill in the factory constructor named IntegerHolder.fromList, making it do the following:

If the list has one value, create an IntegerSingle with that value.
If the list has two values, create an IntegerDouble with the values in order.
If the list has three values, create an IntegerTriple with the values in order.
Otherwise, throw an Error.


class IntegerHolder {
  IntegerHolder();
  
  // Implement this factory constructor.
  factory IntegerHolder.fromList(List<int> list) {
    ...TO.DO...
  }
}

*/
class IntegerHolder {
  IntegerHolder();

  // Implement this factory constructor.
  factory IntegerHolder.fromList(List<int> list) {
    switch (list.length) {
      case (1):
        return IntegerSingle(list[0]);
      case (2):
        return IntegerDouble(list[0], list[1]);
      case (3):
        return IntegerTriple(list[0], list[1], list[2]);
      default:
        //'invalid length of list passed as argument'
        throw Error();
    }
  }
}

class IntegerSingle extends IntegerHolder {
  final int a;
  IntegerSingle(this.a);
  @override
  String toString() {
    return '$runtimeType($a)';
  }
}

class IntegerDouble extends IntegerHolder {
  final int a;
  final int b;
  IntegerDouble(this.a, this.b);
  @override
  String toString() {
    return '$runtimeType($a, $b)';
  }
}

class IntegerTriple extends IntegerHolder {
  final int a;
  final int b;
  final int c;
  IntegerTriple(this.a, this.b, this.c);
  @override
  String toString() {
    return '$runtimeType($a, $b, $c)';
  }
}

void main(List<String> args) {
  final s = IntegerHolder.fromList([1]);
  print(s);
  final d = IntegerHolder.fromList([2, 3]);
  print(d);
  final t = IntegerHolder.fromList([4, 5, 6]);
  print(t);
  try {
    final e = IntegerHolder.fromList([]);
    print(e);
  } catch (err) {
    print('$err');
  }
}
