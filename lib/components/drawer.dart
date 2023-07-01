import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 290,
      child: Column(
        children: [
          Card(
            child: Row(
              children: [
                Image.asset(
                  'assets/man.png', width: 100, height: 100),
                const SizedBox(width: 100),
                const Text('UserName'),
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
                Navigator.pop(context);},
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
              onTap: (){},
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
              onTap: (){},
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
          // TextButton
        ],
      ),
    );
  }
}