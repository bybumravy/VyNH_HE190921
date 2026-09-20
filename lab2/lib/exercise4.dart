class Car {
  String brand;
  Car(this.brand);
  Car.defaultCar() : brand = 'Porsche';
  void drive() {
    print('$brand car is driving');
  }
}

class ElectricCar extends Car {
  int battery;
  ElectricCar(String brand, this.battery) : super(brand);
  @override
  void drive() {
    print('$brand electric car is driving with $battery% battery');
  }
}

void main() {
  Car firstCar = Car('Honda');
  Car defaultCar = Car.defaultCar();
  ElectricCar electricCar = ElectricCar('Vinfast', 90);
  firstCar.drive();
  defaultCar.drive();
  electricCar.drive();
}

