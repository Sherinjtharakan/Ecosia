import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosia/screens/home/Userprofile/UserProfile.dart';
import 'package:ecosia/services/auth.dart';
import 'package:ecosia/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggelView;

  const Register({Key? key, required this.toggelView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
              backgroundColor: Colors.green[300],
              elevation: 0.0,
              centerTitle: true,
              title: const Text('Sign up to Ecosia'),
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      //email address
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      //password
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        obscureText: true,
                        validator: (val) => val!.length < 6
                            ? 'Enter a password bigger than 6 '
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      const SizedBox(height: 25.0),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() => loading = true);
                          if (_formKey.currentState!.validate()) {
                            dynamic result = await _auth.registerEmailPassword(
                                email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Please supply a valid email';
                                loading = false;
                              });
                            } else {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .add({
                                    'Email': email,
                                  })
                                  // ignore: avoid_print
                                  .then((value) => print("User Added"))
                                  .catchError((error) =>
                                      // ignore: avoid_print
                                      print("Failed to add user: $error"));

                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const UserProfile(),
                                ),
                              );
                              // SharedPreferences prefs = await SharedPreferences.getInstance();
                              // prefs.setString("email",email);
                            }
                            // print(email);
                            // print(password);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[600],
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            textStyle: const TextStyle(
                                letterSpacing: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        child: const Text('Register'),
                      ),
                      const SizedBox(height: 14.0),
                      Text(
                        error,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  )),
            ),
          );
  }
}
