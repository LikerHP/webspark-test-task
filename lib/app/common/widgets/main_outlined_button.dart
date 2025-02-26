import 'package:flutter/material.dart';
import 'package:webspark_test_task/app/common/widgets/main_progress_indicator.dart';

class MainOutlinedButton extends StatelessWidget {
  const MainOutlinedButton({
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.isActive = true,
    super.key,
  });

  final bool isActive;
  final bool isLoading;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if (isActive) {
          onPressed.call();
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isActive ? Colors.lightBlueAccent : Colors.grey.shade500,
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: Colors.indigoAccent.shade100, width: 2),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        maximumSize: WidgetStatePropertyAll(
          Size(MediaQuery.sizeOf(context).width, 64),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(MediaQuery.sizeOf(context).width, 64),
        ),
      ),
      child:
          isLoading
              ? MainProgressIndicator(size: Size(30, 30))
              : Text(
                buttonText,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
    );
  }
}
