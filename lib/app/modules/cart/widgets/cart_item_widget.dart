import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String date;
  final int quantity;

  CartItemWidget({
    required this.image,
    required this.name,
    required this.price,
    required this.date,
    required this.quantity,
  });

  // Fungsi untuk memformat angka dengan menambahkan pemisah ribuan
  String formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');
  }

  @override
  Widget build(BuildContext context) {
    print('Image path: $image'); // Menampilkan path gambar di konsol

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.white,
        elevation: 2, // Menambahkan bayangan untuk kartu
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                image,
                width: 50,
                height: 50,
                fit: BoxFit.cover, // Agar gambar tidak terdistorsi
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis, // Menghindari overflow teks
                    ),
                    Text(
                      'Rp ${formatCurrency(price)}', // Memformat harga dengan fungsi manual
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
