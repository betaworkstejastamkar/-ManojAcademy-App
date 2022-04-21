import 'package:flutter/material.dart';
import 'package:manojacademy/screens/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: [
          Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 140,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              labelText: 'Name',
                              hintText: 'Enter Your Name'),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              labelText: 'Mobile no. / Email ID',
                              hintText: 'Enter your Mobile no. / Email ID'),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              labelText: 'Course',
                              hintText: 'Enter Your Course'),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              labelText: 'Password',
                              hintText: 'Set Your Password'),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              labelText: 'Confirm Password',
                              hintText: 'Re-Enter Your Password'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                )),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(fontSize: 20),
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
