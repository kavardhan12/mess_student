import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess/pages/studentpage.dart';

class studentSignupPage extends StatefulWidget {
  const studentSignupPage({Key? key}) : super(key: key);

  @override
  State<studentSignupPage> createState() => _studentSignupPageState();
}

class _studentSignupPageState extends State<studentSignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confpasswordController = TextEditingController();
  bool _obscuretext1 = true;
  bool _obscuretext2 = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confpasswordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Student's Sign Up",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: emailController,
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
                    hintText: "Institute Email",
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
                  obscureText: _obscuretext1,
                  controller: passwordController,
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
                    hintText: "Create Password",
                    suffixIcon: IconTheme(
                      data: IconThemeData(color: Colors.black),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscuretext1 = !_obscuretext1;
                            });
                          },
                          child: Icon(_obscuretext1
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
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
                  obscureText: _obscuretext2,
                  controller: confpasswordController,
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
                    hintText: "Confirm Password",
                    suffixIcon: IconTheme(
                      data: IconThemeData(color: Colors.black),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscuretext2 = !_obscuretext2;
                            });
                          },
                          child: Icon(_obscuretext2
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
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
              Container(
                width: 0.7 * MediaQuery.of(context).size.width,
                height: 60,
                child: OutlinedButton(
                    child: Text(
                      'Sign Up',
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
                      signUp();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    if (passwordconfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              "Registered Successfully.",
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
          ),
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => studenthomepage()));
      } on FirebaseAuthException catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.message.toString(),
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
          ),
        );
      }
    }
  }

  bool passwordconfirmed() {
    if (passwordController.text.trim() == confpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
}
