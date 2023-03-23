import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/shared_widget/text.dart';
import 'package:hokok/core/values_manager.dart';
import '../../../core/assets_manager.dart';
import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../core/strings_manager.dart';
import '../welcome/welcome_screen.dart';

class FindLawyerScreen extends StatelessWidget {
  const FindLawyerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Container(
                height: AppSize.s40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s15),
                  border: Border.all(
                    width: AppSize.s1,
                    color: ColorManager.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppPadding.p2,
                        right: AppPadding.p10,
                      ),
                      child: SvgPicture.asset(
                        AssetsManager.searchIcon,
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(fontSize: FontSize.s13),
                        decoration: const InputDecoration(
                          hintText: AppStrings.findLawyer,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p5,
                            vertical: AppPadding.p10,
                          ),
                          hintStyle: TextStyle(fontSize: FontSize.s13),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s35,
                    backgroundColor: ConstantColor.secondaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultText("فيصل", fontSize: AppSize.s21_4),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star,
                          size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const DefaultText("مرحبا بكام انا فيصل حاصل علر.....",
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
                    child: Row(
                      children: const [
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
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.insert_invitation),
                              SizedBox(width: 8),
                              Text('دعوه للعمل لعي قضيه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: const [
                              Icon(Icons.favorite),
                              SizedBox(width: 8),
                              Text('اضف الي المفضله'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.message),
                              SizedBox(width: 8),
                              Text('ترك ملاحظه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.flag),
                              SizedBox(width: 8),
                              Text('بلاغ عن اساءه'),
                            ],
                          ),
                        ),
                      ],
                      child:
                          const Icon(Icons.arrow_downward, color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s35,
                    backgroundColor: ConstantColor.secondaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultText("فيصل", fontSize: AppSize.s21_4),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const DefaultText("مرحبا بكام انا فيصل حاصل علر.....",
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
                              //go to profile
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
                    child: Row(
                      children: const [
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
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.insert_invitation),
                              SizedBox(width: 8),
                              Text('دعوه للعمل لعي قضيه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: const [
                              Icon(Icons.favorite),
                              SizedBox(width: 8),
                              Text('اضف الي المفضله'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.message),
                              SizedBox(width: 8),
                              Text('ترك ملاحظه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.flag),
                              SizedBox(width: 8),
                              Text('بلاغ عن اساءه'),
                            ],
                          ),
                        ),
                      ],
                      child:
                      const Icon(Icons.arrow_downward, color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s35,
                    backgroundColor: ConstantColor.secondaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultText("فيصل", fontSize: AppSize.s21_4),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const DefaultText("مرحبا بكام انا فيصل حاصل علر.....",
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
                              //go to profile
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
                    child: Row(
                      children: const [
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
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.insert_invitation),
                              SizedBox(width: 8),
                              Text('دعوه للعمل لعي قضيه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: const [
                              Icon(Icons.favorite),
                              SizedBox(width: 8),
                              Text('اضف الي المفضله'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.message),
                              SizedBox(width: 8),
                              Text('ترك ملاحظه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.flag),
                              SizedBox(width: 8),
                              Text('بلاغ عن اساءه'),
                            ],
                          ),
                        ),
                      ],
                      child:
                      const Icon(Icons.arrow_downward, color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s35,
                    backgroundColor: ConstantColor.secondaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultText("فيصل", fontSize: AppSize.s21_4),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const DefaultText("مرحبا بكام انا فيصل حاصل علر.....",
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
                              //go to profile
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
                    child: Row(
                      children: const [
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
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.insert_invitation),
                              SizedBox(width: 8),
                              Text('دعوه للعمل لعي قضيه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: const [
                              Icon(Icons.favorite),
                              SizedBox(width: 8),
                              Text('اضف الي المفضله'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.message),
                              SizedBox(width: 8),
                              Text('ترك ملاحظه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.flag),
                              SizedBox(width: 8),
                              Text('بلاغ عن اساءه'),
                            ],
                          ),
                        ),
                      ],
                      child:
                      const Icon(Icons.arrow_downward, color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s35,
                    backgroundColor: ConstantColor.secondaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultText("فيصل", fontSize: AppSize.s21_4),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const DefaultText("مرحبا بكام انا فيصل حاصل علر.....",
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
                              //go to profile
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
                    child: Row(
                      children: const [
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
                      onSelected: (item) => onSelected(context, item),
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.insert_invitation),
                              SizedBox(width: 8),
                              Text('دعوه للعمل لعي قضيه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: const [
                              Icon(Icons.favorite),
                              SizedBox(width: 8),
                              Text('اضف الي المفضله'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.message),
                              SizedBox(width: 8),
                              Text('ترك ملاحظه'),
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.flag),
                              SizedBox(width: 8),
                              Text('بلاغ عن اساءه'),
                            ],
                          ),
                        ),
                      ],
                      child:
                      const Icon(Icons.arrow_downward, color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
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
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
          (route) => false,
        );
        break;
      case 3:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
          (route) => false,
        );
    }
  }
}
