import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sealtech/client/chat.dart';
import 'package:sealtech/client/chemicals.dart';
import 'package:sealtech/client/services.dart';
import 'package:sealtech/client/tools.dart';
import 'package:sealtech/components/button.dart';
import 'package:sealtech/components/theme.dart';

class Category extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text('Category'),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('lib/images/logoIconBlack.png'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServicesList()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'lib/images/catServiceImage.png',
                                height: 287,
                                width: 180,
                              ),
                              Positioned(
                                bottom: 16,
                                left: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Services',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Contact SEALTECH\nfor unbeatable\nwaterproofing solutions',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Button(
                                      buttonText: 'Contact Us',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Chat()),
                                        );
                                      },
                                      width: 150,
                                      isStroked: true,
                                      color: 'white',
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Tool()),
                            );
                          },
                          child: Container(
                            height: 130,
                            width: 180,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'lib/images/catToolsImage.png',
                                  fit: BoxFit.cover,
                                ),
                                const Positioned(
                                  bottom: 16,
                                  left: 16,
                                  child: Text(
                                    'Tools',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chemical()),
                            );
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                'lib/images/catChemicalsImage.png',
                                height: 130,
                                width: 180,
                              ),
                              const Positioned(
                                bottom: 16,
                                left: 16,
                                child: Text(
                                  'Chemicals',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Service',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor)),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 6),
                  child: ServicesList(),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Tools',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor)),
                ),
                const SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 6),
                  child: ToolsList(),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Chemicals',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor)),
                ),
                const SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 6),
                  child: ChemicalsList(),
                ),
              ],
            ),
          ),
        ),
      );
}

class ServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample list of service data
    final List<Map<String, dynamic>> services = [
      {
        'title': 'Pool Waterproofing',
        'price': '30 000 000 LKR',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS28q0T6xKshE5H8WhPFWgQi5yZf4FEwqeQWv_eOpEZQg&s',
      },
      {
        'title': 'Roof Waterproofing',
        'price': '15 000 000',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9ccezG8SfThcKiirh5ygLpxiX0lt925kkoG5xs49ycbqrchqviGUQz3i-vDmgrVWJuCI&usqp=CAU',
      },
      {
        'title': 'Basement Sealing',
        'price': '20 000 000 LKR',
        'imageUrl':
            'https://i0.wp.com/movingtips.wpengine.com/wp-content/uploads/2020/08/finished-basement.jpg?fit=1025%2C684&ssl=1',
      },
      {
        'title': 'Concrete Sealing',
        'price': '25 000 000 LKR',
        'imageUrl':
            'https://concrete-live.storage.googleapis.com/upload/img_cache/file-1028-4d6515ab02edbfacbd9a5c2a1547be56.jpg',
      },
    ];

    return Row(
      children: services.map((service) {
        final title = service['title'] ?? '';
        final price = service['price'] ?? '';
        final imageUrl = service['imageUrl'] ?? '';

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 100,
                width: 100,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
              const SizedBox(height: 10), // Add vertical space
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Service',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class ToolsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample list of tool data
    final List<Map<String, dynamic>> tools = [
      {
        'title': 'Drill Machine',
        'price': '6 500 LKR',
        'imageUrl': 'https://m.media-amazon.com/images/I/51aUsNfO3-L.jpg',
      },
      {
        'title': 'Screwdriver Set',
        'price': '11 500 LKR',
        'imageUrl':
            'https://m.media-amazon.com/images/I/81+jq46RN9L._AC_UF894,1000_QL80_.jpg',
      },
      {
        'title': 'Circular Saw',
        'price': '9 000 LKR',
        'imageUrl':
            'https://elecshop.lk/wp-content/uploads/2022/10/TS11418526.jpg',
      },
      {
        'title': 'Adjustable Wrench',
        'price': '4 500 LKR',
        'imageUrl':
            'https://media.wickes.co.uk/image/upload/b_rgb:FFFFFF,c_pad,dpr_1.0,f_jpg,h_1500,q_auto:good,w_1500/c_pad,h_1500,w_1500/v1/products/wickes/T3274_149054_00?pgw=1&pgwact=1',
      },
    ];

    return Row(
      children: tools.map((tool) {
        final title = tool['title'] ?? '';
        final price = tool['price'] ?? '';
        final imageUrl = tool['imageUrl'] ?? '';

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 100,
                width: 100,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
              const SizedBox(height: 10), // Add vertical space
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Tool',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class ChemicalsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample list of chemical data
    final List<Map<String, dynamic>> chemicals = [
      {
        'title': 'Wood Protector',
        'price': '5 000 LKR',
        'imageUrl':
            'https://images.thdstatic.com/productImages/2e4f063f-139b-4d8f-b02e-b89968785bd8/svn/clear-olympic-exterior-wood-stains-55260xis-54-64_1000.jpg',
      },
      {
        'title': 'Waterproof Sealant',
        'price': '5 000 LKR',
        'imageUrl':
            'https://nippon.s3.ap-southeast-1.amazonaws.com/products/8329277c0df3acd0c16f2e9a7ddc0a7de409759e.jpg',
      },
      {
        'title': 'Surface Cleaner',
        'price': '5 000 LKR',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-7WM4rBEph2xKHO0gDqueOiJ7rkIL5YKBuaa511ga8g&s',
      },
      {
        'title': 'Mold Inhibitor Spray',
        'price': '5 000 LKR',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsRNGGO1WWH-cqPjiKshS1foCA8Pacrt5Ln6z7UGWoTg&s',
      },
    ];

    return Row(
      children: chemicals.map((chemical) {
        final title = chemical['title'] ?? '';
        final price = chemical['price'] ?? '';
        final imageUrl = chemical['imageUrl'] ?? '';

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 100,
                width: 100,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
              const SizedBox(height: 10), // Add vertical space
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Chemical',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class ProductPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;

  const ProductPage({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle onTap
      },
      child: Container(
        width: 180,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 130,
              width: 180,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(subtitle),
                  Text(price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
