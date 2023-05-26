import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';

import '../../../../../../presentation/screen/browse_order/browse_order_screen.dart';

class LawyerOffersScreen extends StatefulWidget {
  const LawyerOffersScreen({Key? key}) : super(key: key);

  @override
  State<LawyerOffersScreen> createState() => _LawyerOffersScreenState();
}

class _LawyerOffersScreenState extends State<LawyerOffersScreen> {
  @override
  void initState() {
    OrderHelper.instance().getRequestOrdersForLawyerAction(context);
    super.initState();
  }

  static List<RequestsLawyerOrderInfo> requestOrders = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderStates>(
      listener: (context, state) {
        if (state is RequesrOrderFailedLoadedState) {
          //state.authErrorMessage(context, state.error);
        } else if (state is RequestOrderLoadedState) {
          requestOrders = state.requestOrders!;
        }
      },
      builder: (context, state) {
        if (state is OrderLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OrderFailedLoadedState) {
          return emptyDataSharedWidget();
        }
        return SizedBox(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 15.h),
            itemCount: requestOrders.length,
            itemBuilder: (context, index) {
              return RequestOrderView(order: requestOrders[index]);
            },
          ),
        );
      },
    );
  }
}

class RequestOrderView extends StatelessWidget {
  const RequestOrderView({
    required this.order,
    super.key,
  });
  final RequestsLawyerOrderInfo order;
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
              order.order!.title.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontFamily: FontConstants.fontFamily,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
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
                  icon: Icons.hourglass_empty,
                  title: order.createdAt.toString(),
                ),
                const SizedBox(
                  width: 8,
                ),
                RowItems(
                  icon: Icons.bookmark_border,
                  title: "${order.order!.requests} عروض",
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
              order.order!.description.toString(),
              style: const TextStyle(
                fontFamily: FontConstants.fontFamily,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
