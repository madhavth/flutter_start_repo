import 'package:flutter/material.dart';
import 'package:flutter_start_repo/ui/extra/loading.dart';
import 'package:flutter_start_repo/ui/home/home_body.dart';
import 'package:flutter_start_repo/widgets/error_screen.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: HomeBody(),
    );
  }
}

