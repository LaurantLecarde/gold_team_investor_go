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
