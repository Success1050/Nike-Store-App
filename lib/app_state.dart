import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cartSum = prefs.getDouble('ff_cartSum') ?? _cartSum;
    });
    _safeInit(() {
      _cart =
          prefs.getStringList('ff_cart')?.map((path) => path.ref).toList() ??
              _cart;
    });
    _safeInit(() {
      _cartitems = prefs.getInt('ff_cartitems') ?? _cartitems;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _cartSum = 0.0;
  double get cartSum => _cartSum;
  set cartSum(double value) {
    _cartSum = value;
    prefs.setDouble('ff_cartSum', value);
  }

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> value) {
    _cart = value;
    prefs.setStringList('ff_cart', value.map((x) => x.path).toList());
  }

  void addToCart(DocumentReference value) {
    cart.add(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference value) {
    cart.remove(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void insertAtIndexInCart(int index, DocumentReference value) {
    cart.insert(index, value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  int _cartitems = 0;
  int get cartitems => _cartitems;
  set cartitems(int value) {
    _cartitems = value;
    prefs.setInt('ff_cartitems', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
