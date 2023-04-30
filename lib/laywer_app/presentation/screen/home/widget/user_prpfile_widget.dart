import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hokok/core/font_manager.dart';

import '../../../../../core/assets_manager.dart';
import '../../../../../core/color_manager.dart';
import '../../../../../core/values_manager.dart';
import '../../../../../domain/entities/user_entity.dart';

class UserPorfileWidget extends StatelessWidget {
  const UserPorfileWidget({
    required this.state,
    super.key,
  });
  final UserEntity? state;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: AppSize.s90,
          width: AppSize.s116,
          margin: const EdgeInsets.only(top: AppMargin.m15),
          padding: const EdgeInsets.all(AppPadding.p10),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.grey, width: 0.5),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: CachedNetworkImage(
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              imageUrl: state == null
                  ? AssetsManager.lawyerImg
                  : state!.userModel!.personalImage!.toString(),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Image(
                image: AssetImage(AssetsManager.lawyerImg),
              ),
            ),
          ),
          //clipBehavior: Clip.antiAliasWithSaveLayer,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          state == null ? "UnKnown" : state!.userModel!.name!,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: FontConstants.fontFamily,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 15,
              color: Colors.black87,
            ),
            Text(
              state == null ? "UnKnown" : state!.userModel!.city!,
              style: const TextStyle(
                fontFamily: FontConstants.fontFamily,
                fontSize: 12,
              ),
            )
          ],
        ),
      ],
    );
  }
}
