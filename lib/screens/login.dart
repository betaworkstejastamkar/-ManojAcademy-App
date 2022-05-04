import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manojacademy/screens/navbarScreens/navbar.dart';
import 'package:manojacademy/screens/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: [
          Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/RegisterBg.svg',
                      width: width,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 70),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width - 380, vertical: 10),
                  child: Expanded(
                    child: Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(229, 229, 229, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: 'Mobile no. / Email ID',
                              hintText: 'Enter your Mobile no. / Email ID'),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(229, 229, 229, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: 'Password',
                              hintText: 'Enter Your Password'),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Forget?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2))
                            ]),
                        const SizedBox(
                          height: 7,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavBar()),
                            );
                          },
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
                                icon: Image.asset(
                                  'icons/googleicon.png',
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary:
                                        const Color.fromRGBO(229, 229, 229, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                    )),
                                onPressed: () {},
                                label: const Text(
                                  'Google',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(2, 1, 1, 1)),
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
                                icon: Image.asset('icons/facebookicon.png'),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary:
                                        const Color.fromRGBO(229, 229, 229, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                    )),
                                onPressed: () {},
                                label: const Text(
                                  'Facebook',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(2, 1, 1, 1)),
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
                          child: Text('New User? Sign Up Now',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ],
                    ),
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
