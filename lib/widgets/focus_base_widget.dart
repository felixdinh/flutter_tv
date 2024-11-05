import 'package:flutter/material.dart';
import 'package:test_tv/utils/common_func.dart';

class FocusBaseWidget extends StatefulWidget {
  final Function()? onPressed;
  final Function(FocusNode)? onFocus;
  final Widget Function(bool isFocus)? builder;
  final bool autoFocus;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final bool scaleOnFocus;
  final bool enable;
  final String? label;

  const FocusBaseWidget({
    super.key,
    this.onPressed,
    this.builder,
    this.onFocus,
    this.focusNode,
    this.autoFocus = false,
    this.padding,
    this.scaleOnFocus = false,
    this.enable = true,
    this.label,
  });

  @override
  State<FocusBaseWidget> createState() => _FocusBaseWidgetState();
}

class _FocusBaseWidgetState extends State<FocusBaseWidget> {
  late FocusNode focusNode;
  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode(debugLabel: widget.label == null? null : 'focus_node_${widget.label}');
    focusNode.addListener(_focusListener);
    super.initState();
  }

  _focusListener() {
    if (!mounted) return;
    setState(() {
      widget.onFocus?.call(focusNode);
    });
  }

  double get scaleValue {
    if (widget.scaleOnFocus) {
      return focusNode.hasFocus ? 1 : .93;
    }
    return 1.0;
  }

  @override
  void dispose() {
    if(!mounted) return;
    focusNode.removeListener(_focusListener);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: scaleValue,
        child: Focus(
          focusNode: focusNode,
          autofocus: widget.autoFocus,
          onKeyEvent: (focus,event) {
            return onTvSelect(event,context, (context) => widget.onPressed?.call());
          } ,
          child: RawMaterialButton(
              onPressed: (){
                widget.onPressed?.call();
                FocusScope.of(context).requestFocus(focusNode);
              },
              child: widget.builder?.call(focusNode.hasFocus) ?? placeHolder()),
        )
    );
  }

  Widget placeHolder() => Container(
    height: 200,
    width: 150,
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: focusNode.hasFocus ? 1 : 0, color: Colors.white),
    ),
    child: const Center(
      child: Text("Place holder Card", style: TextStyle(color: Colors.white)),
    ),
  );
}
