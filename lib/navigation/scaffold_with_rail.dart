import 'package:admin_page/themes/app_theme.dart';

import 'widgets/navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavigationRails extends StatelessWidget {
  const ScaffoldWithNavigationRails({super.key, required this.child, required this.state});

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.navigationTheme.backgoundColor,
      body: Row(children: [
        CustomNavigationRail(state: state),
        Expanded(child: child),
      ]),
    );
  }
}
