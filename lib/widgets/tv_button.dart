import 'package:flutter/material.dart';
import 'package:test_tv/utils/common_func.dart';


class TvButton extends StatelessWidget {
  final Widget? child;
  final Function(BuildContext context)? onPressed;
  final Color? focusedColor;
  final Color? unfocusedColor;
  final double? borderRadius;
  final bool? autofocus;
  final Function(bool focus)? onFocusChanged;
  final Widget Function(BuildContext context, bool hasFocus)? builder;
  final EdgeInsets? padding;
  final bool childFocusable;
  final bool childTravelsal;
  final Alignment? alignment;
  final bool isScale;
  const TvButton(
      {super.key,
        this.child,
        this.onPressed,
        this.focusedColor,
        this.unfocusedColor,
        this.borderRadius,
        this.autofocus,
        this.onFocusChanged,
        this.builder,
        this.padding,
        this.childFocusable = true,
        this.childTravelsal = true,
        this.alignment,
        this.isScale = false,
      });

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Focus(
      autofocus: autofocus ?? false,
      onFocusChange: onFocusChanged,
      descendantsAreFocusable: childFocusable,
      descendantsAreTraversable: childTravelsal,
      onKeyEvent: (node, event) => onPressed != null
          ? onTvSelect(event, context, onPressed!)
          : KeyEventResult.ignored,
      child: Builder(
        builder: (ctx) {
          bool hasFocus = Focus.of(ctx).hasFocus;
          return Transform.scale(
            scale: _onFocusScale(hasFocus),
            child: GestureDetector(
              onTap: onPressed != null ?
                  () => onPressed?.call(context) : null,
              child: Align(
                alignment: alignment ?? Alignment.centerLeft,
                child: AnimatedContainer(
                  padding: padding ?? EdgeInsets.zero,
                  duration: TreeSliver.defaultAnimationDuration,
                  decoration: BoxDecoration(
                    color: hasFocus
                        ? focusedColor ??
                        (brightness == Brightness.dark
                            ? colors.primaryContainer
                            : colors.primary)
                        : unfocusedColor ?? colors.secondaryContainer,
                    borderRadius: BorderRadius.circular(borderRadius ?? 2000),
                  ),
                  child: builder?.call(ctx, hasFocus ) ?? child ?? SizedBox(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double _onFocusScale(bool hasFocus) {
    if(hasFocus && isScale){
      return 1;
    }
    return .93;
  }
}
