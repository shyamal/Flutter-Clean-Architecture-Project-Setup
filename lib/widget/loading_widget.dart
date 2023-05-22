import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingBuilder {
  LoadingBuilder(this.context);

  final BuildContext context;

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              insetPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.3, vertical: Get.width * 0.3),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              backgroundColor: Colors.white,
              content: const LoadingIndicator(),
            )
        );
      },
    );
  }

  void hideLoading() {
    Navigator.of(context).pop();
  }
}

class LoadingIndicator extends StatelessWidget{
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {

    return Builder(
        builder: (context) {
          return Container(
              width: 50,
              height: 70,
              padding: const EdgeInsets.all(2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getLoadingIndicator(),
                    _getHeading(context),
                  ]
              )
          );
        }
    );
  }

  Padding _getLoadingIndicator() {
    return const Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
                strokeWidth: 3
            )
        )
    );
  }

  Widget _getHeading(context) {
    return
      Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            'loading'.tr,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16
            ),
            textAlign: TextAlign.center,
          )
      );
  }

}