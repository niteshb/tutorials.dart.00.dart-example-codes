void main() {
  const items = ['Salad', 'Popcorn', 'Toast'];

  if (items.any((item) => item.contains('a'))) {
    print('At least one item contains "a"');
  }

  if (items.every((item) => item.length >= 5)) {
    print('All items have length >= 5');
  }
  if (items.any((item) => item.contains('Z'))) {
    print('At least one item contains "Z"');
  } else {
    print('No item contains "Z"');
  }
}
