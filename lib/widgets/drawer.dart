import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Rohan Sha'),
            accountEmail: const Text('Your Profile'),
            currentAccountPicture: ClipOval(
              child: Image.network(
                'https://media.istockphoto.com/photos/photo-of-school-boy-wear-yellow-tshirt-backpack-in-background-stock-picture-id1372481295?k=20&m=1372481295&s=612x612&w=0&h=CNl9rfw4D5q19ONsAJ88D3gz4-WHdvYAL0KpXfz0Cqo=',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.book),
            title: Text('My learning'),
          ),
          const ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Test Result'),
          ),
          const ListTile(
            leading: Icon(Icons.link),
            title: Text('Live Lectures'),
          ),
          const ListTile(
            leading: Icon(Icons.wallet_membership),
            title: Text('Test Result'),
          ),
        ],
      ),
    );
  }
}
