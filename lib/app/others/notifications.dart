<<<<<<< HEAD
import 'package:benji_vendor/back_office/notification/notification_provider.dart';
import 'package:benji_vendor/reusable%20widgets/empty.dart';
import 'package:benji_vendor/theme/colors.dart';
import 'package:benji_vendor/providers/constants.dart';
import 'package:benji_vendor/utility/operations.dart';
=======
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
import '../../back_office/notification/notification_model.dart';
import '../../reusable widgets/my appbar.dart';
=======
import '../../src/common_widgets/my appbar.dart';
import '../../src/providers/constants.dart';
import '../../theme/colors.dart';
>>>>>>> 2bb7c5da8b76930a1131e8b80be36410a7739dcd

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  //=================================== ALL VARIABLES =====================================\\
  final int _notifications = 4;

//=================================== LISTS =====================================\\
  final List<String> _notificationTitle = [
    "Tanbir Ahmed",
    "Salim Smith",
    "Royal Bengol",
    "Pabel Vuiya",
  ];
  final List<String> _notificationSubject = [
    "Placed a new order",
    "left a 5 star review",
    "agreed to cancel",
    "Placed a new order",
  ];
  final List<String> _notificationTime = [
    "2 mins",
    "8 mins",
    "15 mins",
    "24 mins",
  ];

  @override
  Widget build(BuildContext context) {
    NotificationProvider notify = context.watch<NotificationProvider>();
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: MyAppBar(
        title: "Notifications",
        toolbarHeight: 80,
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        actions: const [],
      ),
      body: notify.notification.isEmpty ?const EmptyPage(msg: "You don't have any notification!")  : SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          padding: const EdgeInsets.all(
            kDefaultPadding,
          ),
          child: ListView.builder(
            itemCount: notify.notification.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              final NotificationModel data = notify.notification[index];
              return Column(
                children: [
                  ListTile(
                    minVerticalPadding: kDefaultPadding / 2,
                    enableFeedback: true,
                    leading: const CircleAvatar(
                      backgroundColor: Color(
                        0xFF98A8B8,
                      ),
                      child: ClipOval(
                        clipBehavior: Clip.hardEdge,
                      ),
                    ),
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "${data.client!.username} \n",
                            style: const TextStyle(
                              color: Color(0xFF32343E),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: data.message,
                            style: const TextStyle(
                              color: Color(0xFF9B9BA5),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      Operations.convertDate(data.created!),
                      style: const TextStyle(
                        color: Color(0xFF9B9BA5),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: 327,
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(
                        0xFFF0F4F9,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
