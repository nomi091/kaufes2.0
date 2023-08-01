import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kaufes/view_model/home_view_model/notification_view_model.dart';
import 'package:provider/provider.dart';

import '../../../data/responce/status.dart';
import '../../../res/widgets/global_widgets/filter_app_bar.dart';
import '../../../utils/constants/constant_width.dart';
import 'notification_card_view.dart';

class InAppNotificationScreen extends StatefulWidget {
  const InAppNotificationScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InAppNotificationScreenState createState() =>
      _InAppNotificationScreenState();
}

bool isLoading = true;
String formatDateAndExtractTime(dateTime) {
  final formattedTime = DateFormat.Hm().format(dateTime); // Format as HH:mm
  return formattedTime;
}

NotificationViewModel notificationViewModel = NotificationViewModel();

class _InAppNotificationScreenState extends State<InAppNotificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    notificationViewModel.getNotifications();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1), // Start the cards at the bottom
      end: Offset.zero, // Move the cards to their final position
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutSine,
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.square(size.height * 0.06),
          child: FilterAppBar(
            onTapBack: () {
              Navigator.pop(context);
            },
            height: size.height * 0.05,
            title: 'Notifications',
            trailingCheck: false,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * 0.0),
            child: ChangeNotifierProvider<NotificationViewModel>.value(
              value: notificationViewModel,
              child: Consumer<NotificationViewModel>(
                builder: (context, value, _) {
                  switch (value.getAllItemsData.status) {
                    case Status.LOADING:
                      return const Center(child: CircularProgressIndicator());
                    case Status.ERROR:
                      return Text(value.getAllItemsData.message.toString());
                    default:
                      return SizedBox(
                          width: ConstantSize.getWidth(context),
                          height: ConstantSize.getHeight(context) * 1,
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return SlideTransition(
                                    position: _animation,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return const NoficationCardScreen();
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          )
                          // : Center(
                          //     child: SvgPicture.asset(AppImages.svgNoAdsIcon),
                          //   );,
                          );
                  }
                },
              ),
            )));
  }
}
