import 'package:dart_examples_classified/vayavya/console/embellish.dart';

main() {
  stars();
  print('* Program starts');
  stars();
  SingletonFactoryConstructor sfc1 = SingletonFactoryConstructor('sfc1');
  SingletonFactoryConstructor sfc2 = SingletonFactoryConstructor('sfc2');
  print(identical(sfc1, sfc2)); // true
  print(sfc1 == sfc2); // true

  stars();
  SingletonStaticFieldWithGetter ssfwg1 =
      SingletonStaticFieldWithGetter.instance;
  // this could be happening inside another function
  SingletonStaticFieldWithGetter ssfwg2 =
      SingletonStaticFieldWithGetter.instance;
  print(identical(ssfwg1, ssfwg2)); // true
  print(ssfwg1 == ssfwg2); // true

  stars();
  SingletonStaticField ssf1 = SingletonStaticField.instance;
  // this could be happening inside another function
  SingletonStaticField ssf2 = SingletonStaticField.instance;
  print(identical(ssf1, ssf2)); // true
  print(ssf1 == ssf2); // true
}

class SingletonEager {
  static final SingletonEager _instance = SingletonEager._privateConstructor();
  SingletonEager._privateConstructor();
  static SingletonEager get instance => _instance;
}

class SingletonLazy {
  static SingletonLazy? _instance;
  SingletonLazy._privateConstructor();
  static SingletonLazy get instance =>
      _instance ??= SingletonLazy._privateConstructor();
}

// Method 1. Factory constructor
class SingletonFactoryConstructor {
  SingletonFactoryConstructor._privateConstructor() {
    print('SingletonFactoryConstructor._privateConstructor');
  }

  static final SingletonFactoryConstructor _instance =
      SingletonFactoryConstructor._privateConstructor();

  factory SingletonFactoryConstructor(String msg) {
    print(msg);
    print('factory SingletonFactoryConstructor');
    return _instance;
  }
}

// Method 2. Static field
// Isn't this same as having a global variable
class SingletonStaticField {
  SingletonStaticField._privateConstructor() {
    print('SingletonStaticField._privateConstructor');
  }

  static final SingletonStaticField instance =
      SingletonStaticField._privateConstructor();
}

// Method 3. Static field with getter
// you may wish to only instantiate the singleton upon first access, in which
// case, you could do so in the getter before returning
// Whatever the above comment mea
class SingletonStaticFieldWithGetter {
  SingletonStaticFieldWithGetter._privateConstructor() {
    print('SingletonStaticFieldWithGetter._privateConstructor');
  }

  static final SingletonStaticFieldWithGetter _instance =
      SingletonStaticFieldWithGetter._privateConstructor();

  static SingletonStaticFieldWithGetter get instance => _instance;
}
