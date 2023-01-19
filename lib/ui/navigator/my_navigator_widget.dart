import 'package:flutter/material.dart';

import '../pages/detail_from_url_page.dart';
import '../pages/my_home_page.dart';

class MyNavigatorWidget extends StatefulWidget {
  const MyNavigatorWidget({Key? key, required this.themeData})
      : super(key: key);
  final ThemeData themeData;

  @override
  State<MyNavigatorWidget> createState() => MyNavigatorWidgetState();
}

class MyNavigatorWidgetState extends State<MyNavigatorWidget> {
  final myRouterDelegate = MyRouterDelegate(
    listOfPages: [
      MyPage(
        (_) => const MyHomePage(),
        path: MyHomePage.initialRouteName,
      ),
      MyPage(
          (data) => DetailFromUrlPage(
                imageIndex: int.tryParse(data['imageindex'] ?? '0') ?? 0,
              ),
          path: '${DetailFromUrlPage.routeName}:imageindex')
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nav 2.0 for web and deeplinks',
      theme: widget.themeData,
      routerDelegate: myRouterDelegate,
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}

class MyPage {
  final Widget Function(Map<String, String> data) builder;
  final String path;
  MyPage(this.builder, {required this.path});
}

class MyRouterDelegate extends RouterDelegate<Uri>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  late final List<MyPage> listOfPages;

  MyRouterDelegate({required this.listOfPages}) {
    final homePage = listOfPages.firstWhere((element) => element.path == '/');
    _navigatorPages = [
      MaterialPage(
        child: homePage.builder(
          {},
        ),
      )
    ];
  }

  late List<Page> _navigatorPages;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) {
        if (route.didPop(result)) {
          _navigatorPages.removeWhere((e) => e.name == route.settings.name);
          notifyListeners();
          return true;
        }
        return false;
      },
      pages: _navigatorPages,
    );
  }

  @override
  Future<void> setNewRoutePath(Uri configuration) async {
    // cOMPROBAMOS SI LA RUTA EXISTE
    final path = configuration.path;
    final data = <String, String>{};
    final index = listOfPages.indexWhere(
      (e) {
        if (e.path == path) {
          return true;
        }

        if (e.path.contains('/:')) {
          final lastIndex = e.path.lastIndexOf('/:');

          final substring = e.path.substring(0, lastIndex);
          if (path.startsWith(substring)) {
            final String key = e.path.substring(lastIndex + 2, e.path.length);
            final String value = path.substring(lastIndex + 1, path.length);
            data[key] = value;
            return true;
          }
        }
        return false;
      },
    );
    if (index > -1) {
      _navigatorPages = [
        ..._navigatorPages,
        MaterialPage(
          name: path,
          child: listOfPages[index].builder(data),
        ),
      ];
      notifyListeners();
    }
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
  @override
  Uri? get currentConfiguration => Uri.parse(_navigatorPages.last.name ?? '');
  //@override
  //void addListener(VoidCallback listener) {
  //}

  //@override
  //void removeListener(VoidCallback listener) {
  //}

}

class MyRouteInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) {
    return Future.value(
      Uri.parse(routeInformation.location ?? ''),
    );
  }

  @override
  RouteInformation? restoreRouteInformation(Uri configuration) {
    return RouteInformation(
      location: configuration.toString(),
    );
  }
}
