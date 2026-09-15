// Exercise 4: Introduction to Object-Oriented Programming

// Car là lớp cha.
class Car {
  String brand;

  // Constructor thông thường.
  Car(this.brand);

  // Named constructor tạo xe có thương hiệu mặc định.
  Car.defaultCar() : brand = 'Toyota';

  // Phương thức của lớp Car.
  void drive() {
    print('$brand car is using fuel to drive.');
  }
}

// ElectricCar kế thừa lớp Car.
class ElectricCar extends Car {
  int batteryLevel;

  // super(brand) gọi constructor của lớp Car.
  ElectricCar(String brand, this.batteryLevel) : super(brand);

  // Ghi đè phương thức drive().
  @override
  void drive() {
    print(
      '$brand electric car is driving with '
          '$batteryLevel% battery.',
    );
  }
}

void main() {
  // Tạo đối tượng bằng constructor thông thường.
  Car firstCar = Car('Honda');

  // Tạo đối tượng bằng named constructor.
  Car defaultCar = Car.defaultCar();

  // Tạo đối tượng từ lớp ElectricCar.
  ElectricCar electricCar = ElectricCar('Tesla', 90);

  // Gọi phương thức của các đối tượng.
  firstCar.drive();
  defaultCar.drive();
  electricCar.drive();
}