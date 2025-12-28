import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Item> get items => const [
    Item(
      name: 'Sabun Mandi', 
      price: 5000, 
      image: 'assets/images/sabun.jpeg',
      stock: 15,
      rating: 4.5,
    ),
    Item(
      name: 'Shampoo', 
      price: 12000, 
      image: 'assets/images/shampoo.jpeg',
      stock: 8,
      rating: 4.2,
    ),
    Item(
      name: 'Pasta Gigi', 
      price: 8000, 
      image: 'assets/images/pasta_gigi.jpeg',
      stock: 20,
      rating: 4.7,
    ),
    Item(
      name: 'Minyak Goreng 1L', 
      price: 18000, 
      image: 'assets/images/minyak.jpeg',
      stock: 12,
      rating: 4.3,
    ),
    Item(
      name: 'Gula Pasir 1kg', 
      price: 15000, 
      image: 'assets/images/gula.jpeg',
      stock: 10,
      rating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Belanja'), 
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              padding: const EdgeInsets.all(16.0),
              children: items.map((item) {
                return Card(
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/item',
                        arguments: item,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar produk
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback jika gambar tidak ditemukan
                                return Container(
                                  color: Colors.grey[300],
                                  child: Icon(
                                    Icons.shopping_bag,
                                    color: Colors.grey[600],
                                    size: 30,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Rp ${item.price}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              Text(
                                ' ${item.rating}',
                                style: TextStyle(fontSize: 11),
                              ),
                              const Spacer(),
                              Text(
                                'Stok: ${item.stock}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Footer dengan Nama dan NIM
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue[50],
            child: const Column(
              children: [
                Text(
                  'Nama: [NAMA LENGKAP ANDA]',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('NIM: [NIM ANDA]'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}