part of virtual_keyboard_multi_language;
//import '../virtual_keyboard_multi_language.dart';

abstract class VirtualKeyboardLayoutKeys {
  int activeIndex = 0;

  List<List> get defaultEnglishLayout => _defaultEnglishLayout;
  // List<List> get defaultArabicLayout => _defaultArabicLayout;

  List<List> get activeLayout => getLanguage(activeIndex);
  int getLanguagesCount();
  List<List> getLanguage(int index);

  void switchLanguage() {
    if ((activeIndex + 1) == getLanguagesCount()) {
      activeIndex = 0;
    } else {
      activeIndex++;
    }
  }
}

class VirtualKeyboardDefaultLayoutKeys extends VirtualKeyboardLayoutKeys {
  List<VirtualKeyboardDefaultLayouts> defaultLayouts;
  VirtualKeyboardDefaultLayoutKeys(this.defaultLayouts);

  @override
  int getLanguagesCount() => defaultLayouts.length;

  @override
  List<List> getLanguage(int index) {
    switch (defaultLayouts[index]) {
      case VirtualKeyboardDefaultLayouts.English:
        return _defaultEnglishLayout;
      // case VirtualKeyboardDefaultLayouts.Arabic:
      //   return _defaultArabicLayout;
      // case VirtualKeyboardDefaultLayouts.Kurdish:
      //   return _defaultKurdishLayout;
      default:
    }
    return _defaultEnglishLayout;
  }
}

/// Keys for Virtual Keyboard's rows.
List<List> _defaultEnglishLayout = [
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
  [
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
    VirtualBackSpaceAction(),
  ],
  // Row 3
   [
    'a',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    ';',
    '\'',
    VirtualReturnAction() ,
  ],
  // Row 4
  [
    VirtualShiftKAction(),
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm',
    ',',
    '.',
    '/',
    VirtualShiftKAction(),
  ],
  // Row 5
   [
    VirtualSwitchLanguageAction(),
    '@',
     VirtualSpaceAction(),
    '-',
    '&',
    '_',
  ]
];
