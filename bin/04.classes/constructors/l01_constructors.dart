// ignore_for_file: unused_local_variable

void main() {
  final c10o1 = Class10();
  final c11o1 = Class11();

  // final c20o1 = Class20(); // compile error: The class 'Class20' doesn't have an unnamed constructor. Try using one of the named constructors defined in 'Class20'.
  final c20o2 = Class20.named1();

  final c21o1 = Class21();
  final c21o2 = Class21.named1();
  final c21o3 = Class21.named2();
}

class Class10 {
  //Class10(); // unnamed constructor, exists as a default constructor
}

class Class11 {
  Class11() {
    // unnamed constructor, default unnamed constructor is overridden
    1;
  }
}

class Class20 {
  // unnamed constructor ceases to exist as default if there is a named
  Class20.named1(); // named constructor
  Class20.named2(); // another named constructor
}

class Class21 {
  // unnamed constructor ceases to exist as default if there is a named
  Class21.named1(); // named constructor
  Class21.named2(); // another named constructor
  Class21(); // you can still define an unnamed constructor
}

class Class22 {
  // unnamed constructor ceases to exist as default if there is a named
  Class22.named1(); // named constructor
  Class22.named2(); // another named constructor
  Class22(); // you can still define an unnamed constructor
  Class22._private(); // private constructor
  // factory constructor
  factory Class22.factory1() {
    return Class22._private();
  }
}
