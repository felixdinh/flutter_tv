import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'focus_base_widget.dart';

class ListTVCard extends StatefulWidget {
  const ListTVCard({
    super.key,
    required this.title,
    required this.itemBuilder,
    required this.itemCount,
    this.height = 300,
  });
  final String title;
  final Function (BuildContext context, int index,bool isFocus) itemBuilder;
  final int itemCount;
  final double height;

  @override
  State<ListTVCard> createState() => _ListTVCardState();
}

class _ListTVCardState extends State<ListTVCard>  with TickerProviderStateMixin{
  late final CarouselSliderController carouselController;
  late final AnimationController animationCtl,focusItemAniCtrl;
  late Animation<double> scaleAnimation,glowAnimation;
  final FocusNode listFocusNode = FocusNode();
  final GlobalKey titleKey = GlobalKey();

  FocusNode? currentFocus;

  @override
  void initState() {
    super.initState();
    carouselController = CarouselSliderController();

    animationCtl = AnimationController(vsync: this,duration: const Duration(milliseconds: 300));
    scaleAnimation = Tween(begin: 18.0,end: 32.0).animate(CurvedAnimation(parent: animationCtl, curve: Curves.easeInOutQuint));

    focusItemAniCtrl = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    glowAnimation = Tween(begin: 2.0,end: 15.0).animate(focusItemAniCtrl);

    listFocusNode.addListener(_listFocusListener);
    focusItemAniCtrl.addStatusListener(_itemFocusListener);
  }

  @override
  void dispose() {
    animationCtl.dispose();
    focusItemAniCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      focusNode: listFocusNode,
      enabled: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedBuilder(
                animation: scaleAnimation,
                builder: (context, animation) {
                return Text(
                  key: titleKey,
                  widget.title,
                  style: TextStyle(fontSize: scaleAnimation.value, fontWeight: FontWeight.w700),
                );
              },
            ),
            CarouselSlider.builder(
              carouselController: carouselController,
              itemBuilder: (context,index,realIndex){
                return FocusBaseWidget(
                  autoFocus: index == 0,
                  onPressed: () {},
                  // onKeyEvent: (event) async {
                  //   switch(event.logicalKey){
                  //     case LogicalKeyboardKey.arrowLeft:
                  //       await carouselController.previousPage();
                  //     case LogicalKeyboardKey.arrowRight:
                  //       await carouselController.nextPage();
                  //   }
                  // },
                  onFocus: (focusNode) {
                   currentFocus = focusNode;
                  },
                  builder: (isFocus) => AnimatedBuilder(
                    animation: glowAnimation,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: isFocus
                                ? Border.all(width: 3, color: Colors.red)
                                : null,
                            boxShadow: [
                              if (isFocus) ...[
                                 BoxShadow(
                                  color: Colors.red,
                                  spreadRadius: glowAnimation.value - 10,
                                  blurRadius: glowAnimation.value,
                                ),
                              ],
                            ]),
                        clipBehavior: Clip.none,
                        margin: EdgeInsets.symmetric(vertical: isFocus ? 10 : 0),
                        child: child,
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
                viewportFraction: 0.15,
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
      if(listFocusNode.hasFocus){
        animationCtl.forward();
        focusItemAniCtrl.forward();
        Scrollable.ensureVisible(titleKey.currentContext!);
        if(currentFocus != null){
          FocusScope.of(context).requestFocus(currentFocus);
        } else {
          carouselController.animateToPage(0);
        }
      }
      else {
        animationCtl.reverse();
        focusItemAniCtrl..stop()..reset();

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
