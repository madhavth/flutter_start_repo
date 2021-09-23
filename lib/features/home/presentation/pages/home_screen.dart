import 'package:flutter/material.dart';
import 'package:flutter_start_repo/widgets/loading.dart';
import 'package:flutter_start_repo/features/home/presentation/pages/home_body.dart';
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

