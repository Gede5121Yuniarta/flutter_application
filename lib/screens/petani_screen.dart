import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/petani.dart';
import 'package:flutter_application_1/screens/detailpetani_screen.dart';
import 'package:flutter_application_1/screens/addeditpetani_screen.dart';
import 'package:flutter_application_1/services/apiStatic.dart';

class PetaniScreen extends StatefulWidget {
  const PetaniScreen({super.key, required this.futurePetani});

  final Future<List<Petani>> futurePetani;

  @override
  State<PetaniScreen> createState() => _PetaniScreenState();
}

class _PetaniScreenState extends State<PetaniScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petani'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditPetaniScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Petani>>(
                future: widget.futurePetani,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final List<Petani> petaniList = snapshot.data!;
                    return ListView.builder(
                      itemCount: petaniList.length,
                      itemBuilder: (BuildContext context, int index) => Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailPetaniScreen(
                                    petani: petaniList[index],
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage("${petaniList[index].foto}"),
                                      radius: 20,
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      '${petaniList[index].nama}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        // Add code for edit action here
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddEditPetaniScreen(
                                              petani: petaniList[index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () async {
                                        final confirmed = await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Confirm Delete'),
                                              content: Text(
                                                  'Are you sure you want to delete this petani?'),
                                              actions: [
                                                TextButton(
                                                  child: Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(false);
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text('Delete'),
                                                  onPressed: () {
                                                    // Add code for delete action here
                                                    Navigator.of(context)
                                                        .pop(true);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (confirmed) {
                                          // Add code for delete action here
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
