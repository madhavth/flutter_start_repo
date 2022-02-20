import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/features/login/presentation/cubits/auth/authentication_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("default Flutter App Welcome"),
          SizedBox(height: 16.h,),
          TextButton(onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).logOut();
          },
          child: Text("logout"))
        ],
      ),
    ));
  }
}
