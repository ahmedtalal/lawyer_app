import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/ui_responsive/sized_box.dart';

class MyFormScreen extends StatefulWidget {
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

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, do something with the form data
      // For demonstration purposes, we'll just print the values here
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                  decoration: const InputDecoration(labelText: 'card number'),
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
                          backgroundColor: MaterialStateProperty.all<Color?>(
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
    );
  }
}
