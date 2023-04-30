import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/domain/entities/order_for_client_entity.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';
import 'package:hokok/presentation/screen/browse_order/order_details_screen.dart';

import '../../../core/functions.dart';
import '../../../core/routes_manager.dart';

class BrowseOrderScreen extends StatefulWidget {
  const BrowseOrderScreen({Key? key}) : super(key: key);

  @override
  State<BrowseOrderScreen> createState() => _BrowseOrderScreenState();
}

class _BrowseOrderScreenState extends State<BrowseOrderScreen> {
  @override
  void initState() {
    OrderHelper.instance().onGetAllClientOrdersFun(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHandler.getScreenHeight(context),
      width: ScreenHandler.getScreenWidth(context),
      padding: const EdgeInsets.all(10),
      child: BlocConsumer<OrderBloc, OrderStates>(listener: (context, state) {
        if (state is OrderFailedLoadedState) {
          state.authErrorMessage(context, state.error);
        }
      }, builder: (context, state) {
        if (state is OrderLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ClientOrdersLoadedState) {
          return ListView.builder(
            itemCount: state.clientOrders!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  navigateTo(context,OrderDetailsScreen(
                      id: state.clientOrders![index].id!,
                      title: state.clientOrders![index].title!,
                      createdAt: state.clientOrders![index].createdAt!,
                      major: state.clientOrders![index].major!,
                      requests:state.clientOrders![index].requests! ,
                      subMajor: state.clientOrders![index].subMajor!,
                      description: state.clientOrders![index].description!));
                },
                child: OrderView(
                  clientOrder: state.clientOrders![index],
                ),
              );
            },
          );
        } else if (state is OrderFailedLoadedState) {
          return emptyDataSharedWidget();
        } else {
          return Container();
        }
      }),
    );
  }
}

class OrderView extends StatelessWidget {
  const OrderView({
    required this.clientOrder,
    super.key,
  });
  final ClientOrderInfo? clientOrder;
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
              clientOrder!.title.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: FontConstants.fontFamily,
                color: Colors.orange,
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              onTap: () {},
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
                  icon: Icons.person,
                  title: clientOrder!.client!.name.toString(),
                ),
                const SizedBox(
                  width: 8,
                ),
                RowItems(
                  icon: Icons.hourglass_empty,
                  title: clientOrder!.createdAt.toString(),
                ),
                const SizedBox(
                  width: 8,
                ),
                RowItems(
                  icon: Icons.bookmark_border,
                  title: "${clientOrder!.requests} عروض",
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              clientOrder!.description.toString(),
              style: const TextStyle(
                fontFamily: FontConstants.fontFamily,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowItems extends StatelessWidget {
  const RowItems({
    required this.title,
    required this.icon,
    super.key,
  });
  final IconData? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          size: 12,
          icon,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title.toString(),
          style: const TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: Colors.grey,
            fontSize: 10,
          ),
        )
      ],
    );
  }
}
