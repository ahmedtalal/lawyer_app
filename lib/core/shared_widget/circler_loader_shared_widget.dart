import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hokok/core/font_manager.dart';

FutureOr showCircleLoaderWidget(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 5,
              ),
              Text(
                "من فضلك الرجاء الانتظار",
                style: TextStyle(
                  fontFamily: FontConstants.fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
