import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/functions.dart';
import 'package:hokok/presentation/blocs/comment_bloc/comment_bloc.dart';

import '../../../core/shared_widget/show_snackbar_shared_widget.dart';
import '../../../domain/entities/lawyer_entity.dart';
import '../../blocs/comment_bloc/comment_helper.dart';
import '../../blocs/comment_bloc/comment_states.dart';
import '../layout/layout_screen.dart';
import '../main/main_screen.dart';

class AddCommentScreen extends StatefulWidget {
  final LawyerAttributes lawerAttributes;
  final bool hint;
  const AddCommentScreen({
    Key? key,
    required this.hint,
    required this.lawerAttributes,
  }) : super(key: key);

  @override
  State<AddCommentScreen> createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  @override
  void initState() {
    CommentHelper.instance().userId = widget.lawerAttributes.id;
    CommentHelper.instance().type = widget.hint ? 'hint' : 'report';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.primary,
          centerTitle: true,
          title: Text(widget.hint ? "تقديم ملاحظة" : "تقديم بلاغ")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocListener<CommentBloc, CommentStates>(
          listener: (context, state) {
            if(state is CommentSuccessState){
              ScaffoldMessenger.of(context).showSnackBar(
                showSnakBarWidget(
                  context,
                  widget.hint?  "تم إرسال ملاحظتك بنجاح": "تم إرسال بلاغك بنجاح",
                  Colors.green,
                ),

              );
              Future.delayed(const Duration(seconds: 1), () {
                // Navigate to the next screen after a delay of 1 second
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LayoutScreen()));
              });
              CommentHelper.instance()
                  .hintTextEditingController
                  .clear();
                  CommentHelper.instance()
                  .reportTextEditingController
                  .clear();
            }
          },
          child: Column(
            children: [
              const SizedBox(height: 30),
               Stack(
                children: [
                  CircleAvatar(radius: 40, backgroundImage:NetworkImage(widget.lawerAttributes.personalImage!) ),
                  const CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 10,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 400,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      border: Border.all(
                        color: ColorManager.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          CommentHelper.instance().description = widget.hint
                              ? CommentHelper.instance()
                                  .hintTextEditingController
                                  .text
                              : CommentHelper.instance()
                                  .reportTextEditingController
                                  .text;
                        });
                      },
                      controller: widget.hint
                          ? CommentHelper.instance().hintTextEditingController
                          : CommentHelper.instance()
                              .reportTextEditingController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 20),
                        hintText:
                            widget.hint ? "أضف ملاحظتك هنا" : "أضف بلاغك هنا",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorManager.secondary), // Set the background color here
                ),
                onPressed: () {
                  CommentHelper.instance().addCommentAction(context);
                },
                child: const Text(
                  "حفظ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
