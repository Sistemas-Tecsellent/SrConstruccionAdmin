import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool isGreaterThanZero(int value) {
  if (value > 0) {
    return true;
  } else {
    return false;
  }
}

List<dynamic> stageProductToLocalState(
  String productId,
  String variantId,
  int amount,
  List<dynamic> stagedProducts,
  String normalPrice,
  String unit,
) {
  var newState = [];
  if (stagedProducts.length <= 0) {
    newState.add({
      'productId': productId,
      'variantId': variantId,
      'amount': amount,
      'unit': unit,
      'normalPrice': normalPrice
    });
  } else {
    for (var product in stagedProducts) {
      if (product['variantId'] == variantId) {
        newState.add({
          'productId': productId,
          'variantId': variantId,
          'amount': amount,
          'unit': unit,
          'normalPrice': normalPrice
        });
      } else {
        newState.add(product);
      }
    }
  }

  return newState;
}

List<dynamic> unstageProductFromLocalState(
  String variantId,
  List<dynamic> stagedProducts,
) {
  var newState = [];
  for (var item in stagedProducts) {
    if (variantId == item['variantId']) {
      continue;
    } else {
      newState.add(item);
    }
  }
  return newState;
}

bool isStaged(
  String variantId,
  List<dynamic> stagedProducts,
) {
  for (var item in stagedProducts) {
    if (variantId == item['variantId']) {
      return true;
    }
  }
  return false;
}

int unitsOfVariantStaged(
  String variantId,
  List<dynamic> stagedProducts,
) {
  for (var item in stagedProducts) {
    if (variantId == item['variantId']) {
      return item['amount'];
    }
  }
  return 0;
}

List<dynamic> orderSuppliersToList(dynamic order) {
  var suppliers = order['totalSuppliers'];
  var response = [];
  for (var item in suppliers) {
    response.add({
      'id': item['id'],
      'name': item['name'],
      'canSupplyAmount': item['canSupplyAmount'],
    });
  }
  return response;
}
