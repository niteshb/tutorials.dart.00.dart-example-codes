// Implement the predicate of singleWhere
// with the following conditions
// * The element contains the character `'a'`
// * The element starts with the character `'M'`
String singleWhere(Iterable<String> items) {
  return items.singleWhere((s) => (s.startsWith('M') && s.contains('a')));
}

void main(List<String> args) {
  Iterable<String> i = ['Human', 'Monkey', 'Master', 'Raster', 'Mercantile'];
  try {
    print(singleWhere(i));
  } catch (err) {
    print(err);
  }
  try {
    print(singleWhere(i.take(1)));
  } catch (err) {
    print(err);
  }
  try {
    print(singleWhere(i.take(4)));
  } catch (err) {
    print(err);
  }
}
