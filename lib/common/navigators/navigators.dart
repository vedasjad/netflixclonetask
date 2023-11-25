import 'package:flutter/cupertino.dart';

class AppNavigators {
  static void animatedPushAndRemoveUntil(
      BuildContext context, Widget nextScreen) {
    Navigator.of(context).pushAndRemoveUntil(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final curve = CurvedAnimation(parent: animation, curve: Curves.easeIn);
        Tween<Offset> tween = Tween(begin: begin, end: end);
        Animation<Offset> offsetAnimation = tween.animate(curve);
        return SlideTransition(
          position: offsetAnimation,
          child: nextScreen,
        );
      },
    ), (route) => false);
  }

  static void animatedPush(BuildContext context, Widget nextScreen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final curve =
              CurvedAnimation(parent: animation, curve: Curves.easeIn);
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
