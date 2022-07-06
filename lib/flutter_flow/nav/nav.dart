import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  SrConstruccionAdminFirebaseUser initialUser;
  SrConstruccionAdminFirebaseUser user;
  bool showSplashImage = true;
  String _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(SrConstruccionAdminFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? DashboardWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? DashboardWidget() : LoginWidget(),
          routes: [
            FFRoute(
              name: 'Finanzastodaslascompras',
              path: 'finanzas/todas-las-compras',
              requireAuth: true,
              builder: (context, params) => FinanzastodaslascomprasWidget(),
            ),
            FFRoute(
              name: 'Dashboard',
              path: 'dashboard',
              requireAuth: true,
              builder: (context, params) => DashboardWidget(),
            ),
            FFRoute(
              name: 'PEDIDOS',
              path: 'pedidos',
              requireAuth: true,
              builder: (context, params) => PedidosWidget(),
            ),
            FFRoute(
              name: 'PorAceptar',
              path: 'porAceptar',
              requireAuth: true,
              builder: (context, params) => PorAceptarWidget(
                orderBundle: params.getParam('orderBundle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Notificaciones',
              path: 'notificaciones',
              requireAuth: true,
              builder: (context, params) => NotificacionesWidget(),
            ),
            FFRoute(
              name: 'PedidoHistorial',
              path: 'pedidos/historial/pedido',
              requireAuth: true,
              builder: (context, params) => PedidoHistorialWidget(),
            ),
            FFRoute(
              name: 'Estadodecuenta',
              path: 'finanzas/estado-de-cuenta',
              requireAuth: true,
              builder: (context, params) => EstadodecuentaWidget(),
            ),
            FFRoute(
              name: 'Historial',
              path: 'pedidos/historial',
              requireAuth: true,
              builder: (context, params) => HistorialWidget(),
            ),
            FFRoute(
              name: 'AnadirCupon',
              path: 'promociones/anadir-cupon',
              requireAuth: true,
              builder: (context, params) => AnadirCuponWidget(),
            ),
            FFRoute(
              name: 'Ajustes',
              path: 'ajustes',
              requireAuth: true,
              builder: (context, params) => AjustesWidget(),
            ),
            FFRoute(
              name: 'Promociones',
              path: 'promociones',
              requireAuth: true,
              builder: (context, params) => PromocionesWidget(),
            ),
            FFRoute(
              name: 'Devoluciones',
              path: 'pedidos/devoluciones',
              requireAuth: true,
              builder: (context, params) => DevolucionesWidget(),
            ),
            FFRoute(
              name: 'VendedoresRegistrados',
              path: 'vendedores/registrados',
              requireAuth: true,
              builder: (context, params) => VendedoresRegistradosWidget(),
            ),
            FFRoute(
              name: 'VendedoresPorAprobar',
              path: 'vendedores/por-aprobar',
              requireAuth: true,
              builder: (context, params) => VendedoresPorAprobarWidget(),
            ),
            FFRoute(
              name: 'AprobarVendedorDetalles',
              path: 'vendedores/aprobar-vendedor/detalles/',
              requireAuth: true,
              builder: (context, params) => AprobarVendedorDetallesWidget(
                sellerUID: params.getParam('sellerUID', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Documentos',
              path: 'documentos',
              requireAuth: true,
              builder: (context, params) => DocumentosWidget(),
            ),
            FFRoute(
              name: 'VendedorDetalles',
              path: 'vendedores/vendedor/detalles/',
              requireAuth: true,
              builder: (context, params) => VendedorDetallesWidget(),
            ),
            FFRoute(
              name: 'VendedorPagos',
              path: 'vendedores/vendedor/informe-de-ventas/',
              requireAuth: true,
              builder: (context, params) => VendedorPagosWidget(),
            ),
            FFRoute(
              name: 'VendedorProductos',
              path: 'vendedores/vendedor/productos',
              requireAuth: true,
              builder: (context, params) => VendedorProductosWidget(),
            ),
            FFRoute(
              name: 'VendedorProductosCategorias',
              path: 'vendedores/vendedor/productos/categorias',
              requireAuth: true,
              builder: (context, params) => VendedorProductosCategoriasWidget(),
            ),
            FFRoute(
              name: 'VendedorProductosMarcas',
              path: 'vendedores/vendedor/productos/marcas',
              requireAuth: true,
              builder: (context, params) => VendedorProductosMarcasWidget(),
            ),
            FFRoute(
              name: 'RepartidoresRegistrados',
              path: 'repartidores/registrados',
              requireAuth: true,
              builder: (context, params) => RepartidoresRegistradosWidget(),
            ),
            FFRoute(
              name: 'RepartidoresPorAprobar',
              path: 'repartidores/pendientes-de-aprobacion',
              requireAuth: true,
              builder: (context, params) => RepartidoresPorAprobarWidget(),
            ),
            FFRoute(
              name: 'AprobarRepartidor',
              path: 'repartidores/pendientes-de-aprobacion/aprobar-repartidor',
              requireAuth: true,
              builder: (context, params) => AprobarRepartidorWidget(
                delivererId: params.getParam('delivererId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Vendedordatosbancarios',
              path: 'vendedores/vendedor/datos-bancarios/',
              requireAuth: true,
              builder: (context, params) => VendedordatosbancariosWidget(),
            ),
            FFRoute(
              name: 'VendedorDocumentos',
              path: 'vendedores/vendedor/documentos/',
              requireAuth: true,
              builder: (context, params) => VendedorDocumentosWidget(),
            ),
            FFRoute(
              name: 'EditarCupon',
              path: 'promociones/editar-cupon/',
              requireAuth: true,
              builder: (context, params) => EditarCuponWidget(),
            ),
            FFRoute(
              name: 'Repartidor',
              path: 'repartidor/datos',
              requireAuth: true,
              builder: (context, params) => RepartidorWidget(),
            ),
            FFRoute(
              name: 'RepartidoHistorialDePedidos',
              path: 'repartidor/pedidos',
              requireAuth: true,
              builder: (context, params) => RepartidoHistorialDePedidosWidget(),
            ),
            FFRoute(
              name: 'RepartidorPagos',
              path: 'repartidor/pagos',
              requireAuth: true,
              builder: (context, params) => RepartidorPagosWidget(),
            ),
            FFRoute(
              name: 'CotizacionePendientes',
              path: 'cotizaciones/pendientes',
              requireAuth: true,
              builder: (context, params) => CotizacionePendientesWidget(),
            ),
            FFRoute(
              name: 'AnadirRepartidor',
              path: 'repartidores/anadir-repartidor',
              requireAuth: true,
              builder: (context, params) => AnadirRepartidorWidget(),
            ),
            FFRoute(
              name: 'AprobarVendedorDatosBancarios',
              path: 'vendedores/aprobar-vendedor/datos-bancarios/',
              requireAuth: true,
              builder: (context, params) =>
                  AprobarVendedorDatosBancariosWidget(),
            ),
            FFRoute(
              name: 'AprobarVendedorDocumentos',
              path: 'vendedores/aprobar-vendedor/doducmentos/',
              requireAuth: true,
              builder: (context, params) => AprobarVendedorDocumentosWidget(),
            ),
            FFRoute(
              name: 'CrearVendedorDetalles',
              path: 'vendedores/crear-vendedor/detalles/',
              requireAuth: true,
              builder: (context, params) => CrearVendedorDetallesWidget(),
            ),
            FFRoute(
              name: 'CrearVendedorProductos',
              path: 'vendedores/crear-vendedor/productos',
              requireAuth: true,
              builder: (context, params) => CrearVendedorProductosWidget(),
            ),
            FFRoute(
              name: 'CrearVendedorProductosMarcas',
              path: 'vendedores/crear-vendedor/productos/marcas',
              requireAuth: true,
              builder: (context, params) =>
                  CrearVendedorProductosMarcasWidget(),
            ),
            FFRoute(
              name: 'CrearVendedorProductosCategorias',
              path: 'vendedores/crear-vendedor/productos/categorias',
              requireAuth: true,
              builder: (context, params) =>
                  CrearVendedorProductosCategoriasWidget(),
            ),
            FFRoute(
              name: 'Cotizaciones',
              path: 'cotizaciones',
              requireAuth: true,
              builder: (context, params) => CotizacionesWidget(),
            ),
            FFRoute(
              name: 'CrearVendedorDatosBancarios',
              path: 'vendedores/crear-vendedor/datos-bancarios',
              requireAuth: true,
              builder: (context, params) => CrearVendedorDatosBancariosWidget(),
            ),
            FFRoute(
              name: 'Usuarios',
              path: 'usuarios',
              requireAuth: true,
              builder: (context, params) => UsuariosWidget(),
            ),
            FFRoute(
              name: 'Productos',
              path: 'productos',
              requireAuth: true,
              builder: (context, params) => ProductosWidget(),
            ),
            FFRoute(
              name: 'Categorias',
              path: 'productos/categorias',
              requireAuth: true,
              builder: (context, params) => CategoriasWidget(),
            ),
            FFRoute(
              name: 'Marcas',
              path: 'productos/marcas',
              requireAuth: true,
              builder: (context, params) => MarcasWidget(),
            ),
            FFRoute(
              name: 'CrearMarca',
              path: 'productos/marca/crear-marca',
              requireAuth: true,
              builder: (context, params) => CrearMarcaWidget(),
            ),
            FFRoute(
              name: 'CrearCategoria',
              path: 'productos/marca/crear-categoria',
              requireAuth: true,
              builder: (context, params) => CrearCategoriaWidget(),
            ),
            FFRoute(
              name: 'PedidoPorAceptar5DIAS',
              path: 'pedidos/por-aceptar/5-dias',
              requireAuth: true,
              builder: (context, params) => PedidoPorAceptar5DIASWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                normalOrderId:
                    params.getParam('normalOrderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoPorEntregarEXPRESS',
              path: 'pedidos/por-entregar/express',
              requireAuth: true,
              builder: (context, params) => PedidoPorEntregarEXPRESSWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoPorAceptarEXPRESS',
              path: 'pedidos/por-aceptar/express',
              requireAuth: true,
              builder: (context, params) => PedidoPorAceptarEXPRESSWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoEnPreparacionEXPRESS',
              path: 'pedidos/en-preparacion/express',
              requireAuth: true,
              builder: (context, params) => PedidoEnPreparacionEXPRESSWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CrearSubcategoria',
              path: 'CrearSubcategoria',
              requireAuth: true,
              builder: (context, params) => CrearSubcategoriaWidget(),
            ),
            FFRoute(
              name: 'PedidoPorEntregarEXPRESSMAP',
              path: 'pedidos/por-entregar/express/mapa',
              requireAuth: true,
              builder: (context, params) => PedidoPorEntregarEXPRESSMAPWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoEnPreparacion5DIAS',
              path: 'pedidos/en-preparacion/5-dias',
              requireAuth: true,
              builder: (context, params) => PedidoEnPreparacion5DIASWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AnadirProducto',
              path: 'productos/anadir-producto',
              requireAuth: true,
              builder: (context, params) => AnadirProductoWidget(),
            ),
            FFRoute(
              name: 'PedidoPorEntregar5DIAS',
              path: 'pedidos/por-entregar/5-dias',
              requireAuth: true,
              builder: (context, params) => PedidoPorEntregar5DIASWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CrearVendedorDocumentos',
              path: 'vendedores/crear-vendedor/documentos',
              requireAuth: true,
              builder: (context, params) => CrearVendedorDocumentosWidget(),
            ),
            FFRoute(
              name: 'AnadirServicio',
              path: 'productos/anadir-servicio',
              requireAuth: true,
              builder: (context, params) => AnadirServicioWidget(),
            ),
            FFRoute(
              name: 'EditarProducto',
              path: 'productos/editar-producto',
              requireAuth: true,
              builder: (context, params) => EditarProductoWidget(),
            ),
            FFRoute(
              name: 'EditarServicio',
              path: 'productos/editar-servicio',
              requireAuth: true,
              builder: (context, params) => EditarServicioWidget(),
            ),
            FFRoute(
              name: 'AnadirVariante',
              path: 'productos/producto/anadir-variante',
              requireAuth: true,
              builder: (context, params) => AnadirVarianteWidget(),
            ),
            FFRoute(
              name: 'Servicios',
              path: 'productos/servicios',
              requireAuth: true,
              builder: (context, params) => ServiciosWidget(),
            ),
            FFRoute(
              name: 'Coleccionesapp',
              path: 'productos/colecciones-app',
              requireAuth: true,
              builder: (context, params) => ColeccionesappWidget(),
            ),
            FFRoute(
              name: 'VendedorCompras',
              path: 'vendedores/vendedor/compras/',
              requireAuth: true,
              builder: (context, params) => VendedorComprasWidget(),
            ),
            FFRoute(
              name: 'Usuario',
              path: 'usuario/datos',
              requireAuth: true,
              builder: (context, params) => UsuarioWidget(),
            ),
            FFRoute(
              name: 'UsuarioHistorial',
              path: 'usuario/historial',
              requireAuth: true,
              builder: (context, params) => UsuarioHistorialWidget(),
            ),
            FFRoute(
              name: 'UsuarioPedidos',
              path: 'usuario/pedidos',
              requireAuth: true,
              builder: (context, params) => UsuarioPedidosWidget(),
            ),
            FFRoute(
              name: 'editarCategoria',
              path: 'productos/categoria/editar-categoria',
              requireAuth: true,
              builder: (context, params) => EditarCategoriaWidget(),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'DetallesCotizacion2',
              path: 'cotizaciones/detalles-cotizacion/archivo',
              requireAuth: true,
              builder: (context, params) => DetallesCotizacion2Widget(),
            ),
            FFRoute(
              name: 'DetallesCotizacionProductos',
              path: 'cotizaciones/detalles-cotizacion/con-productos',
              requireAuth: true,
              builder: (context, params) => DetallesCotizacionProductosWidget(),
            ),
            FFRoute(
              name: 'RegistroWeb',
              path: 'registros-web',
              requireAuth: true,
              builder: (context, params) => RegistroWebWidget(),
            ),
            FFRoute(
              name: 'PedidoHistorialSELLER',
              path: 'pedidos/historial/seller',
              requireAuth: true,
              builder: (context, params) => PedidoHistorialSELLERWidget(),
            ),
            FFRoute(
              name: 'SellerPedidoPorAceptarRECOGERENTIENDA',
              path: 'pedidos/seller/por-aceptar/recoger-en-tienda/',
              requireAuth: true,
              builder: (context, params) =>
                  SellerPedidoPorAceptarRECOGERENTIENDAWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                normalOrderId:
                    params.getParam('normalOrderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SellerPedidoEnPreparacionRECOGERENTIENDA',
              path: 'pedidos/seller/en-preparacion/recoger-en-tienda/',
              requireAuth: true,
              builder: (context, params) =>
                  SellerPedidoEnPreparacionRECOGERENTIENDAWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                normalOrderId:
                    params.getParam('normalOrderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SellerPedidoPorEntregarRECOGERENTIENDA',
              path: 'pedidos/seller/por-entregar/recoger-en-tienda/',
              requireAuth: true,
              builder: (context, params) =>
                  SellerPedidoPorEntregarRECOGERENTIENDAWidget(
                bundleId: params.getParam('bundleId', ParamType.String),
                normalOrderId:
                    params.getParam('normalOrderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoHistorialSELLERRecogerEnTienda',
              path: 'vendedor/informe-de-ventas/recoger-en-tienda/',
              requireAuth: true,
              builder: (context, params) =>
                  PedidoHistorialSELLERRecogerEnTiendaWidget(),
            ),
            FFRoute(
              name: 'PedidoPorAceptar5DIASCamion',
              path: 'pedidos/por-aceptar/5-dias-camion',
              requireAuth: true,
              builder: (context, params) => PedidoPorAceptar5DIASCamionWidget(
                pricingRequestId:
                    params.getParam('pricingRequestId', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
    );

extension NavParamExtensions on Map<String, String> {
  Map<String, String> get withoutNulls =>
      Map.fromEntries(entries.where((e) => e.value != null));
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  bool get isEmpty => state.allParams.isEmpty;
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key](param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam(
    String paramName,
    ParamType type, [
    String collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam(param, type, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    @required this.name,
    @required this.path,
    @required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Builder(
                    builder: (context) => Image.asset(
                      'assets/images/Diseo_sin_ttulo_(15).png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}
