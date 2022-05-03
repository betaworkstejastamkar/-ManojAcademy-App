import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manojacademy/screens/aboutuspage.dart';
import 'package:manojacademy/screens/downloadcertificatepage.dart';
import 'package:manojacademy/screens/login.dart';
import 'package:manojacademy/screens/mylearningpage.dart';
import 'package:manojacademy/screens/profilepage.dart';
import 'package:manojacademy/screens/subscriptionplanpage.dart';
import 'package:manojacademy/screens/tacpage.dart';
import 'package:manojacademy/screens/testresultpage.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const name = 'Rohan Sha';
    const email = 'Your Profile';
    const urlImage =
        'https://media.istockphoto.com/photos/photo-of-school-boy-wear-yellow-tshirt-backpack-in-background-stock-picture-id1372481295?k=20&m=1372481295&s=612x612&w=0&h=CNl9rfw4D5q19ONsAJ88D3gz4-WHdvYAL0KpXfz0Cqo=';

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          buildHeader(
            urlImage: urlImage,
            name: name,
            email: email,
            onClicked: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Divider(
                color: Color.fromRGBO(229, 229, 229, 0.6),
                height: 10.0,
                thickness: 1),
          ),
          listItem(
              name: 'My learning',
              context: context,
              index: 0,
              icon: 'icons/book.svg'),
          listItem(
              name: 'Test Result',
              context: context,
              index: 1,
              icon: 'icons/bar-chart.svg'),
          listItem(
              name: 'Subscription Plan',
              context: context,
              index: 2,
              icon: 'icons/Wallet.svg'),
          listItem(
              name: 'Download Certificate',
              context: context,
              index: 3,
              icon: 'icons/download.svg'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Divider(
                color: Color.fromRGBO(229, 229, 229, 0.6),
                height: 10.0,
                thickness: 1),
          ),
          listItem(
              name: 'About Us',
              context: context,
              index: 4,
              icon: 'icons/clipboard.svg'),
          listItem(
              name: 'Terms and Conditions',
              context: context,
              index: 5,
              icon: 'icons/paperclip.svg'),
          ListTile(
            onTap: () {
              // Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            leading: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset('icons/log-out.svg')),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(0, 129, 100, 1),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset('icons/arrow-right.png'),
            ],
          ),
        ),
      );

  Widget listItem({name, icon, context, index}) {
    return ListTile(
      onTap: () {
        navigatePageItem(context, index);
      },
      leading: SizedBox(
        width: 20,
        height: 20,
        child: SvgPicture.asset(icon),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  void navigatePageItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MylearningPage()));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TestResultPage()));
        break;

      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SubPlanPage()));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DownloadCertificatePage()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AboutUsPage()));
        break;
      case 5:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TermsConditions()));
        break;
      default:
    }
  }
}
