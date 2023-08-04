import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/chat/data/parameter/visa_card_parameter.dart';
import 'package:hokok/chat/presintation/controller/chats_cubit.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/ui_responsive/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFormScreen extends StatefulWidget {
  final int offerId;

  const MyFormScreen({super.key, required this.offerId});

  @override
  _MyFormScreenState createState() => _MyFormScreenState();
}

class _MyFormScreenState extends State<MyFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form field values
  TextEditingController cardName = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardCvc = TextEditingController();
  TextEditingController cardExpiryMonth = TextEditingController();
  TextEditingController cardExpiryYear = TextEditingController();
  void _launchURL(String url) async {
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, do something with the form data
      // For demonstration purposes, we'll just print the values here

      context.read<ChatsCubit>().subscribeToPlan(VisaCardParameter(
          planID: widget.offerId.toString(),
          cardName: cardName.text,
          cardNumber: cardNumber.text,
          cardCvc: cardCvc.text,
          cardExpMonth: cardExpiryMonth.text,
          cardExpYeaar: cardExpiryYear.text));
      print('Name: ${cardName.text}');
      print('number: ${cardNumber.text}');
      print('cvc: ${cardCvc.text}');
      print('month: ${cardExpiryMonth.text}');
      print('year: ${cardExpiryYear.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          elevation: 0,
          title: const Text(
            "enter your visa data",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: BlocListener<ChatsCubit, ChatsState>(
                listener: (context, state) {
                  if (state is SubscribeToPlanSuccessState) {
                    _launchURL(state.paymentGateway);
                  } else if (state is SubscribeToPlanFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('please enter correct data'),
                      duration: Duration(
                          seconds:
                              3), // Optional: Define the duration the Snackbar should be visible
                    ));
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.ph,
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'card name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your card name';
                        }
                        return null;
                      },
                      controller: cardName,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'card number'),
                      keyboardType: TextInputType.number,
                      controller: cardNumber,
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your card number';
                        }
                        // You can add more email validation logic if needed
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'card cvc'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your card cvc';
                        }
                        return null;
                      },
                      controller: cardCvc,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'card expiry month'),
                      controller: cardExpiryMonth,
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your card expiry month';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'card expiry year'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your card expiry year';
                        }
                        return null;
                      },
                      controller: cardExpiryYear,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    30.ph,
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      ColorManager.secondary)),
                          onPressed: _submitForm,
                          child: const Text('Submit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
