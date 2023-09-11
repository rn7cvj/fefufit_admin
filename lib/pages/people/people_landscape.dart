import 'package:admin_page/contollers/people/people_controller.dart';

import 'package:admin_page/pages/people/widgets/lable.dart';
import 'package:admin_page/pages/people/widgets/tab_bar_selector.dart';
import 'package:admin_page/pages/people/widgets/actions_row.dart';
import 'package:admin_page/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobx/mobx.dart';
import 'widgets/users_table.dart';

class PeopleLandscape extends StatefulWidget {
  const PeopleLandscape({super.key});

  @override
  State<PeopleLandscape> createState() => _PeopleLandscapeState();
}

class _PeopleLandscapeState extends State<PeopleLandscape> with TickerProviderStateMixin {
  late final tabBarContoller = TabController(length: 3, vsync: this);

  PeopleContoller contoller = GetIt.I<PeopleContoller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.backgoundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Lable(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TabBarSelector(
                tabBarController: tabBarContoller,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: ActionsRow(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (context) {
                    if (contoller.isLoading) {
                      return Center(
                        child: LoadingAnimationWidget.prograssiveDots(color: Colors.purple, size: 60),
                      );
                    }

                    return TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabBarContoller,
                      children: [
                        UsersTable(
                          data: contoller.visitors.asObservable(),
                          updateCallback: contoller.fetchNewVisitors,
                          shoudUpdate: contoller.shoudUpdateVisitors,
                        ),
                        UsersTable(
                          data: contoller.trainers.asObservable(),
                          updateCallback: contoller.fetchNewTrainers,
                          shoudUpdate: contoller.shoudUpdateTrainers,
                        ),
                        UsersTable(
                          data: contoller.staff.asObservable(),
                          updateCallback: contoller.fetchNewStaff,
                          shoudUpdate: contoller.shoudUpdateStaff,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
