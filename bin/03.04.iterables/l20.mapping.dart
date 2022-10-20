void main(List<String> args) {
  Iterable<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);
  // map() returns a lazy Iterable, meaning that the supplied function is called only when the elements are iterated.
  Iterable<int> tenTimes = numbers.map((number) => number * 10);
  print(tenTimes);
}
