import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE89E10),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Invasores',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
            Lottie.asset('assets/splash/splash_app.json'),
            Text(
              'Sincronizando datos...',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white, fontStyle: FontStyle.italic),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Por tu seguridad, mantente desconectado.',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
