import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Ban sepeda kurang udara / bocor',
  'Rantai sepeda lepas / putus',
  'Rem blong / aus',
  'Lainnya'
];

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  String _question1Answer = '';
  String _question2Answer = '';
  String _question3Answer = '';
  String? _dropdownValue;
  TextEditingController _problemExplanationController = TextEditingController();
  TextEditingController _suggestionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback Form',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 163, 41, 41),
      ),
      body: Center(
        child: Container(
          width: 400, // Set your preferred width here
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.0),
              Container(
                width: double.infinity,
                color: Color.fromARGB(255, 163, 41, 41),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Apakah proses peyewaan kendaraan mudah?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: 'Ya',
                    groupValue: _question1Answer,
                    onChanged: (value) {
                      setState(() {
                        _question1Answer = value!;
                      });
                    },
                    activeColor: Color.fromARGB(255, 163, 41, 41),
                  ),
                  Text('Ya'),
                  Radio<String>(
                    value: 'Tidak',
                    groupValue: _question1Answer,
                    onChanged: (value) {
                      setState(() {
                        _question1Answer = value!;
                      });
                    },
                    activeColor: Color.fromARGB(255, 163, 41, 41),
                  ),
                  Text('Tidak'),
                ],
              ),
              Container(
                width: double.infinity,
                color: Color.fromARGB(255, 163, 41, 41),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Apakah lokasi pengambilan dan penyewaan kendaraan mudah diakses?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: 'Ya',
                    groupValue: _question2Answer,
                    onChanged: (value) {
                      setState(() {
                        _question2Answer = value!;
                      });
                    },
                    activeColor: Color.fromARGB(255, 163, 41, 41),
                  ),
                  Text('Ya'),
                  Radio<String>(
                    value: 'Tidak',
                    groupValue: _question2Answer,
                    onChanged: (value) {
                      setState(() {
                        _question2Answer = value!;
                      });
                    },
                    activeColor: Color.fromARGB(255, 163, 41, 41),
                  ),
                  Text('Tidak'),
                ],
              ),
              Container(
                width: double.infinity,
                color: Color.fromARGB(255, 163, 41, 41),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Apakah ada masalah dengan kendaraan yang disewa?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: 'Ya',
                    groupValue: _question3Answer,
                    onChanged: (value) {
                      setState(() {
                        _question3Answer = value!;
                      });
                    },
                    activeColor: Color.fromARGB(255, 163, 41, 41),
                  ),
                  Text('Ya'),
                  Radio<String>(
                    value: 'Tidak',
                    groupValue: _question3Answer,
                    onChanged: (value) {
                      setState(() {
                        _question3Answer = value!;
                      });
                    },
                    activeColor: Color.fromARGB(255, 224, 83, 73),
                  ),
                  Text('Tidak'),
                ],
              ),
              Container(
                width: double.infinity,
                color: Color.fromARGB(255, 163, 41, 41),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Jika ya, apa masalahnya?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              DropdownButton<String>(
                hint: Text('Select'),
                value: _dropdownValue,
                elevation: 10,
                style: const TextStyle(color: Color(0xFF1B1A1A)),
                onChanged: (String? value) {
                  setState(() {
                    _dropdownValue = value;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 5.0),
              Container(
                width: double.infinity,
                color: Color.fromARGB(255, 163, 41, 41),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Jelaskan Masalah Anda!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              TextField(
                controller: _problemExplanationController,
                decoration: InputDecoration(
                  hintText: 'Type Here...',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromARGB(255, 249, 211, 211),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                color: Color.fromARGB(255, 163, 41, 41),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Berikan saran atau kritik untuk meningkatkan kualitas layanan Setel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              TextField(
                controller: _suggestionController,
                decoration: InputDecoration(
                  hintText: 'Type Here...',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromARGB(255, 249, 211, 211),
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 163, 41, 41)),
                  ),
                  onPressed: () {
                    // Aksi yang dilakukan ketika tombol ditekan
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
