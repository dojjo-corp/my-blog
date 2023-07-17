// ignore: unused_import
import 'package:dojjoblog/pages/dashboard.dart';
import 'package:dojjoblog/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Drawer(
      child: Column(
        children: [
          Card(
            child: Row(
              children: [
                Image.asset(
                  'assets/man.png', width: 100, height: 100),
                const SizedBox(width: 100),
                Text(userProvider.currentUser['name']!),
              ],
            ),
          ),
          // MAIN DRAWER ITEMS
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:50.0, vertical: 20),
            child: GestureDetector(
              onTap: (){
                // ignore: avoid_print
                print('dashboard clicked');
                Navigator.popAndPushNamed(context, '/dashboard');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Dashboard'),
                  const SizedBox(width: 100,),
                  Icon(
                    Icons.dashboard_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:50.0, vertical: 20),
            child: GestureDetector(
              onTap: (){
                Navigator.popAndPushNamed(context, '/accountConfig');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Account'),
                  const SizedBox(width: 100,),
                  Icon(
                    Icons.account_box_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:50, vertical: 20),
            child: GestureDetector(
              onTap: (){
                Navigator.popAndPushNamed(context, '/appSettings');
              },
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Settings'),
                  const SizedBox(width: 100,),
                  Icon(
                    Icons.settings,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:50.0, vertical: 20),
            child: GestureDetector(
              onTap: (){
                Navigator.popAndPushNamed(context, '/accountConfig');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('My Blogs'),
                  const SizedBox(width: 100,),
                  Icon(
                    Icons.collections_bookmark_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          // TextButton
        ],
      ),
    );
  }
}
