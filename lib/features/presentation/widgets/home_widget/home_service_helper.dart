  import 'package:firsteconomy/core/constant/app_images.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_custom_servicecard.dart';
import 'package:flutter/material.dart';

List<Widget> getServiceItems() {
    return [
      buildServiceItem(AppImages.bike, 'Two Wheeler\nLoan', Alignment.bottomCenter, Alignment.topCenter),
      buildServiceItem(AppImages.personalloan, 'Personal\nLoan', Alignment.topCenter, Alignment.bottomCenter),
      buildServiceItem(AppImages.payemi, 'Pay EMIs',Alignment.bottomCenter, Alignment.topCenter),
      buildServiceItem(AppImages.creditsscore, 'Credit\nScore',Alignment.topCenter, Alignment.bottomCenter),
      buildServiceItem(AppImages.bikeservice, 'Bike\nServicing',Alignment.bottomCenter, Alignment.topCenter),
      buildServiceItem(AppImages.enach, 'eNach',Alignment.topCenter, Alignment.bottomCenter),
      buildServiceItem(AppImages.quizgame, 'Quiz &\nGame',Alignment.bottomCenter, Alignment.topCenter),
      buildServiceItem(AppImages.evchargin, 'EV Charging\nLocation',Alignment.topCenter, Alignment.bottomCenter),
    ];
  }