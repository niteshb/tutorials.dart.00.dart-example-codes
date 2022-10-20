class Square extends Shape {}

class Circle extends Shape {}

class Shape {
  Shape();

  factory Shape.fromTypeName(String typeName) {
    if (typeName == 'square') return Square();
    if (typeName == 'circle') return Circle();

    throw ArgumentError('Unrecognized $typeName');
  }
  @override
  String toString() {
    return '$runtimeType()';
  }
}

void main(List<String> args) {
  final c = Shape.fromTypeName('circle');
  print(c);
  final s = Shape.fromTypeName('square');
  print(s);
}
