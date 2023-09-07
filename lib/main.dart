import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:named_route_app/bloc/product_bloc.dart';
import 'package:named_route_app/detail_page.dart';
import 'package:named_route_app/first_page.dart';
import 'package:named_route_app/navigator_service.dart';
import 'package:named_route_app/notfound_page.dart';

import 'injector_container.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        navigatorKey: getIt<NavigatorService>().navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const FirstPage(), settings);
      case '/detail':
        return _detailRoute(settings);
      default:
        return _materialRoute(const NotFoundPage(), settings);
    }
  }

  static Route<dynamic> _detailRoute(RouteSettings settings) {
    if (settings.arguments is DetailParams) {
      return _materialRoute(
          DetailPage(
            params: settings.arguments as DetailParams,
          ),
          settings);
    } else {
      throw Exception('invalid argument');
    }
  }

  static Route<T> _materialRoute<T>(Widget view, RouteSettings settings) {
    return MaterialPageRoute<T>(builder: (_) => view, settings: settings);
  }
}
