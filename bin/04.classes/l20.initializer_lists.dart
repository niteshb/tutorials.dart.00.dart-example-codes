// Initializer lists
// Sometimes when you implement a constructor, you need to do some setup before the constructor body executes. For example, final fields must have values before the constructor body executes. Do this work in an initializer list, which goes between the constructor’s signature and its body:
class Point {
  double x;
  double y;
  Point(this.x, this.y) {
    print('I just made a Point: ($x, $y)');
  }
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }
  @override
  String toString() {
    return '$runtimeType($x, $y)';
  }
}

// The initializer list is also a handy place to put asserts, which run only during development:
class NonNegativePoint extends Point {
  NonNegativePoint(double x, double y)
      : assert(x >= 0),
        assert(y >= 0),
        super(x, y) {
    print('I just made a NonNegativePoint: ($x, $y)');
  }
}

void main(List<String> args) {
  final p = Point(10, -20);
  final np1 = NonNegativePoint(10, 20);
  print(p);
  print(np1);
  final NonNegativePoint np2;
  try {
    np2 = NonNegativePoint(-10, 20);
    print(np2);
  } catch (err) {
    print('Error');
  }
}

/*
https://dart.dev/codelabs/dart-cheatsheet
Exercise
Complete the FirstTwoLetters constructor below. Use an initializer list to
 assign the first two characters in word to the letterOne and LetterTwo
 properties. For extra credit, add an assert to catch words of less than two 
 characters.
class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;
  FirstTwoLetters(String word)
  ...TO.DO...
}
*/
class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  FirstTwoLetters(String word)
      : assert(word.length >= 2),
        letterOne = word[0],
        letterTwo = word[1];
}
