import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manojacademy/data/studentdata.dart';
import 'package:manojacademy/screens/loginscreen.dart';
import 'package:manojacademy/screens/navbarScreens/navbar.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String dropdownvalue = 'class 4';
  var items = [
    'class 4',
    'class 5',
    'class 6',
    'class 7',
    'class 8',
    'class 9',
  ];
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
                      fit: BoxFit.fill,
                      // height: 200,
                    ),
                    const Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 70),
                        child: Text(
                          'Register',
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            focusColor: Theme.of(context).primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(31, 229, 229, 229)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'Name',
                            hintText: 'Enter Your Name'),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            focusColor: Theme.of(context).primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            border: const OutlineInputBorder(
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              style: BorderStyle.solid,
                            ),
                            right: BorderSide(style: BorderStyle.solid),
                            left: BorderSide(style: BorderStyle.solid),
                            bottom: BorderSide(style: BorderStyle.solid),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        width: width,
                        child: DropdownButton(
                          underline: const Text(''),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          value: dropdownvalue,
                          icon: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            focusColor: Theme.of(context).primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(229, 229, 229, 1)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'Password',
                            hintText: 'Set Your Password'),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            focusColor: Theme.of(context).primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(229, 229, 229, 1)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'Confirm Password',
                            hintText: 'Re-Enter Your Password'),
                      ),
                      const SizedBox(
                        height: 20,
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
                                  builder: (context) => const BottomNavBar()));
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          studentClass = dropdownvalue;
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text('Already have Account? Login..',
                            style: Theme.of(context).textTheme.bodyText2),
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
