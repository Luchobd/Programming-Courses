void main() {
  print(greetEveryone());

  print('Suma: ${addTwoNumbers(25, 50)}');

  print(greetPerson(name: 'Lucho'));
}

String greetEveryone() {
  return "Hello Everyone!!!";
}

int addTwoNumbers(int a, int b) => a + b;

// Optional parameters -> "parámetros opcionales" (parámetros que no son obligatorios)
int addTwoNumbersOptional(int a, [int? b = 0]) {
  return a + (b ?? 0);
}

// Parameters opcionales nombrados -> "named optional parameters" (parámetros opcionales que se pueden nombrar al llamar a la función)
String greetPerson({required String name, String message = ''}) {
  return 'Hola $name ${message}';
}
