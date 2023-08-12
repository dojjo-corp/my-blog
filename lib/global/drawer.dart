import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final currentUser = FirebaseAuth.instance.currentUser;
        return Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text(currentUser?.displayName ?? 'null-user'),
                  accountEmail: Text(currentUser?.email ?? 'null-email')),
              // MAIN DRAWER ITEMS
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    // ignore: avoid_print
                    print('dashboard clicked');
                    Navigator.popAndPushNamed(context, '/dashboard');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Dashboard'),
                      const SizedBox(
                        width: 100,
                      ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/accountConfig');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Account'),
                      const SizedBox(
                        width: 100,
                      ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/appSettings');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Settings'),
                      const SizedBox(
                        width: 100,
                      ),
                      Icon(
                        Icons.settings,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/accountConfig');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('My Blogs'),
                      const SizedBox(
                        width: 100,
                      ),
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
      },
    );
  }
}
