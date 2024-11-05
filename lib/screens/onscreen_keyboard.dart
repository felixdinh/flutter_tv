import 'package:flutter/material.dart';
import 'package:test_tv/packages/on_screen_keyboard/virtual_keyboard_multi_language.dart';

class OnscreenKeyboardScreen extends StatefulWidget {
  const OnscreenKeyboardScreen({super.key});

  @override
  State<OnscreenKeyboardScreen> createState() => _OnscreenKeyboardScreenState();
}

class _OnscreenKeyboardScreenState extends State<OnscreenKeyboardScreen> {
  final ctl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TextFormField(
          //   controller:  ctl
          // ),
          VirtualKeyboard(
            textController: ctl,
              type: VirtualKeyboardType.Alphanumeric,
            customLayoutKeys: CustomLayoutKeys(),
          ),
        ],
      ),
    );
  }
}

class CustomLayoutKeys extends VirtualKeyboardLayoutKeys {
  @override
  int getLanguagesCount() => 2;


  @override
  List<List> getLanguage(int index) {
    switch (index) {
      case 1:
        return _specialChars;
      default:
        return _loginLayout;
    }
  }

}
List<List> _loginLayout = [
  // Row 1
  const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ],
  // Row 2
  const [
    'q',
    'w',
    'e',
    'r',
    't',
    'y',
    'u',
    'i',
    'o',
    'p',
  ],
  // Row 3
  const [
    'a',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    '-'
  ],
  // Row 4
  const [
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm',
    '_',
  ],
  // Row 5
  const [
    '@hotmail.com',
    '@gmail.com',
    '@yahoo.com',
  ],
  [
    VirtualSwitchLanguageAction(
      icon: Text('!#\$')
    ),
    '@',
    '.',
    '.com',
    VirtualBackSpaceAction(),
  ]
];
 List<List> _specialChars = [
  ['@','#','\$','_','&',],
  ['-','+','(',')','/'],
  ['*','"','\'',':',';'],
  ['!','?','%',],
  [
    VirtualSwitchLanguageAction(
      icon: const Text('ABC')
    ),
    '.',',',
    VirtualBackSpaceAction(),

  ]
];
