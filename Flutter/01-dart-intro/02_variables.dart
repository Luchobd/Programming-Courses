void main() {
  final String pokemon = 'Ditto'; // String -> "cadena de texto" (texto entre comillas)
  final int hp = 100; // int -> "integer" (números enteros)
  final bool isAlive = true; // bool -> "boolean" (verdadero o falso)
  final List<String> abilities = ['impostor', 'transformación']; // List -> "lista" (colección de elementos)
  final sprites = <String>['ditto/front.png', 'ditto/back.png']; // List<String> -> "lista de cadenas de texto" (colección de texto entre comillas)

  // dynamic == null -> "dinámico" (puede ser cualquier tipo de dato)
  dynamic errorMessage = 'Hola';
  errorMessage = 5; // Se puede cambiar el tipo de dato
  errorMessage = false; // Se puede cambiar el tipo de dato
  errorMessage = ['Hola', 'Mundo']; // Se puede cambiar el tipo de dato
  errorMessage = {'message': 'Hola Mundo'}; // Se puede cambiar el tipo de dato
  errorMessage = null; // Se puede cambiar el tipo de dato

  print("""
    $pokemon
    $hp
    $isAlive
    $abilities
    $sprites
    $errorMessage
""");
}
