import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/shared_widget/button.dart';
import 'package:hokok/presentation/blocs/subscriptions_bloc/subscriptions_helper.dart';
import 'package:hokok/presentation/blocs/subscriptions_bloc/subscriptions_states.dart';

import '../../../core/assets_manager.dart';
import '../../blocs/subscriptions_bloc/subscriptions_bloc.dart';
import 'component/lawyer_offer_card.dart';

/// plans screen by essa
class PlansScreen extends StatefulWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  void initState() {
    SubscriptionHelper.instnace().onGetAllPlansAction(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          color: ColorManager.primary,
          height: 150.h,
          child: Row(children: [
            const Spacer(),
            Image(
              image: const AssetImage(
                AssetsManager.logo,
              ),
              width: 200.w,
              fit: BoxFit.cover,
            ),
            const DefaultBackButton(),
          ]),
        ),
        const Text("عروض vip"),
        const Text("يتم زيادة أسعار العروض سنويا بنسبة 15%"),
        Expanded(
          child: BlocConsumer<SubscriptionsBloc, SubscriptionsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return state is PlansLoadedState? ListView.builder(
                itemBuilder: (context, index) {
                  return  LawyerOfferCard(
                    offerId: state.plans[index].id!,
                    description: state.plans[index].description ??"",
                    offerName: state.plans[index].name ??"",
                    period: state.plans[index].period.toString() ??"",
                    price: state.plans[index].price.toString() ??"",
                  );
                },
                itemCount: state.plans.length,
              ) : Center( child: CircularProgressIndicator(),);
            },
          ),
        )
      ]),
    );
  }
}
