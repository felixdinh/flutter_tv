import 'package:flutter/material.dart';

class FocusBaseWidget extends StatefulWidget {
  final FocusNode? focus;
  final Function() onPressed;
  final Function(FocusNode)? onFocus;
  final Widget Function(bool isFocus)? builder;
  final Function(KeyEvent)? onKeyEvent;
  final bool autoFocus;
  final EdgeInsets? padding;

  const FocusBaseWidget({
    super.key,
    this.focus,
    required this.onPressed,
    this.builder,
    this.onFocus,
    this.onKeyEvent,
    this.autoFocus = false,
    this.padding,
  });

  @override
  State<FocusBaseWidget> createState() => _FocusBaseWidgetState();
}

class _FocusBaseWidgetState extends State<FocusBaseWidget> {
  late final FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    focusNode = widget.focus ?? FocusNode();
    focusNode.addListener(_focusListener);
  }

  @override
  void dispose() {
    focusNode.removeListener(_focusListener);
    focusNode.dispose();
    super.dispose();
  }


  _focusListener(){
    setState(() {
      widget.onFocus?.call(focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: focusNode.hasFocus ? 1.0 : 0.8,
      child: Focus(
        focusNode: focusNode,
        autofocus: widget.autoFocus,
        //onKeyEvent: widget.onKeyEvent,
        child: GestureDetector(
          onTap: (){
            focusNode.requestFocus();
          },
          child: widget.builder?.call(focusNode.hasFocus) ?? placeHolder(),
        ),
      ),
    );
  }

  Widget placeHolder() => Container(
    height: 200,
    width: 150,
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: focusNode.hasFocus ?  1 : 0,color: Colors.white),
    ),
    child: const Center(
      child: Text("Place holder Card",style: TextStyle(color: Colors.white)),
    ),
  );
}