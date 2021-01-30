/* */
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/recommend.dart';
import 'package:provider/provider.dart';

/* */
import 'package:flutter_app/models/screen.dart';
import 'package:flutter_app/screens/root.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/recommend.dart';
import 'package:flutter_app/screens/orderList.dart';
import 'package:flutter_app/screens/like.dart';
import 'package:flutter_app/screens/alert.dart';

const HOME_SCREEN = 0;
const RECOMMEND_SCREEN = 1;
const LIKE_SCREEN = 2;
const ORDER_LIST_SCREEN = 3;
const MY_SCREEN = 4;
const ALERT_SCREEN = 5;

class NavigationProvider extends ChangeNotifier {
  /// Shortcut method for getting [NavigationProvider].
  static NavigationProvider of(BuildContext context) =>
      Provider.of<NavigationProvider>(context, listen: false);

  int _currentScreenIndex = HOME_SCREEN;

  int get currentTabIndex => _currentScreenIndex;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print('Generating route: ${settings.name}');
    switch (settings.name) {
      case AlertScreen.route:
        return MaterialPageRoute(builder: (_) => AlertScreen());
      default:
        return MaterialPageRoute(builder: (_) => Root());
    }
  }

  final Map<int, Screen> _screens = {
    HOME_SCREEN: Screen(
      title: '홈',
      icon: Icon(Icons.home_rounded),
      child: HomeScreen(),
      initialRoute: HomeScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Generating route: ${settings.name}');
        switch (settings.name) {
          case AlertScreen.route:
            return MaterialPageRoute(builder: (_) => AlertScreen());
          default:
            return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      },
      scrollController: ScrollController()
    ),
    RECOMMEND_SCREEN: Screen(
        title: '뭐 먹지',
        icon: Icon(Icons.ondemand_video_rounded),
        child: RecommendScreen(),
        initialRoute: RecommendScreen.route,
        navigatorState: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) {
          print('Generating route: ${settings.name}');
          switch (settings.name) {
            default:
              return MaterialPageRoute(builder: (_) => RecommendScreen());
          }
        },
        scrollController: ScrollController()
    ),
    LIKE_SCREEN: Screen(
      title: '찜한 가게',
      icon: Icon(Icons.tour_rounded),
      child: LikeScreen(),
      initialRoute: LikeScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Generating route: ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (_) => LikeScreen());
        }
      },
    ),
    // ORDER_LIST_SCREEN: Screen(
    //   title: '주문 내역',
    //   icon:  Icon(Icons.layers),
    //   child: OrderListPage(),
    //   initialRoute: OrderListPage.route,
    //   navigatorState: GlobalKey<NavigatorState>(),
    //   onGenerateRoute: (settings) {
    //     print('Generating route: ${settings.name}');
    //     switch (settings.name) {
    //       default:
    //         return MaterialPageRoute(builder: (_) => HomeScreen());
    //     }
    //   },
    // )
    // BottomNavigationBarItem(icon: Icon(Icons.child_care_rounded), label: 'My배민')
  };

  List<Screen> get screens => _screens.values.toList();

  Screen get currentScreen => _screens[_currentScreenIndex];

  /// Set currently visible tab.
  void setTab(int tab) {
    if (tab == currentTabIndex) {
      _scrollToStart();
    } else {
      _currentScreenIndex = tab;
      notifyListeners();
    }
  }

  /// If currently displayed screen has given [ScrollController] animate it
  /// to the start of scroll view.
  void _scrollToStart() {
    if (currentScreen.scrollController != null) {
      currentScreen.scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<bool> onWillPop(BuildContext context) async {
    final currentNavigatorState = currentScreen.navigatorState.currentState;

    if (currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else {
      if (currentTabIndex != HOME_SCREEN) {
        setTab(HOME_SCREEN);
        notifyListeners();
        return false;
      } else {
        return true;
      }
    }
  }

}