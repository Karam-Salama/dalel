import '../../../../core/functions/app_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              customReplacementNavigate(context, '/signIn');
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: const Center(child: Text('Home View')),
    );
  }
}
