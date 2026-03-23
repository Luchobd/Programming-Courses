void main() {
  final numbers = [1,2,3,4,5,5,5,6,7,8,9,9,10];

  print('List Original ${numbers}'); // List -> "lista" (colección de elementos)
  print('Length ${numbers.length}'); // List -> "lista" (colección de elementos)
  print('Index 0: ${numbers[0]}'); // List -> "lista" (colección de elementos)
  print('First ${numbers.first}'); // List -> "lista" (colección de elementos)
  print('Last ${numbers.last}'); // List -> "lista" (colección de elementos)
  print('Reversed ${numbers.reversed}'); // Iterable -> "iterable" (colección de elementos que se pueden recorrer)

  final reversedNumbers = numbers.reversed;
  print('Iterable ${reversedNumbers}'); // Iterable -> "iterable" (colección de elementos que se pueden recorrer)
  print('List ${reversedNumbers.toList()}'); // List -> "lista" (colección de elementos)
  print('Set ${reversedNumbers.toSet()}'); // Set -> "conjunto" (colección de elementos únicos). No existe valores duplicados en un Set, por lo que los valores repetidos se eliminan automáticamente.
  
  // Where -> "donde" (filtra los elementos de una colección según una condición)
  final numbersGreaterThan5 = numbers.where((int num) {
    return num > 5;
  });

  print('>5: ${numbersGreaterThan5}'); // Iterable -> "iterable" (colección de elementos que se pueden recorrer)
}