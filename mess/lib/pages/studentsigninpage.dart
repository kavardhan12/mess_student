import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess/pages/forgotpasspage.dart';
import 'package:mess/pages/studentsignuppage.dart';

class studentSigninpage extends StatefulWidget {
  const studentSigninpage({Key? key}) : super(key: key);

  @override
  State<studentSigninpage> createState() => _studentSigninpageState();
}

class _studentSigninpageState extends State<studentSigninpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obscuretext = true;
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Successfully Signed In.",
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ),
      );
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

  String validatepass(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null.toString();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'NIT\'S Student',
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
          child: Form(
            key: formkey,
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
                      hintText: "Email",
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
                  child: TextFormField(
                    validator: validatepass,
                    obscureText: _obscuretext,
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
                      hintText: "Password",
                      suffixIcon: IconTheme(
                        data: IconThemeData(color: Colors.black),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscuretext = !_obscuretext;
                              });
                            },
                            child: Icon(_obscuretext
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
                      'Sign In',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onPressed: () {
                      signIn();
                    },
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Forgotpasswordpage()));
                  },
                  child: Text(
                    "Forgot Password",
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.openSans(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => studentSignupPage()));
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
