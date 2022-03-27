import 'package:flutter/material.dart';
import '../../utils/router.dart';

class SessionExpiredScreen extends StatelessWidget {
  const SessionExpiredScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: AlertDialog(
        actions: [
          MaterialButton(onPressed: () {
            Navigator.pushNamed(context, AppRouter.kLogin);
          },
          child: const Text('Go to login Screen'),
          )
        ],
        title: const Text('Session Expired'),

      ),
    );
  }
}
