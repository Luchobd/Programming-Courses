void main() {
  emitNumbers().listen((value) {
    print('Stream value: $value');
  });
}

// Stream => Son un flujo de dato que puede ser un único valor, ningún valor o una serie de valores a lo largo del tiempo. 
Stream<int> emitNumbers() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    // print('desde periodic $value');
    return value;
  }).take(5); // .take => Solo toma N cantidad de emisiones y luego se cierra.
}
