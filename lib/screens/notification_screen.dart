import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Contoh data notifikasi
  List<Map<String, dynamic>> notifications = [
    {"title": "Diskon Spesial", "message": "Diskon 50% untuk produk tertentu", "icon": Icons.local_offer},
    {"title": "Pemberitahuan Pengiriman", "message": "Pesanan Anda sudah dikirim", "icon": Icons.local_shipping},
    {"title": "Promosi Baru", "message": "Produk baru telah ditambahkan", "icon": Icons.new_releases},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              notifications[index]['icon'],
              color: Colors.blue, // Ubah warna ikon sesuai kebutuhan
            ),
            title: Text(notifications[index]['title']),
            subtitle: Text(notifications[index]['message']),
            onTap: () {
              // Tindakan ketika notifikasi diklik
            },
          );
        },
      ),
    );
  }
}
