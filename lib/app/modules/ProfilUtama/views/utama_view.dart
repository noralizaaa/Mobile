import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/ProfilUtama/controllers/utama_controller.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

import '../widgets/utama_widget.dart';

class UtamaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UtamaController controller = Get.find<UtamaController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        title: const Text(
          'My profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Foto Profil
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150', // Ganti dengan URL gambar profil
                  ),
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.orange.shade700,
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 15),
                )
              ],
            ),
            const SizedBox(height: 20),
            // Full Name
            Obx(() => ProfileTextField(
              label: 'Full Name',
              value: controller.fullName.value,
            )),
            // Date of Birth
            Obx(() => ProfileTextField(
              label: 'Date of Birth',
              value: controller.dateOfBirth.value,
            )),
            // Email
            Obx(() => ProfileTextField(
              label: 'Email',
              value: controller.email.value,
            )),
            // Phone Number
            Obx(() => ProfileTextField(
              label: 'Phone Number',
              value: controller.phoneNumber.value,
            )),
            const SizedBox(height: 20),
            // Tombol Update Profile
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade700,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                controller.updateProfile();
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFE95322), // Background color
        selectedItemColor: Colors.amber[300], // Selected icon color
        unselectedItemColor: Colors.amber[100], // Unselected icon color
        showSelectedLabels: false, // Hide selected labels
        showUnselectedLabels: false, // Hide unselected labels
        iconSize: 30,
        currentIndex: 2, // Index for Cancelled
        onTap: (index) {
          if (index == 0) {
            Get.toNamed(Routes.HOMEPAGE);
          }
          if (index == 1){
            Get.toNamed(Routes.ORDERS);
          }
          if (index == 2){
            Get.toNamed(Routes.FAVORITE);
          }// Navigation logic can be implemented here if needed
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