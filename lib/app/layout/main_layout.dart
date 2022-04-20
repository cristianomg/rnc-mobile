import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xff59E5BF),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
