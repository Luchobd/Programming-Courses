void main() {
  final Hero wolverine = new Hero(name: 'Logan', power: 'Regeneration');

  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
}

class Hero {
  String name;
  String power;

  // Constructor con sintaxis tradicional. En este caso, se asignan los parámetros a las propiedades dentro del cuerpo del constructor. "No es tan común en Dart"
  // Hero (String pName, String pPower) {
  //   this.name = pName;
  //   this.power = pPower;
  // }

  // Constructor con sintaxis de inicialización de campos. En este caso, se asignan los parámetros a las propiedades directamente en la lista de inicialización del constructor. "Es la forma más común en Dart"
  // Hero(String pName, String pPower) : name = pName, power = pPower;

  // Constructor con sintaxis de parámetros de campo. En este caso, se asignan los parámetros a las propiedades directamente en la lista de parámetros del constructor. "Es la forma más común en Dart"
  Hero({required this.name, required this.power});

  // Sobrescribimos el método toString para que imprima un mensaje personalizado en lugar de la representación predeterminada del objeto.
  // El método toString es un método especial en Dart que se utiliza para obtener una representación de cadena de un objeto. Al sobrescribir este método, podemos personalizar cómo se muestra el objeto cuando se imprime o se convierte a una cadena.
  // En este caso, el método toString devuelve una cadena que contiene el nombre y el poder del héroe, separados por un guion. Esto hace que la salida sea más legible y significativa cuando se imprime el objeto Hero.
  @override
  String toString() {
    return '$name - $power';
  }
}
