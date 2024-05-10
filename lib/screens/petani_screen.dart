// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:flutter_application_1/models/petani.dart';
// import 'package:flutter_application_1/screens/detailpetani_screen.dart';
// // import 'package:flutter_application_1/screens/addeditpetani_screen.dart';
// // import 'package:flutter_application_1/screens/editpetani_screen.dart';
// import 'package:flutter_application_1/screens/tambaheditpetani_screen.dart';
// // import 'package:flutter_application_1/screens/tambahpetani_screen.dart';
// import 'package:flutter_application_1/services/apistatic.dart';
// // import 'package:flutter_application_1/screens/inputpetaniTEST_screen.dart';

// class PetaniScreen extends StatefulWidget {
//   const PetaniScreen({super.key, required this.futurePetani});

//   final Future<List<Petani>> futurePetani;

//   @override
//   State<PetaniScreen> createState() => _PetaniScreenState();
// }

// class _PetaniScreenState extends State<PetaniScreen> {
//   late final ApiStatic _apistatic;

//   @override
//   void initState() {
//     super.initState();
//     _apistatic = ApiStatic();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Petani'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder<List<Petani>>(
//                 future: widget.futurePetani,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   } else if (snapshot.hasData) {
//                     final List<Petani> petaniList = snapshot.data!;
//                     return ListView.builder(
//                       itemCount: petaniList.length,
//                       itemBuilder: (BuildContext context, int index) => Column(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       DetailPetaniScreen(
//                                     petani: petaniList[index],
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundImage: NetworkImage(
//                                           "${petaniList[index].foto}"),
//                                       radius: 20,
//                                     ),
//                                     const SizedBox(width: 16),
//                                     Text(
//                                       '${petaniList[index].nama}',
//                                       style: const TextStyle(
//                                         fontSize: 18,
//                                         // fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit),
//                                       onPressed: () {
//                                         // Add code for edit action here
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 TambahEditPetaniScreen(
//                                               petani: petaniList[index],
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                     // IconButton(
//                                     //   icon: const Icon(Icons.delete),
//                                     //   onPressed: () async {
//                                     //     final confirmed = await showDialog(
//                                     //       context: context,
//                                     //       builder: (context) {
//                                     //         return AlertDialog(
//                                     //           title:
//                                     //               const Text('Confirm Delete'),
//                                     //           content: const Text(
//                                     //               'Are you sure you want to delete this petani?'),
//                                     //           actions: [
//                                     //             TextButton(
//                                     //               child: const Text('Cancel'),
//                                     //               onPressed: () {
//                                     //                 Navigator.of(context)
//                                     //                     .pop(false);
//                                     //               },
//                                     //             ),
//                                     //             TextButton(
//                                     //               child: const Text('Delete'),
//                                     //               onPressed: () async {
//                                     //                 try {
//                                     //                   final idPenjual =
//                                     //                       petaniList[index]
//                                     //                           .idPenjual;
//                                     //                   if (idPenjual != null) {
//                                     //                     await _apistatic
//                                     //                         .deletePetani(
//                                     //                             idPenjual);
//                                     //                     setState(() {});
//                                     //                   }
//                                     //                 } catch (e) {
//                                     //                   ScaffoldMessenger.of(
//                                     //                           context)
//                                     //                       .showSnackBar(
//                                     //                     SnackBar(
//                                     //                       content: Text(
//                                     //                           'Failed to delete petani: $e'),
//                                     //                     ),
//                                     //                   );
//                                     //                 }
//                                     //                 Navigator.pushReplacement(
//                                     //                   context,
//                                     //                   MaterialPageRoute(
//                                     //                     builder: (context) =>
//                                     //                         const MyApp(),
//                                     //                     // builder: (context) => HomePage(futurePetani: futurePetani),
//                                     //                   ),
//                                     //                 );
//                                     //               },
//                                     //             ),
//                                     //           ],
//                                     //         );
//                                     //       },
//                                     //     );
//                                     //     if (confirmed) {
//                                     //       // Add code for delete action here
//                                     //     }
//                                     //   },
//                                     // ),
//                                     IconButton(
//                                   icon: const Icon(Icons.delete),
//                                   onPressed: () async {
//                                     final confirmed = await showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         return AlertDialog(
//                                           title: const Text('Confirm Delete'),
//                                           content: const Text(
//                                               'Are you sure you want to delete this petani?'),
//                                           actions: [
//                                             TextButton(
//                                               child: const Text('Cancel'),
//                                               onPressed: () {
//                                                 Navigator.of(context)
//                                                     .pop(false);
//                                               },
//                                             ),
//                                             TextButton(
//                                               child: const Text('Delete'),
//                                               onPressed: () async {
//                                                 try {
//                                                   final idPenjual =
//                                                       petaniList[index]
//                                                           .idPenjual;
//                                                   if (idPenjual != null) {
//                                                     await _apistatic
//                                                         .deletePetani(
//                                                             idPenjual);
//                                                     setState(() {});
//                                                   }
//                                                 } catch (e) {
//                                                   ScaffoldMessenger.of(context)
//                                                       .showSnackBar(
//                                                     SnackBar(
//                                                       content: Text(
//                                                           'Failed to delete petani: $e'),
//                                                     ),
//                                                   );
//                                                 }
//                                                 Navigator.pushReplacement(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         const MyApp(),
//                                                     // builder: (context) => HomePage(futurePetani: futurePetani),
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                     if (confirmed) {
//                                       // Add code for delete action here
//                                     }
//                                   },
//                                 ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   } else {
//                     return const Text('No data available');
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TambahEditPetaniScreen(),
//                 ),
//               );
//             },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

//----------ATAS PROGRAM LAMA----------

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';

// import 'package:flutter_application_1/models/petani.dart';

// import 'package:flutter_application_1/screens/detailpetani_screen.dart';
// // import 'package:flutter_application_1/screens/form_input_petani.dart';
// import 'package:flutter_application_1/screens/tambaheditpetani_screen.dart';

// import 'package:flutter_application_1/services/apistatic.dart';

// class PetaniScreen extends StatefulWidget {
//   const PetaniScreen({
//     super.key,
//   });

//   @override
//   State<PetaniScreen> createState() => _PetaniScreenState();
// }

// class _PetaniScreenState extends State<PetaniScreen> {
//   late final ApiStatic _apistatic;

//   late Future<List<Petani>> futurePetani;

//   @override
//   void initState() {
//     super.initState();

//     _apistatic = ApiStatic();
//     futurePetani = _apistatic.fetchPetani();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Petani List'),
//       // ),
//       appBar: AppBar(
//         title: const Text('Petani'),
//         // Tambahkan ikon kembali di AppBar
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             // Tutup layar PetaniScreen dan kembali ke layar sebelumnya
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MyApp(),
//               ),
//             );
//           },
//         ),
//       ),
//       body: Center(
//         child: FutureBuilder<List<Petani>>(
//           future: futurePetani,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               // Display a loading indicator while waiting for the future
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               // Display an error message if there's an error
//               return Text('Error: ${snapshot.error}');
//             } else if (snapshot.hasData) {
//               // Display the list of Petani if data is available
//               final List<Petani> petaniList = snapshot.data!;
//               return RefreshIndicator(
//                 onRefresh: () async {
//                   setState(() {});
//                 },
//                 child: ListView.builder(
//                   itemCount: petaniList.length,
//                   itemBuilder: (BuildContext context, int index) => Column(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   DetailPetaniScreen(
//                                 petani: petaniList[index],
//                               ),
//                             ),
//                           );
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 CircleAvatar(
//                                   backgroundImage:
//                                       NetworkImage("${petaniList[index].foto}"),
//                                   radius: 20,
//                                 ),
//                                 const SizedBox(width: 16),
//                                 Text(
//                                   '${petaniList[index].nama}',
//                                   style: const TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.edit),
//                                   onPressed: () {
//                                     // Add code for edit action here
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             TambahEditPetaniScreen(
//                                           petani: petaniList[index],
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.delete),
//                                   onPressed: () async {
//                                     final confirmed = await showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         return AlertDialog(
//                                           title: const Text('Confirm Delete'),
//                                           content: const Text(
//                                               'Are you sure you want to delete this petani?'),
//                                           actions: [
//                                             TextButton(
//                                               child: const Text('Cancel'),
//                                               onPressed: () {
//                                                 Navigator.of(context)
//                                                     .pop(false);
//                                               },
//                                             ),
//                                             TextButton(
//                                               child: const Text('Delete'),
//                                               onPressed: () async {
//                                                 try {
//                                                   final idPenjual =
//                                                       petaniList[index]
//                                                           .idPenjual;
//                                                   if (idPenjual != null) {
//                                                     await _apistatic
//                                                         .deletePetani(
//                                                             idPenjual);
//                                                     setState(() {});
//                                                   }
//                                                 } catch (e) {
//                                                   ScaffoldMessenger.of(context)
//                                                       .showSnackBar(
//                                                     SnackBar(
//                                                       content: Text(
//                                                           'Failed to delete petani: $e'),
//                                                     ),
//                                                   );
//                                                 }
//                                                 Navigator.pushReplacement(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         const PetaniScreen(),
//                                                     // builder: (context) => HomePage(futurePetani: futurePetani),
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                     if (confirmed) {
//                                       // Add code for delete action here
//                                     }
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               // Default case: Display a message when there's no data
//               return const Text('No data available');
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               // builder: (context) => const TambahEditPetaniPage(),
//               builder: (context) => const TambahEditPetaniScreen(
//                   // petani: Petani(),
//                   ),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


//HASIL EDIT UI NYA
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/petani.dart';
import 'package:flutter_application_1/screens/detailpetani_screen.dart';
import 'package:flutter_application_1/screens/tambaheditpetani_screen.dart';
import 'package:flutter_application_1/services/apistatic.dart';

class PetaniScreen extends StatefulWidget {
  const PetaniScreen({
    super.key,
  });

  @override
  State<PetaniScreen> createState() => _PetaniScreenState();
}

class _PetaniScreenState extends State<PetaniScreen> {
  late final ApiStatic _apistatic;
  late Future<List<Petani>> futurePetani;

  @override
  void initState() {
    super.initState();
    _apistatic = ApiStatic();
    futurePetani = _apistatic.fetchPetani();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petani'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Petani>>(
          future: futurePetani,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final List<Petani> petaniList = snapshot.data!;
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    futurePetani = _apistatic.fetchPetani();
                  });
                },
                child: ListView.builder(
                  itemCount: petaniList.length,
                  itemBuilder: (context, index) {
                    final petani = petaniList[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPetaniScreen(
                                  petani: petani,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(petani.foto ?? ''),
                              radius: 20,
                            ),
                            title: Text(
                              petani.nama ?? 'Tidak tersedia',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'NIK: ${petani.nik ?? 'Tidak tersedia'}',
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TambahEditPetaniScreen(
                                          petani: petani,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    final confirmed = await showDialog<bool>(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Konfirmasi Hapus'),
                                          content: const Text('Apakah Anda yakin ingin menghapus petani ini?'),
                                          actions: [
                                            TextButton(
                                              child: const Text('Batal'),
                                              onPressed: () {
                                                Navigator.of(context).pop(false);
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Hapus'),
                                              onPressed: () async {
                                                try {
                                                  final idPenjual = petani.idPenjual;
                                                  if (idPenjual != null) {
                                                    await _apistatic.deletePetani(idPenjual);
                                                    setState(() {
                                                      futurePetani = _apistatic.fetchPetani();
                                                    });
                                                  }
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Gagal menghapus petani: $e'),
                                                    ),
                                                  );
                                                }
                                                Navigator.of(context).pop(true);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (confirmed == true) {
                                      // Lakukan tindakan penghapusan
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return const Text('Data tidak tersedia');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TambahEditPetaniScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
