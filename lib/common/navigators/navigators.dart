import 'package:flutter/cupertino.dart';

class AppNavigators {
  static void animatedPushTo(BuildContext context, Widget nextScreen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final curve = CurvedAnimation(parent: animation, curve: Curves.ease);
          Tween<Offset> tween = Tween(begin: begin, end: end);
          Animation<Offset> offsetAnimation = tween.animate(curve);
          return SlideTransition(
            position: offsetAnimation,
            child: nextScreen,
          );
        },
      ),
    );
  }
}
