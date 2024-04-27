import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/constant/colors.dart';


typedef RecordClicked<T> = void Function(T record);

mixin RecordShowDialog<T> {
  void showLoadingDialog(
    BuildContext context,
    String title,
    String content, {
    T? model,
    RecordClicked<T?>? onConfirm,
    String confirmText = "Ok",
    String cancelText = "No",
  }) async {
   
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(); // Close the dialog
        });
          return AlertDialog(
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            title: Text(
              title,
              textAlign: TextAlign.center,
              // style: textTheme.headlineMedium
              //     ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 SpinKitDoubleBounce(color: ResColors.primary),
               // ResVerticalGap.gap03,
                Text(
                  content,
                  textAlign: TextAlign.center,
                  // style: textTheme.bodyLarge?.copyWith(
                  //   fontSize: 16
                  // ),
                ),
               
                // CustomGradientButton(
                //   text: confirmText,
                //   onPressed: () => Navigator.pop(ctx, true),
                // ),
             
                // TextButton(
                //   onPressed: () => Navigator.pop(ctx, false),
                //   child: Text(
                //     cancelText,
                //     style: textTheme.labelLarge?.copyWith(),
                //   ),
                // ),
              ],
            ),
          );
        }).then((exit) {
      if (exit == null) return;

      if (exit) {
        onConfirm?.call(model);
      } else {
        // user pressed No button
      }
    });
  }
}
