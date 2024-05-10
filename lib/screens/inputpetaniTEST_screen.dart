// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/errMsg.dart';
// import 'package:flutter_application_1/models/kelompok.dart';
// import 'package:flutter_application_1/models/petani.dart';
// import 'package:flutter_application_1/screens/petani_screen.dart';
// import 'package:flutter_application_1/services/apistatic.dart';
// import 'package:image_picker/image_picker.dart';

// class InputPetaniScreen extends StatefulWidget {
//   const InputPetaniScreen({super.key});

//   @override
//   State<InputPetaniScreen> createState() => _InputPetaniScreenState();
// }

// class _InputPetaniScreenState extends State<InputPetaniScreen> {

//   late Future<List<Petani>> futurePetani;

//   final _formkey = GlobalKey<FormState>();
//   late TextEditingController nama, nik, alamat, telp;
//   late List<Kelompok> _kelompok = [];
//   late String idKelompok = "0";
//   late int idPenjual = 0;
//   bool _isupdate = false;
//   bool _validate = false;
//   bool _success = false;
//   late ErrorMSG response;
//   late String _status = "N";
//   late String _imagePath = "";
//   late String _imageURL = "";
//   final ImagePicker _picker = ImagePicker();
//   void getKelompok() async {
//     final response = await ApiStatic.getKelompokTani();
//     setState(() {
//       _kelompok = response.toList();
//     });
//   }

//   void submit() async {
//     if (_formkey.currentState!.validate()) {
//       _formkey.currentState!.save();
//       var params = {
//         'nama': nama.text.toString(),
//         'nik': nik.text.toString(),
//         'alamat': alamat.text.toString(),
//         'telp': telp.text.toString(),
//         'status': _status,
//         'id_kelompok_tani': idKelompok,
//       };
//       var response = await ApiStatic.savePetani(idPenjual, params, _imagePath);
//       _success = response.success;
//       final snackBar = SnackBar(
//         content: Text(response.message),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       if (_success) {
//         Navigator.of(context).pushReplacement(new MaterialPageRoute(
//             builder: (BuildContext context) => PetaniScreen(
//                   futurePetani: futurePetani,
//                 )));
//       }
//     } else {
//       _validate = true;
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     nama = TextEditingController();
//     nik = TextEditingController();
//     alamat = TextEditingController();
//     telp = TextEditingController();
//     getKelompok();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Data"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Form(
//               key: _formkey,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: TextFormField(
//                       controller: nama,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.perm_identity),
//                         hintText: 'Nama Petani',
//                         labelText: 'Nama Petani',
//                       ),
//                       validator: (u) => u == "" ? "Wajib Diisi " : null,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: TextFormField(
//                       controller: nik,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.perm_identity),
//                         hintText: 'NIK Petani',
//                         labelText: 'NIK Petani',
//                       ),
//                       validator: (u) => u == "" ? "Wajib Diisi " : null,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(5),
//                     child: TextFormField(
//                       controller: telp,
//                       keyboardType: TextInputType.phone,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.phone),
//                         hintText: 'Nomor HP Petani',
//                         labelText: 'Nomor HP Petani',
//                       ),
//                       validator: (u) => u == "" ? "Wajib Diisi " : null,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(5),
//                     child: TextFormField(
//                       controller: alamat,
//                       keyboardType: TextInputType.multiline,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.location_on),
//                         hintText: 'Alamat Petani',
//                         labelText: 'Alamat Petani',
//                       ),
//                       validator: (u) => u == "" ? "Wajib Diisi " : null,
//                     ),
//                   ),

//                   // Padding(
//                   //   padding: EdgeInsets.all(5),
//                   //   child: DropdownButtonFormField(
//                   //       hint: Text("Pilih"),
//                   //       items: _kelompok.map((item) {
//                   //         return DropdownMenuItem(
//                   //           child: Text(item.namaKelompok),
//                   //           value: item.idKelompokTani.toString(),
//                   //         );
//                   //       }).toList(),
//                   //       onChanged: (value) {
//                   //         setState(() {
//                   //           idKelompok = value as String;
//                   //         });
//                   //       }),
//                   // ),

//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: DropdownButtonFormField(
//                       value: idKelompok == '0' ? null : idKelompok,
//                       hint: Text("Pilih Kelompok"),
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.category_rounded),
//                       ),
//                       items: _kelompok.map((item) {
//                         return DropdownMenuItem(
//                           child: Text(item.namaKelompok),
//                           value: item.idKelompokTani.toString(),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           idKelompok = value as String;
//                         });
//                       },
//                       validator: (u) => u == null ? "Wajib Diisi " : null,
//                     ),
//                   ),
                  
