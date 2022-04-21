import 'package:flutter/material.dart';
import 'package:manojacademy/screens/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  'Login',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
                            labelText: 'Password',
                            hintText: 'Enter Your Password'),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        TextButton(
                            onPressed: () {}, child: const Text('Forget?'))
                      ]),
                      const SizedBox(
                        height: 7,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                        onPressed: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'or Login with',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 140,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.g_mobiledata),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey.shade400,
                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 20, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  )),
                              onPressed: () {},
                              label: const Text(
                                'Google',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 140,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.face_outlined),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey.shade400,
                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 20, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  )),
                              onPressed: () {},
                              label: const Text(
                                'Facebook',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()),
                          );
                        },
                        child: Text(
                          'New User? Sign Up Now',
                          style: TextStyle(
                              fontSize: 20, color: Colors.blue.shade700),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
