import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'router_handler.dart';

class Routers {
  static String root = '/';
  static String detailsPage = '/detail';

  static void configurRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ERROR=======> ROUTE WAS NOT FOUND !');
      },
    );
    router.define(detailsPage, handler: detailsHander);
  }
}
