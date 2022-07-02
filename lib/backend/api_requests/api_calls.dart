import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetOrdersFromBundleCall {
  static Future<ApiCallResponse> call({
    String bundleId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrdersFromBundle',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getOrdersFromBundle',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bundleId': bundleId,
      },
      returnBody: true,
    );
  }

  static dynamic expressOrder(dynamic response) => getJsonField(
        response,
        r'''$.expressOrder''',
      );
  static dynamic normalOrder(dynamic response) => getJsonField(
        response,
        r'''$.normalOrder''',
      );
  static dynamic expressAmountOfProducts(dynamic response) => getJsonField(
        response,
        r'''$.expressOrder.amountOfProducts''',
      );
  static dynamic normalAmountOfProducts(dynamic response) => getJsonField(
        response,
        r'''$.normalOrder.amountOfProducts''',
      );
}

class GetSuborderInfoCall {
  static Future<ApiCallResponse> call({
    String bundleId = '',
    String orderType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSuborderInfo',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getSuborderInfo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bundleId': bundleId,
        'orderType': orderType,
      },
      returnBody: true,
    );
  }

  static dynamic products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
      );
  static dynamic suppliers(dynamic response) => getJsonField(
        response,
        r'''$.totalSuppliers''',
      );
  static dynamic suppliersIds(dynamic response) => getJsonField(
        response,
        r'''$.totalSuppliersIds''',
      );
}

class GetVariantInventoryByStoreCall {
  static Future<ApiCallResponse> call({
    String productId = '',
    String variantId = '',
    String store = '',
    String priceType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getVariantInventoryByStore',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getVariantInventoryByStore',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'productId': productId,
        'variantId': variantId,
        'store': store,
        'priceType': priceType,
      },
      returnBody: true,
    );
  }
}

class GetSupplierFromNormalOrderCall {
  static Future<ApiCallResponse> call({
    String storeId = '',
    String bundleId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSupplierFromNormalOrder',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getSupplierFromNormalOrder',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'storeId': storeId,
        'bundleId': bundleId,
      },
      returnBody: true,
    );
  }

  static dynamic canSupplyProducts(dynamic response) => getJsonField(
        response,
        r'''$.canSupplyProducts''',
      );
  static dynamic canSupplyAmount(dynamic response) => getJsonField(
        response,
        r'''$.canSupplyAmount''',
      );
}

class GetOrderForClientInfoCall {
  static Future<ApiCallResponse> call({
    String orderId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderForClientInfo',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getOrderForClientInfo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'orderId': orderId,
      },
      returnBody: true,
    );
  }

  static dynamic products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
      );
  static dynamic suppliersIds(dynamic response) => getJsonField(
        response,
        r'''$.totalSuppliersIds''',
      );
}

class GetProductsStoreSuppliedCall {
  static Future<ApiCallResponse> call({
    String orderId = '',
    String store = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getProductsStoreSupplied',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getProductsStoreSupplied',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'orderId': orderId,
        'store': store,
      },
      returnBody: true,
    );
  }

  static dynamic productsStoreSupplied(dynamic response) => getJsonField(
        response,
        r'''$.productsStoreSupplied''',
      );
  static dynamic totalAmount(dynamic response) => getJsonField(
        response,
        r'''$.amount''',
      );
}

class GetSellersThatSuppliedProductCall {
  static Future<ApiCallResponse> call({
    String bundleId = '',
    String variantId = '',
    String orderType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSellersThatSuppliedProduct',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getSellersThatSuppliedProduct',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bundleId': bundleId,
        'variantId': variantId,
        'orderType': orderType,
      },
      returnBody: true,
    );
  }

  static dynamic storesIds(dynamic response) => getJsonField(
        response,
        r'''$.storesIds''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.amount''',
      );
}

class GetVariantAmountFromSellerOrderCall {
  static Future<ApiCallResponse> call({
    String storeId = '',
    String bundleId = '',
    String variantId = '',
    String orderType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getVariantAmountFromSellerOrder',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getVariantAmountFromSellerOrder',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'storeId': storeId,
        'bundleId': bundleId,
        'variantId': variantId,
        'orderType': orderType,
      },
      returnBody: true,
    );
  }

  static dynamic variant(dynamic response) => getJsonField(
        response,
        r'''$.variant''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.variant.amount''',
      );
}

class MarkStoresOrdersAsDeliveredCall {
  static Future<ApiCallResponse> call({
    String bundleId = '',
    String orderType = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'markStoresOrdersAsDelivered',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/markStoresOrdersAsDelivered',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bundleId': bundleId,
        'orderType': orderType,
      },
      returnBody: true,
    );
  }
}

class IsUserAdminCall {
  static Future<ApiCallResponse> call({
    String userEmail = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'isUserAdmin',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/isUserAdmin',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userEmail': userEmail,
      },
      returnBody: true,
    );
  }

  static dynamic response(dynamic response) => getJsonField(
        response,
        r'''$.response''',
      );
}

class PlaceNormalOrderCall {
  static Future<ApiCallResponse> call({
    String bundleId = '',
    String clientId = '',
    String products = '',
    String storeId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'placeNormalOrder',
      apiUrl: 'https://',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'bundleId': bundleId,
        'clientId': clientId,
        'products': products,
        'storeId': storeId,
      },
      returnBody: true,
    );
  }
}

class UpdatePricingRequestCall {
  static Future<ApiCallResponse> call({
    String requestId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'updatePricingRequest',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/updatePricingRequest',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'requestId': requestId,
      },
      returnBody: true,
    );
  }
}

class GetPricingRequestInfoCall {
  static Future<ApiCallResponse> call({
    String requestId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPricingRequestInfo',
      apiUrl:
          'https://us-central1-srconstruccion-d4663.cloudfunctions.net/getPricingRequestInfo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'requestId': requestId,
      },
      returnBody: true,
    );
  }
}
