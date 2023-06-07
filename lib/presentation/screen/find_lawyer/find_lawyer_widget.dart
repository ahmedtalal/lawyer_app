import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/text.dart';
import 'package:hokok/core/values_manager.dart';
import 'package:hokok/domain/entities/lawyer_entity.dart';
import 'package:hokok/presentation/screen/comments/add_hint.dart';
import 'package:hokok/presentation/screen/welcome/welcome_screen.dart';

import '../orders/private_order/private_order.dart';

class FindLawyerView extends StatelessWidget {
  const FindLawyerView({required this.lawyerAttributes, super.key});
  final LawyerAttributes lawyerAttributes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHandler.getScreenWidth(context),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 60,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2.5),
              ),
              child: CachedNetworkImage(
                height: 35,
                width: 35,
                fit: BoxFit.cover,
                imageUrl: lawyerAttributes.personalImage!,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Image(
                  image: AssetImage(AssetsManager.lawyerImg),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(lawyerAttributes.name!, fontSize: AppSize.s21_4),
                const SizedBox(
                  height: 7,
                ),
                RatingBar.builder
                  (
                  itemSize: 14,
                  initialRating: lawyerAttributes.ratesNum!.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    printInfo(rating);
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                 DefaultText(lawyerAttributes.about.toString(),
                    fontSize: 11),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 130,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ConstantColor.secondaryColor,
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.profileRoute);
                      },
                      child: const DefaultText(
                        'زيارة البروفيل',
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(10),
              ),
              color: ConstantColor.primaryColor,
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.person,
                ),
                DefaultText("وكلني", fontSize: 10, color: Colors.white),
              ],
            ),
          ),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10),
              ),
              color: Colors.black,
            ),
            child: PopupMenuButton<int>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
              ),
              color: ColorManager.primary,
              onSelected: (item) => onSelected(context, item , lawyerAttributes),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(Icons.insert_invitation),
                      SizedBox(width: 8),
                      Text('دعوه للعمل لعي قضيه'),
                    ],
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(width: 8),
                      Text('اضف الي المفضله'),
                    ],
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.message),
                      SizedBox(width: 8),
                      Text('ترك ملاحظه'),
                    ],
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 3,
                  child: Row(
                    children: [
                      Icon(Icons.flag),
                      SizedBox(width: 8),
                      Text('بلاغ عن اساءه'),
                    ],
                  ),
                ),
              ],
              child: const Icon(Icons.arrow_downward, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void onSelected(BuildContext context, int item , LawyerAttributes lawerAttributes) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  PrivateOrderScreen(lawerAttributes:lawerAttributes ),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  AddCommentScreen(hint: true  ,lawerAttributes: lawerAttributes),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>   AddCommentScreen(hint: false ,lawerAttributes: lawerAttributes),
          ),
        );
    }
  }
}
