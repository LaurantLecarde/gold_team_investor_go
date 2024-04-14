import 'package:flutter/cupertino.dart';

navPush(context, Widget to) {
  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => to));
}

navPop(context) {
  Navigator.of(context).pop();
}

navPushAndRemove(context, Widget to) {
  Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(builder: (context) => to), (route) => false);
}

navPushAndRemoveSmallToFull(context, Widget to) {
  Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => to,
        transitionsBuilder: (context, animation1, animation2, child) {
          return ScaleTransition(
            scale: animation1,
            child: child,
          );
        },
        transitionDuration: Duration(seconds: 1),
      ),
      (route) => false);
}
