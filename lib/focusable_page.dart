import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_checkbox.dart';

class FocusablePage extends StatefulWidget {
  const FocusablePage({super.key});

  @override
  State<FocusablePage> createState() => _FocusablePageState();
}

class _FocusablePageState extends State<FocusablePage> {
  final formFocusNode = FocusNode(),
  field1FocusNode = FocusNode(),
  field2FocusNode = FocusNode();
  bool _check1 = false;
  bool _check2 = true;
  bool _check3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("fefe"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // FocusTraversalGroup(
            //   policy: OrderedTraversalPolicy(),
            //   child: SizedBox(
            //     height: 100,
            //     child: ListView.builder(
            //       itemCount: 10,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) => FocusTraversalOrder(
            //         order: NumericFocusOrder(index.toDouble()),
            //         child: FocusableControlBuilder(
            //           autoFocus: index == 0,
            //           builder: (context, control) {
            //             final isFocus = control.focusNode.hasFocus;
            //             final a = control.isHovered;
            //             return Container(
            //               height: 30,
            //               width: 100,
            //               margin: EdgeInsets.symmetric(horizontal: 4),
            //               color: isFocus ? Colors.lightBlue :  Colors.green,
            //               alignment: Alignment.center,
            //               child: Text("$index"),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //
            // //Divider(thickness: 3,height: 50,),
            // FocusTraversalGroup(
            //   policy: OrderedTraversalPolicy(),
            //   child: SizedBox(
            //     height: 100,
            //     child: ListView.builder(
            //       itemCount: 10,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) => FocusableControlBuilder(
            //         builder: (context, control) {
            //           final isFocus = control.focusNode.hasFocus;
            //           final a = control.isHovered;
            //           return Container(
            //             height: 30,
            //             width: 100,
            //             margin: EdgeInsets.symmetric(horizontal: 4),
            //             color: isFocus ? Colors.lightBlue :  Colors.green,
            //             alignment: Alignment.center,
            //             child: Text("$index"),
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomButton("Button 1"),
                CustomButton("Button 2", onPressed: () => debugPrint("Click2")),
                CustomButton("Button 3", onPressed: () => debugPrint("Click3")),
              ],
            ),
            const SizedBox(height: 30),
            CustomCheckbox("Chk1", value: _check1, onChanged: (v) => setState(() => _check1 = v)),
            CustomCheckbox("Chk2", value: _check2, onChanged: (v) => setState(() => _check2 = v)),
            CustomCheckbox("Chk3", value: _check3, onChanged: (v) => setState(() => _check3 = v)),

            KeyboardListener(
              focusNode: formFocusNode,
              onKeyEvent: (event){
                if(event is KeyDownEvent){
                  if(event.logicalKey == LogicalKeyboardKey.arrowDown){
                    if(field1FocusNode.hasFocus){
                      FocusScope.of(context).nextFocus();
                    }
                  }
                }
              },
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: FocusableControlBuilder(
                      onPressed: (){
                        FocusScope.of(context).requestFocus(field1FocusNode);
                      },
                      descendantsAreTraversable: false,
                      descendantsAreFocusable: true,

                      builder:(context,control)  {
                        final isFocus = control.focusNode.hasFocus;
                        return Container(
                          decoration: BoxDecoration(
                            border: isFocus? Border.all(color: Colors.green,width: 1) : null
                          ),
                          child: TextFormField(
                            focusNode: field1FocusNode,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)
                                )
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: FocusableControlBuilder(
                      onPressed: (){
                        FocusScope.of(context).requestFocus(field2FocusNode);
                      },
                      descendantsAreTraversable: false,
                      descendantsAreFocusable: true,
                      builder:(context,control)  {
                        final isFocus = control.focusNode.hasFocus;
                        return Container(
                          decoration: BoxDecoration(
                              border: isFocus? Border.all(color: Colors.green,width: 1) : null
                          ),
                          child: TextFormField(
                            focusNode: field2FocusNode,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green)
                                )
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
