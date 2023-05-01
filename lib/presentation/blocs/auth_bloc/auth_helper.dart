// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/data/models/user_model.dart';
import 'package:hokok/data/repositories/auth_api_repository.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/laywer_app/presentation/screen/home/widget/main_screen.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_events.dart';
import 'package:hokok/presentation/screen/intro/splash_screen.dart';
import 'package:hokok/presentation/screen/layout/layout_screen.dart';
import 'package:image_picker/image_picker.dart';

class AuthHelper {
  static AuthHelper? _authHelper;
  AuthHelper._internal();
  static AuthHelper instance() {
    if (_authHelper == null) {
      return _authHelper = AuthHelper._internal();
    }

    return _authHelper!;
  }

  String optNumber = '';
  String phoneNumber = '';
  String type = "";
  String name = "";
  String email = "";
  String zone = "";
  String? city;
  List majors = [];
  String? majorValue;
  int? id;
  String? token;
  String? about = "";
  int? status;
  File? personalImage;
  String? createdAt = "";
  int? lawyerId;
  File? licenseImg;
  int? idNumber;
  String? idExpireDate = "";
  List<String> cities = [
    " الرياض",
    "جده",
    "المدينه المنوره",
    "تبوك",
    "الدمام",
    "الاحساء",
    "القطيف",
    "خميس مشيط",
    "المظيلف",
    "الهفوف",
    "المبرز",
    "الطائف",
    "نجران",
    "حفر الباطن",
    "الجبيل",
    "ضباء",
    "الخرج",
    "الثقبة",
    "ينبع البحر",
    "الخبر",
    "عرعر",
    "الحوية",
    "عنيزه",
    "سكاكا",
    "جيزان",
    "القريات",
    "الظهران",
    "الباحة",
    "الزلفي",
    "الرس",
    "وادى الدواسر",
    "بيشه",
    "سيهات",
    "شروره",
    "بحره",
    "تاروت",
    "الدوادمى",
    "صبياء",
    "بيش",
    "احد رفيدة",
    "الفريش",
    "بارق",
    "الحوطه",
    "الافلاج",
  ];

  Future<String> selectImageFromGallery() async {
    String path = "";
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      path = image.path;
    }
    return path;
  }

  UserModelInfo prepareLawyerInfo() => UserModelInfo(
        type: type,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        zone: zone,
        city: city ?? cities[0],
        majors: [int.parse(majorValue!)],
        personalImage: personalImage ?? "",
        licenseImg: licenseImg ?? "",
      );
  Future<FormData> lawyerToFormData() async {
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'type': type,
      'zone': zone,
      'city': city ?? cities[0],
      'personal_image': await MultipartFile.fromFile(personalImage!.path,
          filename: personalImage!.path.split('/').last),
      'license_img': await MultipartFile.fromFile(licenseImg!.path,
          filename: licenseImg!.path.split('/').last),
      "majors[]": majors,
    });
    return formData;
  }

  UserModelInfo prepareClientInfo() => UserModelInfo(
        id: id,
        token: token,
        type: type,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        zone: zone,
        city: city,
        status: status,
        createdAt: createdAt,
        personalImage: personalImage,
      );

  onSendOptCodeAction(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().add(AuthSendOptEvent());
    }
  }

  onCreateUserAccount(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().add(CreateUserAccountEvent());
    }
  }

  onCreateLawyerAccount(BuildContext context, GlobalKey<FormState> key) async {
    // final model = await lawyerToFormData();
    // printInfo("the laywer model is => ${model.fields.asMap()}");
    if (key.currentState!.validate() &&
        personalImage!.path.isNotEmpty &&
        licenseImg!.path.isNotEmpty) {
      context.read<AuthBloc>().add(CreateLawyerAccountEvent());
    }
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(
        context,
        "الرجاء ادخال جميع البيانات من صور وبيانات المستخدم لكي تتم العمليه بنجاح",
        Colors.red,
      ),
    );
  }

  onLoginAction(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().add(AuthLoginUsingPhoneEvent());
    }
  }

  Widget checkUserIsLoginActtion() {
    return UseCaseProvider.instance()
            .creator<AuthApiRepository>(AuthApiRepository.instance())
            .checkUserIsLogined()
        ? UserInfoLocalService.instance().getUserToken().userType == "client"
            ? const LayoutScreen()
            : const LawyerHomeScreen()
        : const SplashScreen();
  }

  onLogOutAction(BuildContext context) {
    context.read<AuthBloc>().add(LogOutEvent());
  }
}
