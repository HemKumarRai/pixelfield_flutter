import 'package:flutter/cupertino.dart';

class SlideLeftRoute extends PageRouteBuilder {
  final Widget widget;
  SlideLeftRoute({required this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return widget;
  }, transitionsBuilder: (BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    Tween<Offset> offsetTween =
    Tween<Offset>(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0));
    final Animation<Offset> slideInFromTheRightAnimation =
    offsetTween.animate(animation);
    return SlideTransition(
        position: slideInFromTheRightAnimation, child: child);
  });
}

class SlideBottomRoute extends PageRouteBuilder {
  final Widget widget;
  SlideBottomRoute({required this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return widget;
  }, transitionsBuilder: (BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
    // transitionDuration:Duration(seconds: 1);
  });
}

