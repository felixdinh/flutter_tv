
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:test_tv/extensions/context_extension.dart';
import 'package:test_tv/extensions/size_extension.dart';

class SelectListPage extends StatefulWidget {
  const SelectListPage({super.key, required this.title});

  final String title;

  @override
  State<SelectListPage> createState() => _SelectListPageState();
}

class _SelectListPageState extends State<SelectListPage> {
  final _key = GlobalKey<ScaffoldState>();
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  int? selectedIndex;
  int? onFocusIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: MultiListView(
        children: [
          FocusList(
            tag: 'list 1',
            autoFocus: true,
          ),
          12.vBox,
          FocusList(
            tag: 'list 2',
          ),
          12.vBox,
          FocusList(
            tag: 'list 3',
          ),
          12.vBox,
          FocusList(
            tag: 'list 4',
          ),
        ],
      ),
    );
  }
}

class FocusList extends StatefulWidget {

  const FocusList({super.key, required this.tag,
    this.itemCount = 10,
    this.autoFocus = false,
  });

  final int itemCount;
  final bool autoFocus;
  final String tag;

  @override
  State<FocusList> createState() => _FocusListState();
}

class _FocusListState extends State<FocusList> {
  late final autoScrollCtrl = AutoScrollController(
    axis: Axis.horizontal,
  );
  late final scopeNode = FocusScopeNode(debugLabel: 'list-${widget.tag}');
  late final List<FocusNode> itemNodeList = List.generate(widget.itemCount, (_)=> FocusNode());

  FocusNode? currNodeFocused;

  @override
  void initState() {
    super.initState();
    if(widget.autoFocus){
      WidgetsBinding.instance.addPostFrameCallback((_){
        currNodeFocused = scopeNode.children.firstOrNull;
        scopeNode.requestFocus(currNodeFocused);
        setState(() {

        });
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: scopeNode,
      autofocus: widget.autoFocus,
      onFocusChange: (isFocus){
        print("list ${scopeNode.debugLabel} => $isFocus");
        print("currFocus ${scopeNode.debugLabel} ${currNodeFocused}");
       if(isFocus && currNodeFocused == null){
         autoScrollCtrl.jumpTo(0);
         scopeNode.requestFocus(itemNodeList[0]);
         return;

       }
       if(isFocus && currNodeFocused != null){
         scopeNode.requestFocus(currNodeFocused);
       }
      },
      onKeyEvent: (node,event) {
        print("nearest scope: ${scopeNode.nearestScope.debugLabel}");
        print("enclosingScope scope: ${scopeNode.enclosingScope?.debugLabel}");
        print("Focus child :${scopeNode.focusedChild}");
        if(scopeNode.hasFocus && event is KeyUpEvent){
          if(!scopeNode.hasFocus) return KeyEventResult.ignored;
          switch(event.logicalKey){
            case LogicalKeyboardKey.arrowDown:
                scopeNode.focusInDirection(TraversalDirection.down);
                FocusScope.of(scopeNode.context!).nextFocus();
            case LogicalKeyboardKey.arrowUp:
              print("currFocus: $currNodeFocused");

              scopeNode.focusInDirection(TraversalDirection.up);
              FocusScope.of(scopeNode.context!).previousFocus();
          }

          return KeyEventResult.handled;
        }


        return KeyEventResult.ignored;
      },
      child: SizedBox(
        height: 200,
        child: ListView.builder(
            controller: autoScrollCtrl,
            scrollDirection: Axis.horizontal,
            itemCount: widget.itemCount,
            itemBuilder: (context, index) {
              final focusItem = itemNodeList[index];
              return  AutoScrollTag(
                controller: autoScrollCtrl,
                key: ValueKey(index),
                index: index,
                child: Focus(
                  parentNode: scopeNode,
                  focusNode: focusItem,
                  onFocusChange:  (isItemFocus) {
                    if (isItemFocus) {
                      currNodeFocused = focusItem;
                      autoScrollCtrl.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
                    }
                    setState(() {});
                  },
                  child: Container(
                      width: 150,
                      height: 10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: currNodeFocused?.hasFocus == true &&
                                currNodeFocused == focusItem &&
                                scopeNode.hasFocus
                              ? Colors.greenAccent : null,
                          border: Border.all(
                            width: focusItem.hasFocus ? 1 : 0,
                            color: context.colors.primary,
                          )),
                      child: Text("$index"),
                  ) ,
                ),
              );
            }),
      ),
    );
  }
}

class MultiListView extends StatefulWidget {
  const MultiListView({super.key, required this.children,this.itemBuilder});

  final List<Widget> children;
  final Widget Function(FocusScopeNode parentNode)? itemBuilder;

  @override
  State<MultiListView> createState() => _MultiListViewState();
}

class _MultiListViewState extends State<MultiListView> {
  late final autoScroll = AutoScrollController(
    axis: Axis.vertical,
    viewportBoundaryGetter: ()=> Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom)
  );
  late final List<FocusScopeNode> _listNode = List.generate(widget.children.length,(_)=> FocusScopeNode());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: autoScroll,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          widget.children.length,
              (index) {
            final itemFocus = widget.children[index];
            return AutoScrollTag(
              key: ValueKey('auto-scroll-content-$index'),
              controller: autoScroll,
              index: index,
              child: FocusableActionDetector(
                autofocus: false,
                  descendantsAreTraversable: true,
                  enabled: false,
                  onFocusChange: (isFocus){
                  if(isFocus){
                    autoScroll.scrollToIndex(index,preferPosition: AutoScrollPosition.begin);
                  }
                  },
                  child: widget.itemBuilder?.call(_listNode[index]) ?? itemFocus),
            );
          },
        ),
      ),
    );
  }
}
