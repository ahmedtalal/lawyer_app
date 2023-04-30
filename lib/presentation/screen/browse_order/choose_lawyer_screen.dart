import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/domain/entities/order_for_client_entity.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/presentation/screen/browse_order/request_details_screen.dart';
import '../../../config/screen_handler.dart';
import '../../../core/assets_manager.dart';
import '../../../core/functions.dart';
import '../../../core/routes_manager.dart';
import '../../../core/shared_widget/button.dart';
import '../../../core/shared_widget/empty_data_shared_widget.dart';
import '../../../core/shared_widget/text.dart';
import '../../../core/strings_manager.dart';
import '../../../core/values_manager.dart';
import '../../../domain/entities/client__requests_order_entity.dart';
import '../../blocs/order_bloc/order_bloc.dart';
import '../../blocs/order_bloc/order_helper.dart';
import '../../blocs/order_bloc/order_states.dart';

class ChooseLawyer extends StatefulWidget {
  const ChooseLawyer({Key? key}) : super(key: key);

  @override
  State<ChooseLawyer> createState() => _ChooseLawyerState();
}

class _ChooseLawyerState extends State<ChooseLawyer> {
  @override
  void initState() {
    OrderHelper.instance().onGetAllClientOrdersRequest(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: ScreenHandler.getScreenHeight(context),
          width: ScreenHandler.getScreenWidth(context),
          child:
              BlocConsumer<OrderBloc, OrderStates>(listener: (context, state) {
            if (state is OrderFailedLoadedState) {
              state.authErrorMessage(context, state.error);
            }
            if (state is OrderActionFailedState) {
              state.authErrorMessage(context, state.error);
            }
          }, builder: (context, state) {
            if (state is OrderLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ClientOrdersRequestLoadedState) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.requestOrders!.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderRequestComponent(
                    lawer: state.requestOrders![index].lawyer!,
                      info: state.requestOrders![index].info!,
                      files: state.requestOrders![index].files!,
                      lawyerImage:
                          state.requestOrders![index].lawyer!.personalImage!,
                      requestId: state.requestOrders![index].id!,
                      lawyerName: state.requestOrders![index].lawyer!.name!,
                      expectedTime:
                          state.requestOrders![index].expectedDays!.toString(),
                      expectedBudget: state
                          .requestOrders![index].expectedBudget!
                          .toString(),
                      createdAt: state.requestOrders![index].createdAt!,
                      available: state.requestOrders![index].available!);
                },
              );
            } else if (state is OrderFailedLoadedState) {
              return emptyDataSharedWidget();
            } else {
              return Container();
            }
          }),
        ),
      ),
    ));
  }
}

class OrderRequestComponent extends StatelessWidget {
  final int requestId;
  final String lawyerName;
  final String expectedTime;
  final String expectedBudget;
  final String createdAt;
  final String lawyerImage;
  final String info;
  final List<String> files;
  final LawyerInfo lawer;
  final bool available;

  const OrderRequestComponent(
      {Key? key,
      required this.requestId,
      required this.lawyerName,
      required this.expectedTime,
      required this.files,
      required this.expectedBudget,
        required this.lawer,

        required this.info,
      required this.lawyerImage,
      required this.createdAt,
      required this.available})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: AppSize.s25,
                backgroundImage: Image.network(lawyerImage).image,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                children: [
                  DefaultText(
                    lawyerName,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const Spacer(),
              DefaultText2(createdAt, fontSize: 10.sp)
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 70.h,
            decoration: BoxDecoration(
                color: ConstantColor.greyWColor,
                borderRadius: BorderRadius.all(Radius.circular(15.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const DefaultText2(
                      'المدة المتوقعة',
                      fontWeight: FontWeight.bold,
                    ),
                    DefaultText(expectedTime),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const DefaultText2(
                      'الميزانيه المتوقعة',
                      fontWeight: FontWeight.bold,
                    ),
                    DefaultText(expectedBudget),
                  ],
                ),
                Container(
                  width: 80.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ConstantColor.secondaryColor,
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.profileRoute);
                      },
                      child: const DefaultText(
                        'زيارة البروفيل',
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  navigateTo(
                      context,
                      OrderRequestDetailsScreen(
                        order: RequestOrderInfo(
                            info: info,
                            id: requestId,
                            createdAt: createdAt,
                            expectedDays: int.parse(expectedTime),
                            lawyer: lawer,
                            files: files , expectedBudget:double.parse(expectedBudget) ),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ConstantColor.secondaryColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: DefaultElevatedButton2(
                    'تفاصيل الطلب',
                    fontSize: 13.sp,
                    size: const Size(AppSize.s12, AppSize.s12),
                  ),
                ),
              ),
              const Spacer(),
              available
                  ? InkWell(
                      onTap: () {
                        OrderHelper.instance()
                            .acceptOrderClient(context, requestId);
                        OrderHelper.instance()
                            .onGetAllClientOrdersRequest(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ConstantColor.primaryColor,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: DefaultElevatedButton2(
                          'موافقة الطلب',
                          fontSize: 13.sp,
                          size: const Size(AppSize.s12, AppSize.s12),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
