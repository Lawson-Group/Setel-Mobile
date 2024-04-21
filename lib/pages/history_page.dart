import 'package:flutter/material.dart';

class Trip {
  final String title;
  final String date;
  final String description;

  Trip({
    required this.title,
    required this.date,
    required this.description,
  });
}

class Receipt {
  final String shelterAwal;
  final String shelterAkhir;
  final double duration;

  Receipt({
    required this.shelterAwal,
    required this.shelterAkhir,
    required this.duration,
  });
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip History',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TripHistoryPage(),
    );
  }
}

class TripHistoryPage extends StatefulWidget {
  const TripHistoryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TripHistoryPageState createState() => _TripHistoryPageState();
}

class _TripHistoryPageState extends State<TripHistoryPage> {
  late ScrollController _scrollController;
  final List<Trip> _trips = [];
  bool _isLoading = false;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _fetchTrips();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchTrips();
    }
  }

  Future<void> _fetchTrips() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));
      final List<Trip> newTrips = [
        Trip(
            title: 'Perjalanan ${_page * 1}',
            date: '2022-03-01',
            description: 'Deskripsi perjalanan ${_page * 1}'),
        Trip(
            title: 'Perjalanan ${_page * 2}',
            date: '2022-03-02',
            description: 'Deskripsi perjalanan ${_page * 2}'),
        Trip(
            title: 'Perjalanan ${_page * 3}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 3}'),
        Trip(
            title: 'Perjalanan ${_page * 4}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 4}'),
        Trip(
            title: 'Perjalanan ${_page * 5}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 5}'),
        Trip(
            title: 'Perjalanan ${_page * 6}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 6}'),
        Trip(
            title: 'Perjalanan ${_page * 7}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 7}'),
        Trip(
            title: 'Perjalanan ${_page * 8}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 8}'),
        Trip(
            title: 'Perjalanan ${_page * 9}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 9}'),
        Trip(
            title: 'Perjalanan ${_page * 10}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 10}'),
        Trip(
            title: 'Perjalanan ${_page * 11}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 11}'),
        Trip(
            title: 'Perjalanan ${_page * 12}',
            date: '2022-03-03',
            description: 'Deskripsi perjalanan ${_page * 12}'),
      ];

      setState(() {
        _trips.addAll(newTrips);
        _page++;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trip History',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 163, 41, 41),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _trips.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < _trips.length) {
            return ListTile(
              leading: const Icon(Icons.directions_bike),
              title: Text(_trips[index].title),
              subtitle: Text(_trips[index].date),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TripDetailPage(trip: _trips[index]),
                  ),
                );
              },
            );
          } else {
            return _isLoading
                ? Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  )
                : Container();
          }
        },
      ),
    );
  }
}

class TripDetailPage extends StatelessWidget {
  final Trip trip;

  const TripDetailPage({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final List<Receipt> receipts = [
      Receipt(
          shelterAwal: 'Shelter GKU',
          shelterAkhir: 'Shelter TULT',
          duration: 5),
      Receipt(
          shelterAwal: 'Shelter MSU',
          shelterAkhir: 'Shelter TULT',
          duration: 10),
      // Receipt(shelterAwal: 'shelterAwal 3', duration: 3000),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(trip.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(trip.description),
          ),
          const SizedBox(height: 20),
          Text('Receipt', style: Theme.of(context).textTheme.titleLarge),
          Expanded(
            child: ListView.builder(
              itemCount: receipts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(receipts[index].shelterAwal),
                  subtitle: Text('To ${receipts[index].shelterAkhir}'),
                  trailing: Text('${receipts[index].duration} menit'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
