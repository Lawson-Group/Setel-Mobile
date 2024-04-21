import 'package:flutter/material.dart';
import 'package:setel_mobile/pages/confirmation_page.dart';

class InfoShelterPage extends StatelessWidget {
  const InfoShelterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'shelter': 'Telkom University Landmark Tower',
        'image': 'assets/tult.jpg',
        'bike': 'Tersedia 5 unit',
        'scooter': 'Tersedia 10 unit',
      },
      {
        'shelter': 'Gedung Tokong Nanas',
        'image': 'assets/gku.jpg',
        'bike': 'Tersedia 5 unit',
        'scooter': 'Tersedia 10 unit',
      },
      {
        'shelter': 'Open Library',
        'image': 'assets/oplib.jpg',
        'bike': 'Tersedia 5 unit',
        'scooter': 'Tersedia 10 unit',
      },
      {
        'shelter': 'Masjid Syamsul Ulum',
        'image': 'assets/msu.jpg',
        'bike': 'Tersedia 5 unit',
        'scooter': 'Tersedia 10 unit',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informasi Shelter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 163, 41, 41),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (final item in data)
                        ItemWidget(
                          shelter: item['shelter'],
                          image: item['image'],
                          bike: item['bike'],
                          scooter: item['scooter'],
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.shelter,
    required this.image,
    required this.bike,
    required this.scooter,
  }) : super(key: key);

  final String shelter;
  final String image;
  final String bike;
  final String scooter;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(255, 163, 41, 41)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                shelter,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 200,
                height: 200,
              ),
            ),
            Container(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(56, 163, 41, 41),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.electric_bike),
                          const SizedBox(width: 10),
                          Text(bike),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(56, 163, 41, 41),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.electric_scooter),
                          const SizedBox(width: 10),
                          Text(scooter),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _showDialog(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 163, 41, 41)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(10),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text('Pinjam',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Pilih Shelter',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  initialValue: shelter,
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'Shelter Awal'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                  value: null,
                  isExpanded: true,
                  isDense: true,
                  items: [
                    'Telkom University Landmark Tower',
                    'Gedung Tokong Nanas',
                    'Open Library',
                    'Masjid Syamsul Ulum',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {},
                  decoration: const InputDecoration(labelText: 'Shelter Akhir'),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfirmationPage()),
                );
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 163, 41, 41)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(10),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: const Text('Pilih'),
            ),
          ],
        );
      },
    );
  }
}
