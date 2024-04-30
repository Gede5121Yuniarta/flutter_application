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
        title: Text("${widget.petani.nama}"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  "${widget.petani.foto}",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red),
                        Text('Gambar tidak dapat diakses'),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text('ID Penjual: ${widget.petani.idPenjual}'),
              const SizedBox(height: 8),
              Text('ID Kelompok Tani: ${widget.petani.idKelompokTani}'),
              const SizedBox(height: 16),
              Text('Nama: ${widget.petani.nama}',),
              const SizedBox(height: 8),
              Text('NIK: ${widget.petani.nik}'),
              const SizedBox(height: 8),
              Text('Alamat: ${widget.petani.alamat}'),
              const SizedBox(height: 8),
              Text('Telepon: ${widget.petani.telp}'),
              const SizedBox(height: 8),
              Text('Foto: ${widget.petani.foto}'),
              const SizedBox(height: 8),
              Text('Status: ${widget.petani.status}'),
              const SizedBox(height: 8),
              Text('Nama Kelompok: ${widget.petani.namaKelompok}'),
              const SizedBox(height: 8),
              // Text(
              //   'Nama Kelompok: ${widget.petani.namaKelompok}',
              //   style:
              //       const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
            ],
          )),
    );
  }
}
