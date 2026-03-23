void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('https://lucho.com/clases');
    print(value);
  } catch (err) {
    print('Tenemos un error: $err');
  }

  print('Fin del programa');
}

// Una función asíncrona siempre va a retornar un "Future".
Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));

  throw 'Error en la petición';

  // return 'Tenemos un valor de la petición';
}
