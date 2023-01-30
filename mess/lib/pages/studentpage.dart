import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class studenthomepage extends StatefulWidget {
  const studenthomepage({Key? key}) : super(key: key);

  @override
  State<studenthomepage> createState() => _studenthomepageState();
}

class _studenthomepageState extends State<studenthomepage> {
  static const Map<String, String> hostels = {
    "Hostel": "Hostel",
    "Aryabatta": "o8Eg7efhobanbAo5vWGOi8KqFgI2",
    "BH1": "YZb8XV7c9CZmTHlZtnVZqq8DKKv2",
    "BH2": "zkVVSwFTa5d0eAmO2KEUe1eTt3O2",
    "BH3": "FZ6gtO7DgrSeEUSrHlYDIfykUaC2",
    "BH4": "VarbD5IvAdXTx2vzUR6wKX881nk2",
    "BH5": "KIml2Ynu8Hcz4t1K3iYuiUOiEWb2",
    "BH6": "rwzbUVIeQGdzMnEpf5kl7R7Uwkh2",
    "BH7": "LJHuLucXoNfBmt264z3IGhBI9zd2",
    "BH8": "bvmaQOec15S2Fz3dHxcHG0WmeTt1",
    "BH9": "SKbp07K3z7O0IbosqOWrDSXJVfk2",
    "Girls Hostel": "mJp2Esd1WaaGS9QdMA6c48IDv6W2"
  };
  String? _uid;

  DateTime date = DateTime.now();
  var nameController = new TextEditingController();
  var scholaridController = new TextEditingController();
  var remarksController = new TextEditingController();
  var hostelController = new TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                      "Successfully Signed Out.",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(Icons.logout_rounded),
              iconSize: 30,
              tooltip: 'Log Out',
            )
          ],
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Student's Page",
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          backgroundColor: Colors.black.withOpacity(0.85),
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    child: Text(
                  'Enter the Data to Record your Attendance.',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                )),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: nameController,
                  style: GoogleFonts.openSans(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    letterSpacing: .3,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: "Name",
                    hintStyle: GoogleFonts.openSans(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: scholaridController,
                  style: GoogleFonts.openSans(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    letterSpacing: .3,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: "Scholar ID",
                    hintStyle: GoogleFonts.openSans(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  readOnly: true,
                  style: GoogleFonts.openSans(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    letterSpacing: .3,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: 'Date: ${date.year}/${date.month}/${date.day}',
                    hintStyle: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: DropdownButtonHideUnderline(
                      child: SingleChildScrollView(
                        child: DropdownButton<String?>(
                          iconEnabledColor: Colors.black,
                          items: hostels
                              .map((hostel, value) {
                                return MapEntry(
                                    hostel,
                                    DropdownMenuItem<String?>(
                                        value: value,
                                        child: Text(
                                          '$hostel',
                                          style: GoogleFonts.openSans(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            letterSpacing: .3,
                                          ),
                                        )));
                              })
                              .values
                              .toList(),
                          value: _uid ?? "Hostel",
                          onChanged: (newValue) {
                            if (newValue != null) {
                              setState(() {
                                _uid = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: remarksController,
                  style: GoogleFonts.openSans(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    letterSpacing: .3,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: "Remarks",
                    hintStyle: GoogleFonts.openSans(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 0.7 * MediaQuery.of(context).size.width,
                height: 60,
                child: OutlinedButton(
                  child: Text(
                    'Submit',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        scholaridController.text.isNotEmpty &&
                        remarksController.text.isNotEmpty) {
                      insertData(nameController.text, scholaridController.text,
                          remarksController.text);
                    }
                  },
                ),
              ),
              SizedBox(height: 300),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                    child: Text(
                  "Signed In as:",
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                    child: Text(
                  user.email.toString(),
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                )),
              ),
            ]),
          ),
        ));
  }

  void insertData(String name, String scholarid, String remarks) {
    final onlyDate = DateFormat('yyyy-MM-dd').format(date);

    databaseRef
        .child(_uid.toString())
        .child("logs")
        .child(onlyDate)
        .child(scholarid)
        .set({
      'name': name,
      'remarks': remarks,
      'scholarid': scholarid,
      'email': user.email,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Attendance Registered.",
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
        ),
      ),
    );

    nameController.clear();
    scholaridController.clear();
    remarksController.clear();
  }
}
