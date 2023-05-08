import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/core/values_manager.dart';
import 'package:hokok/domain/entities/notification_entity.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/home.dart';
import 'package:hokok/presentation/blocs/notification_bloc/notification_bloc.dart';
import 'package:hokok/presentation/blocs/notification_bloc/notification_helper.dart';
import 'package:hokok/presentation/blocs/notification_bloc/notification_states.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    NotificationHelper.instance().getAllNotificationsFun(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _appBar(context),
          SizedBox(
            height: 10.h,
          ),
          BlocConsumer<NotificationBloc, NotificationStates>(
            builder: (context, state) {
              if (state is NotificationLoadingState) {
                return state.showLoadingWidget();
              } else if (state is NotificationsFailedLoadedState) {
                return emptyDataSharedWidget();
              }
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 15.h),
                  itemCount: NotificationHelper.instance().notifications.length,
                  itemBuilder: (context, index) {
                    return NotificationView(
                      notification:
                          NotificationHelper.instance().notifications[index],
                    );
                  },
                ),
              );
            },
            listener: (context, state) {
              if (state is NotificationsLoadedState) {
                NotificationHelper.instance().notifications =
                    state.notifications;
              }
            },
          ),
        ],
      ),
    );
  }
}

Container _appBar(BuildContext context) => Container(
      width: double.infinity,
      height: AppSize.s172,
      color: ColorManager.primary,
      padding: EdgeInsets.only(left: 20, top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            AssetsManager.logoEnsaf,
            fit: BoxFit.cover,
            width: AppSize.s177,
            height: AppSize.s88,
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.shopping_cart,
              color: ColorManager.thirdy,
              size: 30,
            ),
          ),
        ],
      ),
    );

class NotificationView extends StatelessWidget {
  const NotificationView({
    required this.notification,
    super.key,
  });
  final NotificationsInfo notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.orangeAccent, width: .8),
        ),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              notification.content.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontFamily: FontConstants.fontFamily,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(
                //   RouteGenerator.getRoute(
                //     RouteSettings(
                //       name: Routes.lawyerOrderDetailsScreen,
                //       arguments: order,
                //     ),
                //   ),
                // );
              },
              child: const Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                RowItems(
                  icon: Icons.hourglass_empty,
                  title: notification.createdAt.toString(),
                ),
                const SizedBox(
                  width: 8,
                ),
                RowItems(
                  icon: Icons.person,
                  title: "${notification.from!.name}",
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            // Text(
            //   order.description.toString(),
            //   style: const TextStyle(
            //     fontFamily: FontConstants.fontFamily,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
