import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/cancelOrder/controllers/canor_controller.dart';
import 'package:project_mobile/app/routes/app_routes.dart';


class CanorView extends StatelessWidget {
  final CanorController controller = Get.find<CanorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: const Text('Cancel Order', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(Routes.ORDERS); // Navigasi kembali ke halaman Orders
          },
        ),
      ),
      body: Container(
        color: const Color(0xFFF3E9B5),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mohon pilih alasan pembatalan. Pesananmu akan langsung dibatalkan setelah alasan pembatalan diajukan.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Obx(() => Column(
              children: controller.reasons.map((reason) {
                return RadioListTile<String>(
                  title: Text(reason),
                  value: reason,
                  groupValue: controller.selectedReason.value,
                  onChanged: (value) {
                    controller.selectReason(value!);
                  },
                );
              }).toList(),
            )),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Others reason...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                controller.selectReason(value);
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE95322),
                ),
                onPressed: () {
                  // Navigasi ke halaman CancelValid
                  Get.toNamed(Routes.CANCEL_VALIDATION);
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE95322), // Warna background sesuai gambar
        selectedItemColor: Colors.amber[300], // Warna saat ikon dipilih
        unselectedItemColor: Colors.amber[100], // Warna saat ikon tidak dipilih
        showSelectedLabels: false, // Tidak menampilkan label saat dipilih
        showUnselectedLabels: false, // Tidak menampilkan label saat tidak dipilih
        iconSize: 30,
        currentIndex: 0, // Indeks halaman saat ini (HomePage)
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.HOMEPAGE); // Navigasi ke halaman Orders
          }
          if (index == 1) {
            Get.toNamed(Routes.ORDERS); // Navigasi ke halaman Orders
          }
          if (index == 2){
            Get.toNamed(Routes.FAVORITE);
          }
          if (index == 3){
            Get.toNamed(Routes.UTAMA);
          }
          // Tambahkan logika untuk halaman lainnya jika diperlukan
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
              width: 30,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/orders.png',
              width: 30,
              height: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/favorite.png',
              width: 30,
              height: 30,

            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profile.png',
              width: 30,
              height: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
