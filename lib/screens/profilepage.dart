import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const name = 'Rohan Sha';
    const email = 'Rohanshah12@gmail.com';
    const urlImage =
        'https://media.istockphoto.com/photos/photo-of-school-boy-wear-yellow-tshirt-backpack-in-background-stock-picture-id1372481295?k=20&m=1372481295&s=612x612&w=0&h=CNl9rfw4D5q19ONsAJ88D3gz4-WHdvYAL0KpXfz0Cqo=';

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'Heebo'),
        ),
        leading: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: SvgPicture.asset('icons/arrow-left.svg'),
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white)),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        SvgPicture.asset(
                          'assets/Profilebg.svg',
                          width: width - 50,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: const CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(urlImage)),
                          // width: 60,
                          // height: 32.0,
                          padding: const EdgeInsets.all(2.0), // borde width
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor, // border color
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset(
                              'profile_icons/contactIcon.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Heebo',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                ),
                                Text(
                                  name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Heebo',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: Divider(
                            color: Color.fromRGBO(229, 229, 229, 1),
                            height: 10.0,
                            thickness: 1),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset(
                              'profile_icons/mailIcon.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'E-mail',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Heebo',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                ),
                                Text(
                                  email,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Heebo',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: Divider(
                            color: Color.fromRGBO(229, 229, 229, 1),
                            height: 10.0,
                            thickness: 1),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset(
                              'profile_icons/LockIcon.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Heebo',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                ),
                                Text(
                                  'Updated 2 week ago',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Heebo',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: Divider(
                            color: Color.fromRGBO(229, 229, 229, 1),
                            height: 10.0,
                            thickness: 1),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset(
                              'profile_icons/phoneIcon.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Contact Number',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Heebo',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                ),
                                Text(
                                  '+919878977771',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Heebo',
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: SvgPicture.asset(
                                'profile_icons/CardIcon.svg',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'My purchase',
                                style: TextStyle(
                                    fontFamily: 'Heebo',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: SvgPicture.asset(
                                  'icons/arrow-right.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          child: Divider(
                              color: Color.fromRGBO(229, 229, 229, 1),
                              height: 10.0,
                              thickness: 1),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: SvgPicture.asset(
                                  'profile_icons/rewardIcon.svg',
                                  width: 40,
                                  height: 40),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Accomplishment',
                                style: TextStyle(
                                    fontFamily: 'Heebo',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset('icons/arrow-right.svg',
                                  width: 30, height: 30),
                            ),
                          ],
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          child: Divider(
                              color: Color.fromRGBO(229, 229, 229, 1),
                              height: 10.0,
                              thickness: 1),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: SvgPicture.asset(
                                  'profile_icons/messageIcon.svg',
                                  width: 40,
                                  height: 40),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Help Center',
                                style: TextStyle(
                                    fontFamily: 'Heebo',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset('icons/arrow-right.svg',
                                  width: 30, height: 30),
                            ),
                          ],
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          child: Divider(
                              color: Color.fromRGBO(229, 229, 229, 1),
                              height: 10.0,
                              thickness: 1),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: SvgPicture.asset(
                                  'profile_icons/filesIcon.svg',
                                  width: 40,
                                  height: 40),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    fontFamily: 'Heebo',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset('icons/arrow-right.svg',
                                  width: 30, height: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
