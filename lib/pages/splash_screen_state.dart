import 'package:flutter/material.dart';
import 'package:hooka_tienda/pages/login_page.dart';
import 'package:hooka_tienda/pages/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => LoginPage(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: PriceChangeGradients,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: PriceChangeColors.white,
                radius: 100,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset('assets/images/logo-1.png'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Inventory Pos Management App 1',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                      color: PriceChangeColors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
