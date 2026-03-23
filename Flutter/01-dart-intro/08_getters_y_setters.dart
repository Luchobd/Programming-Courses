void main() {
  final mySquare = new Square(side: 10);

  // mySquare.side = 20;

  print('área: ${mySquare.calculateArea()}');
  print('área: ${mySquare.area}');
}

class Square {
  double _side; // private variable "_side".

  // Square({required double side}) : _side = side; // Por intentar acceder a una variable privada, nos marca un error.
  // Square({required this.side});

  // initializer list, se ejecuta antes del constructor. Es útil para inicializar variables finales o privadas.
  Square({required double side})
    // Si el valor de side es menor a 0, se lanza una excepción. Esto se hace antes de la inicialización de la variable privada _side.
    : assert(side >= 0, 'side must be >= 0'),
    _side = side; // initializer list, se ejecuta antes del constructor.

  // getter
  double get area {
    return _side * _side;
  }

  // setter
  set side(double value) {
    print('setting new value ${value}');
    if (value < 0) throw 'Value must be >= 0';

    _side = value;
  }

  double calculateArea() {
    return _side * _side;
  }
}
