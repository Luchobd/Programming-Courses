void main() {
  final windPlant = new WindPlant(initialEnergy: 100);
  final nuclearPlant = new NuclearPlant(energyLeft: 1000);

  print('wind: ${chargePhone(windPlant)}');
  print('nuclear: ${chargePhone(nuclearPlant)}');
}

double chargePhone(EnergyPlant plant) {
  if (plant.energyLeft < 10) {
    throw Exception('Not enough energy to charge the phone');
  }

  return plant.energyLeft - 10;
}

enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {
  double energyLeft;
  final PlantType type; // nuclear, wind, water

  EnergyPlant({required this.energyLeft, required this.type});

  void consumeEnergy(double amount);
}

// extends: herencia, implement: implementación de una interfaz, mixin: mezcla de clases.
class WindPlant extends EnergyPlant {
  WindPlant({required double initialEnergy})
    : super(energyLeft: initialEnergy, type: PlantType.wind);

  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}

// implements: se utiliza para implementar una interfaz, es decir, una clase que define un contrato que debe ser cumplido por la clase que la implementa. La clase que implementa una interfaz debe implementar todos los métodos definidos en la interfaz. No se puede heredar de una clase abstracta utilizando implements, ya que no se puede heredar de una clase abstracta, solo se puede heredar de una clase concreta. Por lo tanto, si queremos heredar de una clase abstracta, debemos utilizar extends.
class NuclearPlant implements EnergyPlant {
  @override
  double energyLeft;

  @override
  final PlantType type = PlantType.nuclear;

  NuclearPlant({required this.energyLeft});

  @override
  void consumeEnergy(double amount) {
    energyLeft -= (amount * 0.5);
  }
}
