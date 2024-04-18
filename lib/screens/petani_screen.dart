import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/petani.dart';
import 'package:flutter_application_1/services/apiStatic.dart';

void main() {
  runApp(const PetaniScreen());
}

class PetaniScreen extends StatefulWidget {
  const PetaniScreen({super.key});

  @override
  State<PetaniScreen> createState() => _PetaniScreenState();
}

class _PetaniScreenState extends State<PetaniScreen> {
  late Future<Petani> futurePetani;

  @override
  void initState() {
    super.initState();
    futurePetani = fetchPetani();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Petani'),
        ),
        body: Center(
          child: FutureBuilder<Petani>(
            future: futurePetani,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final petani = snapshot.data!;

                return Text("${petani.nama}");
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
