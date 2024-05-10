// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/petani.dart';

// class DetailPetaniScreen extends StatefulWidget {
//   const DetailPetaniScreen({super.key, required this.petani});
//   final Petani petani;

//   @override
//   State<DetailPetaniScreen> createState() => _DetailPetaniScreenState();
// }

// class _DetailPetaniScreenState extends State<DetailPetaniScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.petani.nama}"),
//       ),
//       body: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ignore: sized_box_for_whitespace
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 child: Image.network(
//                   "${widget.petani.foto}",
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.error, color: Colors.red),
//                         Text('Gambar tidak dapat diakses'),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Text('ID Penjual: ${widget.petani.idPenjual}'),
//               const SizedBox(height: 8),
//               Text('ID Kelompok Tani: ${widget.petani.idKelompokTani}'),
//               const SizedBox(height: 16),
//               Text('Nama: ${widget.petani.nama}',),
//               const SizedBox(height: 8),
//               Text('NIK: ${widget.petani.nik}'),
//               const SizedBox(height: 8),
//               Text('Alamat: ${widget.petani.alamat}'),
//               const SizedBox(height: 8),
//               Text('Telepon: ${widget.petani.telp}'),
//               const SizedBox(height: 8),
//               Text('Foto: ${widget.petani.foto}'),
//               const SizedBox(height: 8),
//               Text('Status: ${widget.petani.status}'),
//               const SizedBox(height: 8),
//               Text('Nama Kelompok: ${widget.petani.namaKelompok}'),
//               const SizedBox(height: 8),
//               // Text(
//               //   'Nama Kelompok: ${widget.petani.namaKelompok}',
//               //   style:
//               //       const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               // ),
//             ],
//           )),
//     );
//   }
// }


//HASIL EDIT UI NYA
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/petani.dart';

class DetailPetaniScreen extends StatefulWidget {
  const DetailPetaniScreen({super.key, required this.petani});
  final Petani petani;

  @override
  State<DetailPetaniScreen> createState() => _DetailPetaniScreenState();
}

class _DetailPetaniScreenState extends State<DetailPetaniScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.petani.nama ?? 'Detail Petani'), // Perhatikan penggunaan `??` untuk menangani `null`
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar dengan Card dan penanganan null
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.petani.foto ?? '', // Pastikan string tidak null
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: Center(
                      child: Icon(Icons.error, color: Colors.red, size: 40),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            
            // Informasi dalam Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(
                      icon: Icons.account_circle,
                      title: 'Nama',
                      value: widget.petani.nama ?? 'Tidak tersedia', // Pastikan string tidak null
                    ),
                    _buildInfoRow(
                      icon: Icons.credit_card,
                      title: 'NIK',
                      value: widget.petani.nik ?? 'Tidak tersedia',
                    ),
                    _buildInfoRow(
                      icon: Icons.home,
                      title: 'Alamat',
                      value: widget.petani.alamat ?? 'Tidak tersedia',
                    ),
                    _buildInfoRow(
                      icon: Icons.phone,
                      title: 'Telepon',
                      value: widget.petani.telp ?? 'Tidak tersedia',
                    ),
                    _buildInfoRow(
                      icon: Icons.photo,
                      title: 'Foto',
                      value: widget.petani.foto ?? 'Tidak tersedia',
                    ),
                    _buildInfoRow(
                      icon: Icons.info,
                      title: 'Status',
                      value: widget.petani.status ?? 'Tidak tersedia',
                    ),
                    _buildInfoRow(
                      icon: Icons.group,
                      title: 'Nama Kelompok',
                      value: widget.petani.namaKelompok ?? 'Tidak tersedia',
                    ),
                    _buildInfoRow(
                      icon: Icons.numbers,
                      title: 'ID Penjual',
                      value: widget.petani.idPenjual.toString(),
                    ),
                    _buildInfoRow(
                      icon: Icons.group_add,
                      title: 'ID Kelompok Tani',
                      value: widget.petani.idKelompokTani.toString(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat baris informasi dengan ikon dan teks
  Widget _buildInfoRow({required IconData icon, required String title, required String? value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Colors.green), // Ikon
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: '$title: ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: value ?? 'Tidak tersedia', // Pastikan nilai tidak null
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
