/* */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* */
import 'package:flutter_app/providers/navigation.dart';

/// Navigation entry point for app.
class Root extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        // Create bottom navigation bar items from screens.
        final bottomNavigationBarItems = provider.screens
            .map((screen) => BottomNavigationBarItem(
            icon: screen.icon, label: screen.title))
            .toList();

        // Initialize [Navigator] instance for each screen.
        final screens = provider.screens
            .map(
              (screen) => Offstage(
            offstage: screen != provider.currentScreen,
            child: Navigator(
              key: screen.navigatorState,
              onGenerateRoute: screen.onGenerateRoute,
            ),
          ),
        )
            .toList();

        return WillPopScope(
          onWillPop: () async => provider.onWillPop(context),
          child: Scaffold(
            body: IndexedStack(
              children: screens,
              index: provider.currentTabIndex,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavigationBarItems,
              currentIndex: provider.currentTabIndex,
              onTap: provider.setTab,
            ),
          ),
        );
      },
    );
  }
}