void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('https://lucho.com/clases');
    print('éxito: $value');
  } on Exception catch(err) {
    print('Tenemos una Exception: $err');
  } catch (err) {
    print('OPP!! algo terrible pasó: $err');
  } finally {
    print('Fin del try y catch');
  }

  print('Fin del programa');
}

// Una función asíncrona siempre va a retornar un "Future".
Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));

  throw Exception('No hay parámetros en la URL');

  // throw 'Error en la petición';

  // return 'Tenemos un valor de la petición';
}
