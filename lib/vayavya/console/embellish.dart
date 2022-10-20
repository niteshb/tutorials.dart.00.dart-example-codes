void stars([int i = 80]) {
  print('*' * i);
}

void pprint({int repeat = 80, char = '='}) {
  print('$char' * repeat);
}

void heading(String text, {String char = '*'}) {
  pprint(char: char);
  print('$char $text');
  pprint(char: char);
}
