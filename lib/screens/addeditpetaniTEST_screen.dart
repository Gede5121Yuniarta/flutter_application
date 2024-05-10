// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_application_1/main.dart';
// // import 'package:flutter_application_1/models/kelompok.dart';
// import 'package:flutter_application_1/models/petani.dart';
// import 'package:flutter_application_1/services/apistatic.dart';
// import 'package:image_picker/image_picker.dart';


// class AddEditPetaniScreen extends StatefulWidget {
//   final Petani? petani;

//   const AddEditPetaniScreen({super.key, this.petani});

//   @override
//   State<AddEditPetaniScreen> createState() => _AddEditPetaniScreenState();
// }

// class _AddEditPetaniScreenState extends State<AddEditPetaniScreen> {
//   late Future<List<Petani>> futurePetani;
//   final ApiStatic apistatic = ApiStatic();
  
//   // Controller untuk mengelola nilai input
//   final TextEditingController _idKelompokController = TextEditingController();
//   final TextEditingController _namaController = TextEditingController();
//   final TextEditingController _nikController = TextEditingController();
//   final TextEditingController _alamatController = TextEditingController();
//   final TextEditingController _teleponController = TextEditingController();
//   final TextEditingController _statusController = TextEditingController();
  
//   // Implementasi logika untuk menyimpan nilai foto
//   // Deklarasi variabel untuk menyimpan foto yang dipilih
//   XFile? _selectedImage;

//   // Membuat instance dari ImagePicker
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     futurePetani = apistatic.fetchPetani();

//     // Inisialisasi nilai input jika sedang dalam mode edit
//     if (widget.petani != null) {
//       _namaController.text = widget.petani!.nama ?? '';
//       _nikController.text = widget.petani!.nik ?? '';
//       _alamatController.text = widget.petani!.alamat ?? '';
//       _teleponController.text = widget.petani!.telp ?? '';
//       _statusController.text = widget.petani!.status ?? '';
//       _idKelompokController.text = widget.petani!.idKelompokTani ?? '';
//       // Inisialisasi foto jika sedang dalam mode edit
//       if (widget.petani!.foto != null) {
//         _selectedImage = XFile(widget.petani!.foto!);
//       }
//     }
//   }

//   // Fungsi untuk memilih foto dari galeri
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = pickedFile;
//       });
//     }
//   }

//   // Fungsi untuk mengambil foto dari kamera
//   Future<void> _takePhoto() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = pickedFile;
//       });
//     }
//   }

//   // Fungsi untuk menyimpan data
//   _saveData(Petani? petani, BuildContext context) async {
//     try {
//       if (petani == null) {
//         await ApiStatic().createPetani(Petani(
//           idKelompokTani: _idKelompokController.text,
//           nama: _namaController.text,
//           nik: _nikController.text,
//           alamat: _alamatController.text,
//           telp: _teleponController.text,
//           status: _statusController.text,
//           // Tambahkan nilai foto jika diperlukan
//           foto: _selectedImage?.path,  // Sertakan path foto yang dipilih
//         ));
//         // Implementasi jika penyimpanan berhasil
//         Fluttertoast.showToast(
//           msg: 'Data berhasil ditambahkan', // Pesan toast kesuksesan
//           toastLength: Toast.LENGTH_SHORT, // Durasi toast
//           gravity: ToastGravity.BOTTOM, // Posisi toast pada layar
//           backgroundColor: Colors.green, // Warna latar belakang toast
//           textColor: Colors.white, // Warna teks pada toast
//         );
//       } else {
//         await ApiStatic().updatePetani(Petani(
//           idPenjual: petani.idPenjual,
//           idKelompokTani: _idKelompokController.text,
//           nama: _namaController.text,
//           nik: _nikController.text,
//           alamat: _alamatController.text,
//           telp: _teleponController.text,
//           status: _statusController.text,
//           // Tambahkan nilai foto jika diperlukan
//           foto: _selectedImage?.path,  // Sertakan path foto yang dipilih
//         ));
//         // Implementasi jika penyimpanan berhasil
//         Fluttertoast.showToast(
//           msg: 'Data berhasil diperbarui', // Pesan toast kesuksesan
//           toastLength: Toast.LENGTH_SHORT, // Durasi toast
//           gravity: ToastGravity.BOTTOM, // Posisi toast pada layar
//           backgroundColor: Colors.green, // Warna latar belakang toast
//           textColor: Colors.white, // Warna teks pada toast
//         );
//       }

//       // Kembali ke halaman utama
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const MyApp(),
//           // builder: (context) => HomePage(futurePetani: futurePetani),
//         ),
//       );
//     } catch (e) {
//       // Implementasi jika terjadi kesalahan saat menyimpan data
//       Fluttertoast.showToast(
//         msg: 'Error: $e', // Pesan yang akan ditampilkan pada toast
//         toastLength: Toast.LENGTH_LONG, // Durasi toast
//         gravity: ToastGravity.BOTTOM, // Posisi toast pada layar
//         backgroundColor: Colors.red, // Warna latar belakang toast
//         textColor: Colors.white, // Warna teks pada toast
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     String pageTitle = widget.petani == null ? 'Tambah Petani' : 'Edit Petani';
//     // String buttonText = widget.petani == null ? 'Tambah' : 'Simpan';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(pageTitle),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _namaController,
//                 decoration: const InputDecoration(labelText: 'Nama'),
//               ),
//               TextFormField(
//                 controller: _nikController,
//                 decoration: const InputDecoration(labelText: 'NIK'),
//               ),
//               TextFormField(
//                 controller: _alamatController,
//                 decoration: const InputDecoration(labelText: 'Alamat'),
//               ),
//               TextFormField(
//                 controller: _teleponController,
//                 decoration: const InputDecoration(labelText: 'Telepon'),
//               ),
//               TextFormField(
//                 controller: _statusController,
//                 decoration: const InputDecoration(labelText: 'Status'),
//               ),
//               TextFormField(
//                 controller: _idKelompokController,
//                 decoration: const InputDecoration(labelText: 'ID Kelompok Tani'),
//                 keyboardType: TextInputType.number, // Tambahkan tipe input
//               ),
//               SizedBox(height: 16),
//               // Tambahkan dua tombol untuk memilih foto dari galeri dan mengambil foto dari kamera
//               ElevatedButton(
//                 onPressed: _pickImage,
//                 child: const Text('Pilih Foto dari Galeri'),
//               ),
//               const SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: _takePhoto,
//                 child: const Text('Ambil Foto dari Kamera'),
//               ),
              
//               // Tampilkan foto yang dipilih
//               const SizedBox(height: 16),
//               if (_selectedImage != null)
//                 Image.file(
//                   File(_selectedImage!.path),
//                   height: 200,
//                   width: 200,
//                 ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (widget.petani == null) {
//             _saveData(null, context);
//           } else {
//             _saveData(widget.petani, context);
//           }
//         },
//         child: const Icon(Icons.save),
//       ),
//     );
//   }
// }
