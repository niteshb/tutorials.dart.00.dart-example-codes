Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is
    // more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

Future<void> main() async {
  print('Fetching user order...');
  print(await createOrderMessage());
  print('main:: end of main');
}
/*
An async function runs synchronously until the first await keyword. This means 
that within an async function body, all synchronous code before the first await 
keyword executes immediately.
*/