import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista/data/data.dart';
import 'package:lista/service/servico.dart';

class Prods with ChangeNotifier {
  final Map<String, Prod> _items = {...DUMMY_PROD};

  List<Prod> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Prod byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Prod prod) {
    if (prod == null) {
      return;
    }

    if (prod.id != null &&
        prod.id.trim().isNotEmpty &&
        _items.containsKey(prod.id)) {
      _items.update(
          prod.id,
          (_) => Prod(
                id: prod.id,
                produto: prod.produto,
              ));
    } else {
      //adicionar
      final ids = Random().nextDouble().toString();
      _items.putIfAbsent(
        ids,
        () => Prod(
          id: ids,
          produto: prod.produto,
        ),
      );
    }

    notifyListeners();
  }

  void remove(Prod prod) {
    if (prod != null && prod.id != null) {
      _items.remove(prod.id);

      notifyListeners();
    }
  }
}
