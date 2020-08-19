import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_repo/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_start_repo/models/User.dart';
import 'package:flutter_start_repo/utils/storage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<User>(
              future: Storage().getUserInfo(),
              builder: (context, snapshot) {
                if(snapshot.data!=null)
                return Text('userInfo === ${snapshot.data}');
                else
                  return Text('fettching..');
              }
            ),
            FlatButton(
              onPressed: (){
                BlocProvider.of<AuthenticationBloc>(context).logOut();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
