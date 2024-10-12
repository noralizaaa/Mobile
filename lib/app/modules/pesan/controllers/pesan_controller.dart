import 'package:get/get.dart';

class PesanController extends GetxController {
  var items = <Map<String, dynamic>>[].obs;

  PesanController() {
    items.addAll([
      {
        "name": "Ayam Bakar",
        "time": "29 Nov, 16:30 pm",
        "price": 20000,
        "quantity": 2,
        "image": "assets/images/bakar.png", // Menambahkan jalur gambar
      },
      {
        "name": "Onion Ring",
        "time": "29 Nov, 12:00 pm",
        "price": 15000,
        "quantity": 1,
        "image": "assets/images/onion.png", // Menambahkan jalur gambar
      },
    ]);
  }

  // Mengambil gambar dari assets secara langsung (tidak ada fungsi untuk memilih gambar lagi)
  String getImagePath(int index) {
    if (index >= 0 && index < items.length) {
      return items[index]['image'] ?? '';
    } else {
      return '';
    }
  }

  double get subtotal => items.fold(0.0, (sum, item) {
    final price = (item['price'] as int?) ?? 0;
    final quantity = (item['quantity'] as int?) ?? 0;
    return sum + (price * quantity);
  });

  double get taxAndFees => 5500.0;
  double get delivery => 15000.0;
  double get total => subtotal + taxAndFees + delivery;

  void removeItem(int index) {
    if (items.isNotEmpty && index >= 0 && index < items.length) {
      items.removeAt(index);
      update();
    } else {
      print("Indeks tidak valid atau list kosong");
    }
  }
}
