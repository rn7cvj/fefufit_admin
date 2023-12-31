import 'package:admin_page/contollers/booking/booking_controller.dart';
import 'package:admin_page/contollers/booking/booking_converter.dart';
import 'package:admin_page/contollers/booking/booking_service.dart';
import 'package:admin_page/contollers/plan/plan_controller.dart';
import 'package:admin_page/contollers/user_data/user_data_controller.dart';
import 'package:admin_page/contollers/user_data/user_data_converter.dart';
import 'package:admin_page/contollers/user_data/user_data_service.dart';
import 'package:admin_page/pages/scanned_person/widgets/person_card.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PersonScannedPage extends StatelessWidget {
  PersonScannedPage({super.key, required this.scannedUserId}) {
    userDataContoller = GetIt.I<UserDataContoller>();
    bookingContoroller = GetIt.I<BookingContoroller>();
    planContoroller = GetIt.I<PlanContoroller>();

    userDataContoller.getUserData(scannedUserId);
    bookingContoroller.getBooking(scannedUserId);
    planContoroller.getPlans(scannedUserId);
  }

  final String scannedUserId;

  late UserDataContoller userDataContoller;

  late BookingContoroller bookingContoroller;

  late PlanContoroller planContoroller;

  @override
  Widget build(BuildContext context) {
    userDataContoller.getUserData(scannedUserId);
    return Observer(
      builder: (context) {
        if (userDataContoller.isLoading || bookingContoroller.isLoading || planContoroller.isLoading) {
          return Center(
            child: LoadingAnimationWidget.prograssiveDots(color: const Color.fromRGBO(67, 67, 244, 1), size: 60),
          );
        }

        return PersonCard(
          userId: scannedUserId,
          userData: userDataContoller.userData!,
          booking: bookingContoroller.booking,
          plans: planContoroller.plans,
        );
      },
    );
  }
}
