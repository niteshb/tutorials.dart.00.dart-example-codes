void main(List<String> args) {}

void func1() {
  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    // A specific exception
    buyMoreLlamas();
  } on Exception catch (e) {
    // Anything else that is an exception
    print('Unknown exception: $e');
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
    print('I was just trying to breed llamas!');
    rethrow;
  } finally {
    // Always clean up, even if an exception is thrown.
    cleanLlamaStalls();
  }
}

void breedMoreLlamas() {}
void buyMoreLlamas() {}
void cleanLlamaStalls() {}

class OutOfLlamasException {}
