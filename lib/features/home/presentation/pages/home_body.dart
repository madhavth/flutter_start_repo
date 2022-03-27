import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../login/presentation/cubits/auth/authentication_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("default Flutter App Welcome"),
            SizedBox(
              height: 16.h,
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).logOut();
              },
              child: const Text("logout"),
            )
          ],
        ),
      ),
    );
  }
}
