void main() {

  final pokemon = {
    'name': 'Ditto',
    'hp': 100,
    'isAlive': true,
    'abilities': <String>['impostor', 'transformación'],
    'sprites': {
      1: 'ditto/front',
      2: 'ditto/back',
    }
  };

  print(pokemon);
  print('Name: ${pokemon['name']}');
  print('Sprites: ${pokemon['sprites']}');

  print('Back: ${(pokemon['sprites'] as Map<int, String>)[2]}');
  print('Front: ${(pokemon['sprites'] as Map<int, String>)[1]}');
}