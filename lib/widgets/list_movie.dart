import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_tv/extensions/context_extension.dart';
import 'package:test_tv/extensions/size_extension.dart';
import 'package:test_tv/extensions/style_extension.dart';
import 'package:test_tv/theme/theme.dart';

import 'focus_base_widget.dart';

class ListTvFocusCard extends StatefulWidget {
  const ListTvFocusCard({
    super.key,
    required this.title,
    required this.itemBuilder,
    required this.itemCount,
    this.height = 300,
    this.clipRadius = 6.0,
    this.borderRadius = 6.0,
    this.itemSpacing = 8.0,
    this.titleTrailing,
    this.onItemTap,
  });
  final String title;
  final Function (BuildContext context, int index,bool isFocus) itemBuilder;
  final int itemCount;
  final double height;
  final double clipRadius;
  final double borderRadius;
  final double itemSpacing;
  final Widget? titleTrailing;
  final Function(int index)? onItemTap;

  @override
  State<ListTvFocusCard> createState() => _ListTvFocusCardState();
}

class _ListTvFocusCardState extends State<ListTvFocusCard>  with TickerProviderStateMixin{
  late final CarouselSliderController carouselController;
  late final AnimationController animationCtl,focusItemAniCtrl;
  late Animation<double> scaleAnimation,glowAnimation;
  final FocusNode listFocusNode = FocusNode();
  final GlobalKey titleKey = GlobalKey();

  int? preFocusIndex;

  @override
  void initState() {
    super.initState();
    carouselController = CarouselSliderController();

    animationCtl = AnimationController(vsync: this,duration: const Duration(milliseconds: 300));
    scaleAnimation = Tween(begin: 18.0,end: 32.0).animate(CurvedAnimation(parent: animationCtl, curve: Curves.easeInOutQuint));

    focusItemAniCtrl = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    glowAnimation = Tween(begin: 0.0,end: 1.0).animate(focusItemAniCtrl);

    listFocusNode.addListener(_listFocusListener);
    focusItemAniCtrl.addStatusListener(_itemFocusListener);
  }

  @override
  void dispose() {
    animationCtl..stop()..dispose();
    focusItemAniCtrl..stop()..dispose();
    listFocusNode..removeListener(_listFocusListener)..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: listFocusNode,
      canRequestFocus: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                    animation: scaleAnimation,
                    builder: (context, animation) {
                      return Text(
                        key: titleKey,
                        widget.title,
                        style:  context.textTheme.titleSmall?.semiBold.copyWith(
                          fontSize: scaleAnimation.value,
                          color: context.colors.onBackground,
                        ),
                      );
                    },
                  ),
                ),
                //if(kIS_TV && widget.titleTrailing != null) widget.titleTrailing!
              ],
            ),
            CarouselSlider.builder(
              carouselController: carouselController,
              itemBuilder: (context,index,realIndex){
                return FocusBaseWidget(
                  onPressed: () => widget.onItemTap?.call(index),
                  scaleOnFocus: true,
                  onFocus: (isFocus){
                    if(isFocus.hasFocus){
                      preFocusIndex = index;
                      if(preFocusIndex == null) return;
                      if( index <= preFocusIndex!){
                        carouselController.animateToPage(max(0,index-1));
                        return;
                      }
                      if(index > preFocusIndex!){
                        carouselController.animateToPage(min(index+1,widget.itemCount));
                      }

                    }
                  },
                  builder: (isFocus) => AnimatedBuilder(
                    animation: glowAnimation,
                    builder: (context, child) {
                      return Container(
                        margin: EdgeInsets.only(left: index == 0 ? 0 : widget.itemSpacing),
                        decoration: BoxDecoration(
                            borderRadius: widget.borderRadius.radius,
                            border: isFocus
                                ? Border.all(width: 3, color: CustomTheme.whiteColor.withOpacity(glowAnimation.value))
                                : null,
                            boxShadow: [
                              if (isFocus) ...[
                                BoxShadow(
                                  color: CustomTheme.primaryColor,
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                ),
                              ],
                            ]),
                        //margin: EdgeInsets.symmetric(vertical: isFocus ? 20 : 0),
                        child: ClipRRect(
                          borderRadius: (widget.clipRadius).radius,
                          child: child,
                        ),
                      );
                    },
                    child: widget.itemBuilder(context,index,isFocus),
                  ),
                );
              },
              itemCount: widget.itemCount,
              options: CarouselOptions(
                initialPage: 0,
                height: widget.height,
                viewportFraction: .18,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                enableInfiniteScroll: false,
                padEnds: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listFocusListener() {
    if (listFocusNode.hasFocus) {
      animationCtl.forward();
      focusItemAniCtrl.forward();
      Scrollable.ensureVisible(titleKey.currentContext!);
      carouselController.animateToPage(0);
    } else {
      animationCtl.reverse();
      focusItemAniCtrl
        ..stop()
        ..reset();
      preFocusIndex = null;
    }
  }

  void _itemFocusListener(AnimationStatus status) {
    if(status == AnimationStatus.completed){
      focusItemAniCtrl.reverse();
    } else if (status == AnimationStatus.dismissed){
      focusItemAniCtrl.forward();
    }
  }
}
