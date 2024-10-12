import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile/app/modules/cart/controllers/cart_controller.dart';
import 'package:project_mobile/app/modules/cart/widgets/cart_item_widget.dart';
import 'package:project_mobile/app/routes/app_routes.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();

    // Fungsi untuk menambahkan pemisah ribuan
    String formatCurrency(int amount) {
      return amount.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart')),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Color(0xFFE95322), // Set background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You have ${controller.cartItems.length} items in the cart',
              style: TextStyle(fontSize: 16, color: Colors.white), // Set text color to white
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  final item = controller.cartItems[index];
                  return CartItemWidget(
                    image: item.image,  // Ubah menjadi item.image
                    name: item.name,      // Ubah menjadi item.name
                    price: item.price,    // Ubah menjadi item.price
                    date: item.date,      // Ubah menjadi item.date
                    quantity: item.quantity, // Ubah menjadi item.quantity
                  );
                },
              )),
            ),
            Divider(color: Colors.white), // Memberikan batasan yang lebih jelas
            // Tampilkan subtotal di tengah dan angka di kanan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Rp ${formatCurrency(controller.subtotal)}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax and Fees',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Rp ${formatCurrency(controller.taxAndFees.toInt())}', // Memformat harga
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Rp ${formatCurrency(controller.delivery)}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'Rp ${formatCurrency(controller.total)}',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.PESAN);
                },
                child: Text('Checkout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
