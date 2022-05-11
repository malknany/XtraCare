// ignore_for_file: unnecessary_new, unused_import

import 'package:flutter_application_1/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("chick if the boolen is work ", () {
    boolen b = new boolen();
    b.booltrue();
    expect(b.islike, true);
  });
}
