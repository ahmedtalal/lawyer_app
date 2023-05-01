import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/shared_widget/empty_data_shared_widget.dart';
import '../../../../core/shared_widget/text.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';
import '../../../../domain/entities/order_for_client_entity.dart';
import '../../../blocs/order_bloc/order_helper.dart';

class OrdersClientScreen extends StatefulWidget {
  OrdersClientScreen({Key? key}) : super(key: key);

  @override
  State<OrdersClientScreen> createState() => _OrdersClientScreenState();
}

List<ClientOrderInfo> clientOrders= [ ];
List<ClientOrderInfo> clientFinishedOrders= [];
List<ClientOrderInfo> clientInProgressOrders= [];
List<ClientOrderInfo> clientPublishedOrders = [];

class _OrdersClientScreenState extends State<OrdersClientScreen> {
  @override
  void initState() {
    OrderHelper.instance().getAllOrderForClient(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  TabBar(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p5,
                      vertical: AppPadding.p0,
                    ),
                    labelColor: ColorManager.secondary,
                    labelStyle: const TextStyle(
                      fontSize: FontSize.s13,
                      fontWeight: FontWeightManager.w400,
                    ),
                    indicatorPadding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p37,
                      vertical: AppPadding.p0,
                    ),
                    indicatorColor: ColorManager.primary,
                    indicatorWeight: AppSize.s4,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      _header(AppStrings.myOrders),
                      _header(AppStrings.inProgress),
                      _header(AppStrings.finished),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  _ordersBody(),
                  _inProgressBody(),
                 _completedBody()
                ]),
              )
            ],
          ),
        ));
  }

  Container header(String header, [double fontSize = FontSize.s15]) =>
      Container(
        height: AppSize.s40,
        width: AppSize.s90,
        alignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsets.only(top: AppMargin.m31),
        decoration: const BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s30),
            bottomLeft: Radius.circular(AppSize.s30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultText(
            header,
            fontSize: fontSize,
            color: ColorManager.white,
          ),
        ),
      );

  Column body(String name, String publish, String deadL,
          [double fontSize = FontSize.s12]) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: AppSize.s50,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            color: ColorManager.grey.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    AppStrings.nameOrder,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    AppStrings.datePublish,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    AppStrings.dateDeadline,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: AppSize.s50,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            decoration: BoxDecoration(
                color: ColorManager.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(240))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s30,
                  ),
                  DefaultText(
                    name,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    publish,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    deadL,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))
                ],
              ),
            ),
          ),
          Container(
            height: AppSize.s50,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            decoration: BoxDecoration(
                color: ColorManager.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(240))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s30,
                  ),
                  DefaultText(
                    name,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    publish,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    deadL,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))
                ],
              ),
            ),
          ),
          Container(
            height: AppSize.s36,
            width: AppSize.s100,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            decoration: BoxDecoration(
                color: ColorManager.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(240))),
            child: Center(child: Text(AppStrings.more_)),
          ),
        ],
      );

  Container _header(String header, [double fontSize = FontSize.s15]) =>
      Container(
        height: AppSize.s40,
        width: AppSize.s90,
        alignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsets.only(top: AppMargin.m31),
        decoration: const BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s30),
          ),
        ),
        child: Center(
          child: DefaultText(
            header,
            fontSize: fontSize,
            color: ColorManager.white,
          ),
        ),
      );

  BlocConsumer _ordersBody([double fontSize = FontSize.s12]) =>
      BlocConsumer<OrderBloc, OrderStates>(
        listener: (context, state) {
          if (state is ClientOrdersLoadedState) {
            clientOrders = state.clientOrders!;
          }
        },
        builder: (context, state) {
          if (state is OrderLoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  "من فضلك الرجاء الانتظار جاري تحميل البيانات",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
              ],
            );
          }
          if (state is OrderFailedLoadedState) {
            return emptyDataSharedWidget();
          } else if (state is ClientOrdersLoadedState) {
            return Column(
              children: [
                Container(
                  height: AppSize.s50,
                  width: double.infinity,
                  alignment: AlignmentDirectional.centerStart,
                  decoration: BoxDecoration(
                    color: ColorManager.grey.withOpacity(.6),
                  ),
                  margin: const EdgeInsets.only(top: AppMargin.m15),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("اسم الطلب" , style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("تاريخ النشر", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("موعد الانتهاء", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                OrderHelper.instance()
                    .getClientAllPublishedOrders(clientOrders!).isEmpty
                    ? Center(
                  child: Text(
                    "لا يوجد بيانات",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: FontConstants.fontFamily,
                      color: Colors.grey[400],
                    ),
                  ),
                )   :  Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: OrderHelper.instance()
              .getClientAllPublishedOrders(clientOrders)
              .length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: AppSize.s50,
                        width: double.infinity,
                        alignment: AlignmentDirectional.centerStart,
                        margin: const EdgeInsets.only(bottom: AppMargin.m31),
                        decoration: BoxDecoration(
                            color: ColorManager.grey.withOpacity(0.4),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(240))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: DefaultText(
                                  OrderHelper.instance()
                                      .getClientAllPublishedOrders(clientOrders)[index].client!.name!,
                                  color: ColorManager.black,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: DefaultText(
                                  OrderHelper.instance()
                                      .getClientAllPublishedOrders(clientOrders)[index]
                                      .assignedToLawyerAt!
                                      .toString(),
                                  fontSize: fontSize,
                                  color: ColorManager.black,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: DefaultText(
                                  OrderHelper.instance()
                                      .getClientAllPublishedOrders(clientOrders)[index].deliveredAt!,
                                  fontSize: fontSize,
                                  color: ColorManager.black,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.exit_to_app)),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      );
  BlocConsumer _inProgressBody([double fontSize = FontSize.s12]) =>
      BlocConsumer<OrderBloc, OrderStates>(
        listener: (context, state) {
          if (state is ClientOrdersLoadedState) {
            clientOrders = state.clientOrders!;
          }
        },
        builder: (context, state) {
          if (state is OrderLoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  "من فضلك الرجاء الانتظار جاري تحميل البيانات",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
              ],
            );
          }
          if (state is OrderFailedLoadedState) {
            return emptyDataSharedWidget();
          } else if (state is ClientOrdersLoadedState) {
            return Column(
              children: [
                Container(
                  height: AppSize.s50,
                  width: double.infinity,
                  alignment: AlignmentDirectional.centerStart,
                  decoration: BoxDecoration(
                    color: ColorManager.grey.withOpacity(.6),
                  ),
                  margin: const EdgeInsets.only(top: AppMargin.m15),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("اسم الطلب" , style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("تاريخ النشر", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("موعد الانتهاء", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                OrderHelper.instance()
                    .getClientAllInProgressOrders(clientOrders!).isEmpty
                    ? Center(
                  child: Text(
                    "لا يوجد بيانات",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: FontConstants.fontFamily,
                      color: Colors.grey[400],
                    ),
                  ),
                )   :  Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: OrderHelper.instance()
                        .getClientAllInProgressOrders(clientOrders!)
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: AppSize.s50,
                        width: double.infinity,
                        alignment: AlignmentDirectional.centerStart,
                        margin: const EdgeInsets.only(bottom: AppMargin.m31),
                        decoration: BoxDecoration(
                            color: ColorManager.grey.withOpacity(0.4),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(240))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: DefaultText(
                                  OrderHelper.instance()
                                      .getClientAllInProgressOrders(clientOrders!)[index].client!.name!,
                                  color: ColorManager.black,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: DefaultText(
                                  OrderHelper.instance()
                                      .getClientAllInProgressOrders(clientOrders!)[index]
                                      .assignedToLawyerAt!
                                      .toString(),
                                  fontSize: fontSize,
                                  color: ColorManager.black,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: DefaultText(
                                  OrderHelper.instance()
                                      .getClientAllInProgressOrders(clientOrders!)[index].deliveredAt!,
                                  fontSize: fontSize,
                                  color: ColorManager.black,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.exit_to_app)),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      );
  BlocConsumer _completedBody([double fontSize = FontSize.s12]) =>
      BlocConsumer<OrderBloc, OrderStates>(
        listener: (context, state) {
          if (state is ClientOrdersLoadedState) {
            clientOrders = state.clientOrders!;
          }
        },
        builder: (context, state) {
          if (state is OrderLoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  "من فضلك الرجاء الانتظار جاري تحميل البيانات",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
              ],
            );
          }
          if (state is OrderFailedLoadedState) {
            return emptyDataSharedWidget();
          } else if (state is ClientOrdersLoadedState) {
            return Column(
              children: [
                Container(
                  height: AppSize.s50,
                  width: double.infinity,
                  alignment: AlignmentDirectional.centerStart,
                  decoration: BoxDecoration(
                    color: ColorManager.grey.withOpacity(.6),
                  ),
                  margin: const EdgeInsets.only(top: AppMargin.m15),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("اسم الطلب" , style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("تاريخ النشر", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("موعد الانتهاء", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                OrderHelper.instance()
                    .getClientAllCompletedOrders(clientOrders).isEmpty
                    ? Center(
                  child: Text(
                    "لا يوجد بيانات",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: FontConstants.fontFamily,
                      color: Colors.grey[400],
                    ),
                  ),
                )   :  Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: OrderHelper.instance()
                        .getClientAllCompletedOrders(clientOrders!)
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: AppSize.s50,
                        width: double.infinity,
                        alignment: AlignmentDirectional.centerStart,
                        margin: const EdgeInsets.only(bottom: AppMargin.m31),
                        decoration: BoxDecoration(
                            color: ColorManager.grey.withOpacity(0.4),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(240))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: DefaultText(
                                  OrderHelper.instance()
                                      .getClientAllCompletedOrders(clientOrders!)[index].client!.name!,
                                  color: ColorManager.black,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: DefaultText(
                                  OrderHelper.instance()
                                      .getClientAllCompletedOrders(clientOrders!)[index]
                                      .assignedToLawyerAt!
                                      .toString(),
                                  fontSize: fontSize,
                                  color: ColorManager.black,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: DefaultText(
                                  OrderHelper.instance()
                                      .getClientAllCompletedOrders(clientOrders!)[index].deliveredAt!,
                                  fontSize: fontSize,
                                  color: ColorManager.black,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.exit_to_app)),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      );
}