//                   // Padding(
//                   //   padding: const EdgeInsets.all(5),
//                   //   child: TextFormField(
//                   //       controller:
//                   //           TextEditingController(text: idKelompok.toString()),
//                   //       keyboardType: TextInputType.number,
//                   //       decoration: const InputDecoration(
//                   //         icon: Icon(Icons.category_rounded),
//                   //         hintText: 'Masukkan ID Kelompok',
//                   //         labelText: 'ID Kelompok',
//                   //       ),
//                   //       onChanged: (value) {
//                   //         // Mengubah nilai idKelompok sesuai dengan input teks
//                   //         setState(() {
//                   //           idKelompok = int.parse(value) as String;
//                   //         });
//                   //       },
//                   //       validator: (value) {
//                   //         // Validasi input
//                   //         if (value == null || value.isEmpty) {
//                   //           return "ID Kelompok wajib diisi";
//                   //         } else if (!RegExp(r'^\d+$').hasMatch(value)) {
//                   //           return "ID Kelompok harus berupa angka";
//                   //         }
//                   //         return null;
//                   //       }),
//                   // ),

//                   Padding(
//                     padding: EdgeInsets.only(bottom: 10, left: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(Icons.image),
//                         Flexible(
//                             child: _imagePath != ''
//                                 ? GestureDetector(
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(8),
//                                       child: Image.file(
//                                         File(_imagePath),
//                                         fit: BoxFit.fitWidth,
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         height:
//                                             MediaQuery.of(context).size.height /
//                                                 5,
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       getImage(ImageSource.gallery);
//                                     })
//                                 : _imageURL != ''
//                                     ? GestureDetector(
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                           child: Image.network(
//                                             _imageURL,
//                                             fit: BoxFit.fitWidth,
//                                             width: MediaQuery.of(context)
//                                                 .size
//                                                 .width,
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height /
//                                                 5,
//                                           ),
//                                         ),
//                                         onTap: () {
//                                           getImage(ImageSource.camera);
//                                         })
//                                     : GestureDetector(
//                                         onTap: () {
//                                           getImage(ImageSource.camera);
//                                         },
//                                         child: Container(
//                                           height: 100,
//                                           child: Row(
//                                             children: <Widget>[
//                                               Padding(
//                                                 padding:
//                                                     EdgeInsets.only(left: 25),
//                                               ),
//                                               Text("Ambil Gambar")
//                                             ],
//                                           ),
//                                           decoration: BoxDecoration(
//                                               border: Border(
//                                                   bottom: BorderSide(
//                                                       color: Colors.greenAccent,
//                                                       width: 1))),
//                                         ),
//                                       ))
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 10, left: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Icon(Icons.visibility),
//                         Row(
//                           children: <Widget>[
//                             new Radio(
//                               value: "Y",
//                               groupValue: _status,
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   _status = newValue!.toString();
//                                 });
//                               },
//                             ),
//                             new Text('Aktif'),
//                             new Radio(
//                               value: "N",
//                               groupValue: _status,
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   _status = newValue!.toString();
//                                 });
//                               },
//                             ),
//                             new Text('Tidak'),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   Divider(),
//                   // Container(
//                   //   width: MediaQuery.of(context).size.width,
//                   //   height: 50.0,
//                   //   child: RaisedButton(
//                   //     color: Colors.green,
//                   //     child: Text(
//                   //       'SIMPAN',
//                   //       style: TextStyle(color: Colors.white),
//                   //     ),
//                   //     onPressed: () {
//                   //       submit();
//                   //     },
//                   //     shape: RoundedRectangleBorder(
//                   //         borderRadius: BorderRadius.circular(10.0)),
//                   //   ),
//                   // ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 50.0,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       child: Text(
//                         'SIMPAN',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       onPressed: () {
//                         submit();
//                       },
//                     ),
//                   )
//                 ],
//               )),
//         ),
//       ),
//     );
//   }

//   Future getImage(ImageSource media) async {
//     var img = await _picker.pickImage(source: media);
//     //final pickedImageFile = File(img!.path);
//     setState(() {
//       _imagePath = img!.path;
//       print(_imagePath);
//     });
//   }
// }
