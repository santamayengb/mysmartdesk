import 'package:flutter/material.dart';

import 'package:mysmartdesk/router/router.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [AdminDashboardRoute(), UserDashboardRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: "Medicine",
              icon: Icon(Icons.medical_services_sharp),
            ),
            BottomNavigationBarItem(
              label: "Dashboard",
              icon: Icon(Icons.dashboard),
            )
          ],
        );
      },
    );
  }
}
