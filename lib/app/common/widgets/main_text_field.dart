import 'package:flutter/material.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    required this.onUrlSubmitted,
    required this.onUrlEntered,
    super.key,
  });

  final Function(String?) onUrlEntered;
  final Function(String?) onUrlSubmitted;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: textEditingController,
      onChanged: widget.onUrlEntered,
      onSubmitted: widget.onUrlSubmitted,
      onTapOutside: (PointerDownEvent event) => focusNode.unfocus(),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxWidth:  MediaQuery.sizeOf(context).width * 0.8,
          maxHeight: 60,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
