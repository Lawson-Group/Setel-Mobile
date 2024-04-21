import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:setel_mobile/pages/history_page.dart';
import 'package:setel_mobile/pages/info_shelter_page.dart';
import 'package:setel_mobile/pages/scan_qr_page.dart';
import 'package:setel_mobile/pages/user_profile_page.dart';
import 'package:setel_mobile/pages/feedback_page.dart';

class HomePage extends StatefulWidget {
  final String? name;

  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to Setel, ',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: widget.name != null ? widget.name! : '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 163, 41, 41),
                          fontSize: 25),
                    ),
                    const TextSpan(
                      text: '!',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            HomePageContent(),
            InfoShelterPage(),
            ScanPage(),
            TripHistoryPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color.fromARGB(255, 163, 41, 41),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Shelter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlideshow(
            indicatorColor: Colors.blue,
            onPageChanged: (value) {
              debugPrint('Page changed: $value');
            },
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              Image.asset(
                'assets/crsel-1.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/crsel-2.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/crsel-3.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1))
                  ]),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Mau ke mana kamu hari ini?',
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              'Our Shelters',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/info');
                  },
                  child: SegmentContainer(
                    title: 'TULT',
                    content: 'tult.jpg',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/info');
                  },
                  child: SegmentContainer(
                    title: 'GKU',
                    content: 'gku.jpg',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/info');
                  },
                  child: SegmentContainer(
                    title: 'MSU',
                    content: 'msu.jpg',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/info');
                  },
                  child: SegmentContainer(
                    title: 'Open Library',
                    content: 'oplib.jpg',
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              'About Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              'Sepeda Tel-U (Setel) adalah sebuah platform peminjaman sepeda yang dapat digunakan di lingkungan Telkom University. Civitas kampus dapat melakukan peminjaman kendaraan berupa sepeda atau skuter dengan melakukan login menggunakan akun Single Sign-On (SSO) Telkom University.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              'Setel berupaya untuk menyediakan sebuah fasilitas peminjaman kendaraan alternatif ramah lingkungan yang dapat digunakan oleh civitas Telkom University untuk kebutuhan mobilitas di lingkungan kampus. Melalui Setel, civitas kampus dapat memilih jenis kendaraan yang ingin digunakan, lokasi-lokasi shelter, dan jumlah unit yang tersedia di setiap shelternya. Selain itu, civitas kampus juga dapat mengakses informasi terkait tata cara dan kebijakan peminjaman yang berlaku',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  'Share Your Feedback',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.orange),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1))
                  ]),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackForm()),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Berikan feedback kalian di sini!',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Icon(LineAwesomeIcons.arrow_right),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SegmentContainer extends StatelessWidget {
  final String title;
  final String content;

  const SegmentContainer({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              InfoShelterPage(),
        ));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Image.asset('assets/$content', fit: BoxFit.cover, width: 200.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    child: Text(
                      'Shelter $title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

Future<List<String>> _fetchSuggestions(String searchValue) async {
  await Future.delayed(const Duration(milliseconds: 750));

  final List<String> _suggestions = [
    'Pinjam kendaraan',
    'Lokasi shelter',
    'Pengaturan profil',
    'Scan QR',
    'Riwayat',
  ];

  return _suggestions.where((element) {
    return element.toLowerCase().contains(searchValue.toLowerCase());
  }).toList();
}
