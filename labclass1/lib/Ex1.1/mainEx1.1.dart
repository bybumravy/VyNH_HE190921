// TODO 1: Định nghĩa class Vehicle
class Vehicle {
  String brand;
  int year;
  Vehicle(this.brand, this.year);
  void startEngine() {
    print("Khởi động phương tiện...");
  }
}
// TODO 2: Định nghĩa class Car kế thừa từ Vehicle
class Car extends Vehicle {
  bool isElectric;
  // TODO 3: Constructor mặc định cho Car sử dụng super
  Car(String brand, int year, this.isElectric) : super(brand, year);
  Car.tesla(int year)
      : isElectric = true,
        super("Tesla", year){
    print("Khởi tạo xe Tesla");
  }
  // TODO 4: Ghi đè (@override) hàm startEngine()
  @override
  void startEngine() {
    // TODO: implement startEngine
    if (isElectric) {
      print("Khởi động xe điện $brand ($year): Không có tiếng động");
    } else {
      print("Khởi động xe xăng $brand ($year): rầm rầm");
    }
  }
}
void main() {
  // TODO 5: Khởi tạo một xe Car bình thường và gọi startEngine()
  Car porsche = Car("Porsche", 2020, false);
  porsche.startEngine();
  // TODO 6: Khởi tạo một xe Car bằng Named Constructor (Car.tesla) và gọi startEngine()
  Car xeTesla = Car.tesla(2024);
  xeTesla.startEngine();
}