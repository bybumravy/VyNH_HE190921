class Car {
  String brand;
  Car(this.brand);
  Car.defaultCar() : brand = 'Toyota';
  void drive() {
    print('$brand car is using fuel to drive.');
  }
}

class ElectricCar extends Car {
  int batteryLevel;
  ElectricCar(String brand, this.batteryLevel) : super(brand);
  @override
  void drive() {
    print(
      '$brand electric car is driving with '
          '$batteryLevel% battery.',
    );
  }
}

void main() {
  Car firstCar = Car('Honda');

  Car defaultCar = Car.defaultCar();

  ElectricCar electricCar = ElectricCar('Tesla', 90);

  firstCar.drive();
  defaultCar.drive();
  electricCar.drive();
}