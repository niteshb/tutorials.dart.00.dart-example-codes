class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

  @override
  String toString() {
    return '{anInt: $anInt, aString: $aString, aDouble: $aDouble}';
  }

  // Add your copyWith method here:
  copyWith({int? newInt, String? newString, double? newDouble}) {
    return MyDataObject(
        anInt: newInt ?? anInt,
        aString: newString ?? aString,
        aDouble: newDouble ?? aDouble);
  }
}

void main(List<String> args) {
  MyDataObject a = MyDataObject();
  MyDataObject b = a.copyWith();
  print(a);
  print(b);
}
