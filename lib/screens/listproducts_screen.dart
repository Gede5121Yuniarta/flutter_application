import 'package:flutter/material.dart';
import 'detailproducts_screen.dart'; // Import file detail produk

class ListProductsScreen extends StatefulWidget {
  const ListProductsScreen({Key? key}) : super(key: key);

  @override
  State<ListProductsScreen> createState() => _ListProductsScreenState();
}

class _ListProductsScreenState extends State<ListProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildProductItem(
            image: 'images/vape.jpg',
            title: 'Vape 1',
            description: 'Rokok elektrik yang keren dan mudah di bawa kemana saja',
            price: 'RP. 30.000',
            rating: 5,
          ),
          _buildProductItem(
            image: 'images/vape.jpg',
            title: 'Vape 2',
            description: 'Rokok elektrik yang keren dan mudah di bawa kemana saja',
            price: 'RP. 20.000',
            rating: 5,
          ),
          _buildProductItem(
            image: 'images/vape.jpg',
            title: 'Vape 3',
            description: 'Rokok elektrik yang keren dan mudah di bawa kemana saja',
            price: 'RP. 15.000',
            rating: 4,
          ),
          _buildProductItem(
            image: 'images/vape.jpg',
            title: 'Vape 4',
            description: 'Rokok elektrik yang keren dan mudah di bawa kemana saja',
            price: 'RP. 10.000',
            rating: 3,
          ),
          // Add more product items here as needed
        ],
      ),
    );
  }

  Widget _buildProductItem({
    required String image,
    required String title,
    required String description,
    required String price,
    required int rating,
  }) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailProductsScreen()), // Mengarahkan ke detail produk saat item diklik
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: index < rating ? Colors.yellow : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
