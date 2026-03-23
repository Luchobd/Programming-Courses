void main() {
  emitNumber().listen((int value) {
    print('Steam value: $value');
  });
}

// Una función asíncrona con (async*) siempre va a retornar un "Stream".
Stream<int> emitNumber() async* {
  final valuesToEmit = [1, 2, 3, 4, 5, 6];

  for (int i in valuesToEmit) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
