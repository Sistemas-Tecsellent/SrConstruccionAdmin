import '../ajustes/ajustes_widget.dart';
import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/logo_completo_widget.dart';
import '../components/notifications_widget.dart';
import '../components/ver_productos_widget.dart';
import '../cotizacione_pendientes/cotizacione_pendientes_widget.dart';
import '../dashboard/dashboard_widget.dart';
import '../finanzastodaslascompras/finanzastodaslascompras_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../pedidos/pedidos_widget.dart';
import '../productos/productos_widget.dart';
import '../promociones/promociones_widget.dart';
import '../registro_web/registro_web_widget.dart';
import '../repartidores_registrados/repartidores_registrados_widget.dart';
import '../usuarios/usuarios_widget.dart';
import '../vendedores_registrados/vendedores_registrados_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PedidoPorAceptar5DIASWidget extends StatefulWidget {
  const PedidoPorAceptar5DIASWidget({
    Key key,
    this.bundleId,
    this.normalOrderId,
  }) : super(key: key);

  final String bundleId;
  final String normalOrderId;

  @override
  _PedidoPorAceptar5DIASWidgetState createState() =>
      _PedidoPorAceptar5DIASWidgetState();
}

class _PedidoPorAceptar5DIASWidgetState
    extends State<PedidoPorAceptar5DIASWidget> {
  String uploadedFileUrl = '';
  TextEditingController textController1;
  String delivererId;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrdersForClientsRecord>>(
      stream: queryOrdersForClientsRecord(
        queryBuilder: (ordersForClientsRecord) =>
            ordersForClientsRecord.where('id', isEqualTo: widget.normalOrderId),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<OrdersForClientsRecord>
            pedidoPorAceptar5DIASOrdersForClientsRecordList = snapshot.data;
        final pedidoPorAceptar5DIASOrdersForClientsRecord =
            pedidoPorAceptar5DIASOrdersForClientsRecordList.isNotEmpty
                ? pedidoPorAceptar5DIASOrdersForClientsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            LogoCompletoWidget(),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Cancelar Pedido',
                                icon: Icon(
                                  Icons.cancel_sharp,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 180,
                                  height: 50,
                                  color: Color(0x00FF5963),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 14,
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 5,
                                ),
                              ),
                            ),
                            if (!(pedidoPorAceptar5DIASOrdersForClientsRecord
                                    .isFromSellerWiseOrder) ??
                                true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final ordersForClientsUpdateData =
                                        createOrdersForClientsRecordData(
                                      status: 'waitingPickup',
                                      statusForClient: 'Programando Envío',
                                    );
                                    await pedidoPorAceptar5DIASOrdersForClientsRecord
                                        .reference
                                        .update(ordersForClientsUpdateData);
                                  },
                                  text: 'Aceptar Pedido',
                                  icon: Icon(
                                    Icons.check_circle,
                                    size: 15,
                                  ),
                                  options: FFButtonOptions(
                                    width: 180,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context).green,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 5,
                                  ),
                                ),
                              ),
                            NotificationsWidget(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [],
              elevation: 0,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 215,
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.transparent,
                              )
                            ],
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: Color(0xFFF3F3F3),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: DashboardWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.dashboard_outlined,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Dashboard',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  dense: false,
                                ),
                              ),
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                        reverseDuration:
                                            Duration(milliseconds: 0),
                                        child: PedidosWidget(),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.local_shipping_outlined,
                                      color: Colors.white,
                                    ),
                                    title: Text(
                                      'Pedidos',
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: CotizacionePendientesWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.insert_drive_file_outlined,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Cotizaciones',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: FinanzastodaslascomprasWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.attach_money_rounded,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Finanzas',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: ProductosWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Productos',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: VendedoresRegistradosWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.storefront,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Vendedores',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: RepartidoresRegistradosWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.motorcycle_rounded,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Repartidores',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: UsuariosWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.tag_faces,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Usuarios',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: RegistroWebWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.link_rounded,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Registros Web',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: PromocionesWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.receipt_long_outlined,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Promociones',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.sms_outlined,
                                  color: Color(0xFFB5B5B5),
                                ),
                                title: Text(
                                  'Mensajes',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFFB5B5B5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                dense: false,
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: AjustesWidget(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.settings_outlined,
                                    color: Color(0xFFB5B5B5),
                                  ),
                                  title: Text(
                                    'Ajustes',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFB5B5B5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.58,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: StreamBuilder<List<OrderBundlesRecord>>(
                        stream: queryOrderBundlesRecord(
                          queryBuilder: (orderBundlesRecord) =>
                              orderBundlesRecord.where('id',
                                  isEqualTo: widget.bundleId),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitCircle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<OrderBundlesRecord>
                              columnOrderBundlesRecordList = snapshot.data;
                          final columnOrderBundlesRecord =
                              columnOrderBundlesRecordList.isNotEmpty
                                  ? columnOrderBundlesRecordList.first
                                  : null;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          text: 'Volver',
                                          icon: Icon(
                                            Icons.keyboard_arrow_left,
                                            size: 15,
                                          ),
                                          options: FFButtonOptions(
                                            width: 110,
                                            height: 40,
                                            color: Color(0x00FDC054),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 35, 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'ID Pedido - ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: Text(
                                              pedidoPorAceptar5DIASOrdersForClientsRecord
                                                  .id,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 18,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '1-5 DÍAS',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .green,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 30, 0),
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 5),
                                                child: Text(
                                                  'ACEPTACIÓN',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xFF909090),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0x00EEEEEE),
                                            ),
                                            child: LinearPercentIndicator(
                                              percent: 0.5,
                                              width: 100,
                                              lineHeight: 24,
                                              animation: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              backgroundColor:
                                                  Color(0xFFF1F4F8),
                                              center: Text(
                                                '50%',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                              ),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: GetSuborderInfoCall.call(
                                      bundleId: widget.bundleId,
                                      orderType: 'normal',
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitCircle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 50,
                                            ),
                                          ),
                                        );
                                      }
                                      final rowGetSuborderInfoResponse =
                                          snapshot.data;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 20, 0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (!(pedidoPorAceptar5DIASOrdersForClientsRecord
                                                          .isFromSellerWiseOrder) ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.55,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          20,
                                                                          20,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                        child:
                                                                            Text(
                                                                          'FECHA DEL PEDIDO',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color(0xFF909090),
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            20),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                              'M/d h:mm a',
                                                                              columnOrderBundlesRecord.createdDate),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Colors.black,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            200,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: textController1 ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                pedidoPorAceptar5DIASOrdersForClientsRecord.deliverDate,
                                                                          ),
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            'textController1',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                setState(() {}),
                                                                          ),
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'ENTREGA ESTIMADA',
                                                                            labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFF909090),
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFF909090),
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                            enabledBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            focusedBorder:
                                                                                UnderlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color(0xFF909090),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                        child:
                                                                            Text(
                                                                          'MÉTODO DE PAGO',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color(0xFF909090),
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            20),
                                                                        child:
                                                                            Text(
                                                                          columnOrderBundlesRecord
                                                                              .paymentMethod,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Colors.black,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.52,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00EEEEEE),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.03,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.1,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      'SELLER',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFF909090),
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.05,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      'ITEMS',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFF909090),
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.08,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      'STATUS',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFF909090),
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.07,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      'SUBIR GUÍA',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFF909090),
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.04,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      'ENVÍO',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFF909090),
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.09,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
                                                                                      'RECOLECCIÓN',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Color(0xFF909090),
                                                                                            fontSize: 14,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          StreamBuilder<
                                                                              List<OrdersForStoresRecord>>(
                                                                            stream:
                                                                                queryOrdersForStoresRecord(
                                                                              queryBuilder: (ordersForStoresRecord) => ordersForStoresRecord.where('bundleId', isEqualTo: widget.bundleId).where('type', isEqualTo: 'normal'),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    child: SpinKitCircle(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 50,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<OrdersForStoresRecord> columnOrdersForStoresRecordList = snapshot.data;
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(columnOrdersForStoresRecordList.length, (columnIndex) {
                                                                                  final columnOrdersForStoresRecord = columnOrdersForStoresRecordList[columnIndex];
                                                                                  return StreamBuilder<List<StoresRecord>>(
                                                                                    stream: queryStoresRecord(
                                                                                      queryBuilder: (storesRecord) => storesRecord.where('id', isEqualTo: columnOrdersForStoresRecord.store),
                                                                                      singleRecord: true,
                                                                                    ),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 50,
                                                                                            height: 50,
                                                                                            child: SpinKitCircle(
                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              size: 50,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      List<StoresRecord> rowStoresRecordList = snapshot.data;
                                                                                      final rowStoresRecord = rowStoresRecordList.isNotEmpty ? rowStoresRecordList.first : null;
                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.03,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(-1, 0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                InkWell(
                                                                                                  onTap: () async {
                                                                                                    await actions.deleteOrder(
                                                                                                      columnOrdersForStoresRecord.id,
                                                                                                    );
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.clear_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                    size: 20,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.1,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                              child: Text(
                                                                                                rowStoresRecord.name,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Colors.black,
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.05,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                              child: Text(
                                                                                                columnOrdersForStoresRecord.amountOfProducts.toString(),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Colors.black,
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.08,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                                                                                              child: Text(
                                                                                                columnOrdersForStoresRecord.statusForAdmin,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Colors.black,
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.05,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(-1, 0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                InkWell(
                                                                                                  onTap: () async {
                                                                                                    final selectedFile = await selectFile(allowedExtensions: ['pdf']);
                                                                                                    if (selectedFile != null) {
                                                                                                      showUploadMessage(
                                                                                                        context,
                                                                                                        'Uploading file...',
                                                                                                        showLoading: true,
                                                                                                      );
                                                                                                      final downloadUrl = await uploadData(selectedFile.storagePath, selectedFile.bytes);
                                                                                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                                      if (downloadUrl != null) {
                                                                                                        setState(() => uploadedFileUrl = downloadUrl);
                                                                                                        showUploadMessage(
                                                                                                          context,
                                                                                                          'Success!',
                                                                                                        );
                                                                                                      } else {
                                                                                                        showUploadMessage(
                                                                                                          context,
                                                                                                          'Failed to upload file',
                                                                                                        );
                                                                                                        return;
                                                                                                      }
                                                                                                    }

                                                                                                    final ordersForStoresUpdateData = createOrdersForStoresRecordData(
                                                                                                      guide: uploadedFileUrl,
                                                                                                      isByGuide: true,
                                                                                                      shipmentType: 'paqueteria',
                                                                                                    );
                                                                                                    await columnOrdersForStoresRecord.reference.update(ordersForStoresUpdateData);
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.upload_rounded,
                                                                                                    color: Color(0xFF1EEBBD),
                                                                                                    size: 24,
                                                                                                  ),
                                                                                                ),
                                                                                                if ((columnOrdersForStoresRecord.guide != null) && (columnOrdersForStoresRecord.guide != ''))
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                                    child: Icon(
                                                                                                      Icons.download_done_rounded,
                                                                                                      color: Color(0xFF4FE124),
                                                                                                      size: 24,
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.04,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(-1, 0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                ToggleIcon(
                                                                                                  onPressed: () async {
                                                                                                    final ordersForStoresUpdateData = createOrdersForStoresRecordData(
                                                                                                      isSentBySeller: !columnOrdersForStoresRecord.isSentBySeller,
                                                                                                    );
                                                                                                    await columnOrdersForStoresRecord.reference.update(ordersForStoresUpdateData);
                                                                                                  },
                                                                                                  value: columnOrdersForStoresRecord.isSentBySeller,
                                                                                                  onIcon: Icon(
                                                                                                    Icons.check_box,
                                                                                                    color: Color(0xFF1EEBBD),
                                                                                                    size: 24,
                                                                                                  ),
                                                                                                  offIcon: Icon(
                                                                                                    Icons.check_box_outline_blank,
                                                                                                    color: Color(0xFF1EEBBD),
                                                                                                    size: 24,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.of(context).size.width * 0.09,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(-1, 0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                ToggleIcon(
                                                                                                  onPressed: () async {
                                                                                                    final ordersForStoresUpdateData = createOrdersForStoresRecordData(
                                                                                                      isCollectedByAdmin: !columnOrdersForStoresRecord.isCollectedByAdmin,
                                                                                                    );
                                                                                                    await columnOrdersForStoresRecord.reference.update(ordersForStoresUpdateData);
                                                                                                  },
                                                                                                  value: columnOrdersForStoresRecord.isCollectedByAdmin,
                                                                                                  onIcon: Icon(
                                                                                                    Icons.check_box,
                                                                                                    color: Color(0xFF1EEBBD),
                                                                                                    size: 24,
                                                                                                  ),
                                                                                                  offIcon: Icon(
                                                                                                    Icons.check_box_outline_blank,
                                                                                                    color: Color(0xFF1EEBBD),
                                                                                                    size: 24,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          30,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                    child: Text(
                                                                      'ESPECIFICA EL MÉTODO DE ENVÍO PARA EL CLIENTE',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0xFF909090),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          20,
                                                                          20,
                                                                          20),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            'REPARTIDOR',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFF909090),
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 150,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: TextFormField(
                                                                                    controller: textController2 ??= TextEditingController(
                                                                                      text: pedidoPorAceptar5DIASOrdersForClientsRecord.deliverer,
                                                                                    ),
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      'textController2',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Email',
                                                                                      hintText: 'Email',
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFFE6E6E6),
                                                                                          width: 1,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFFE6E6E6),
                                                                                          width: 1,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                      ),
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              delivererId = await actions.getDelivererIdFromEmail(
                                                                                textController2?.text ?? '',
                                                                              );

                                                                              final ordersForClientsUpdateData = createOrdersForClientsRecordData(
                                                                                assignedDeliverer: delivererId,
                                                                                deliverer: textController2?.text ?? '',
                                                                              );
                                                                              await pedidoPorAceptar5DIASOrdersForClientsRecord.reference.update(ordersForClientsUpdateData);

                                                                              setState(() {});
                                                                            },
                                                                            text:
                                                                                'Asignar',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 100,
                                                                              height: 30,
                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Colors.white,
                                                                                    fontSize: 14,
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: 5,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Text(
                                                                              'PAQUETERÍA',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Color(0xFF909090),
                                                                                    fontSize: 15,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width * 0.1,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                                child: TextFormField(
                                                                                  controller: textController3 ??= TextEditingController(
                                                                                    text: pedidoPorAceptar5DIASOrdersForClientsRecord.parcelName,
                                                                                  ),
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    'textController3',
                                                                                    Duration(milliseconds: 2000),
                                                                                    () => setState(() {}),
                                                                                  ),
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: 'Paquetería',
                                                                                    hintText: 'Paquetería',
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: Color(0xFFE6E6E6),
                                                                                        width: 1,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                    ),
                                                                                    focusedBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: Color(0xFFE6E6E6),
                                                                                        width: 1,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(5),
                                                                                    ),
                                                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                child: Container(
                                                                                  width: 160,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: TextFormField(
                                                                                    controller: textController4 ??= TextEditingController(
                                                                                      text: pedidoPorAceptar5DIASOrdersForClientsRecord.parcelGuide,
                                                                                    ),
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      'textController4',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'No. Guía',
                                                                                      hintText: 'No. Guía',
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFFE6E6E6),
                                                                                          width: 1,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFFE6E6E6),
                                                                                          width: 1,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                      ),
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                child: Container(
                                                                                  width: 190,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x00EEEEEE),
                                                                                  ),
                                                                                  child: TextFormField(
                                                                                    controller: textController5 ??= TextEditingController(
                                                                                      text: pedidoPorAceptar5DIASOrdersForClientsRecord.parcelLink,
                                                                                    ),
                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                      'textController5',
                                                                                      Duration(milliseconds: 2000),
                                                                                      () => setState(() {}),
                                                                                    ),
                                                                                    autofocus: true,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      labelText: 'Link de Rastreo',
                                                                                      hintText: 'Link de Rastreo',
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFFE6E6E6),
                                                                                          width: 1,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFFE6E6E6),
                                                                                          width: 1,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5),
                                                                                      ),
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      final ordersForClientsUpdateData = createOrdersForClientsRecordData(
                                                                                        parcelName: textController3?.text ?? '',
                                                                                        parcelGuide: textController4?.text ?? '',
                                                                                        parcelLink: textController5?.text ?? '',
                                                                                      );
                                                                                      await pedidoPorAceptar5DIASOrdersForClientsRecord.reference.update(ordersForClientsUpdateData);
                                                                                    },
                                                                                    text: 'Guardar',
                                                                                    options: FFButtonOptions(
                                                                                      width: 100,
                                                                                      height: 30,
                                                                                      color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                      textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Colors.white,
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                      elevation: 0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1,
                                                                                      ),
                                                                                      borderRadius: 5,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  if (!(pedidoPorAceptar5DIASOrdersForClientsRecord
                                                          .isFromSellerWiseOrder) ??
                                                      true)
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.55,
                                                      height: 180,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 10, 10),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Sellers',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          20,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            180,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'NOMBRE DEL SELLER',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color(0xFFAEAEAE),
                                                                                fontSize: 13,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            220,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'PRODUCTOS QUE PUEDE SURTIR',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color(0xFFAEAEAE),
                                                                                fontSize: 13,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text:
                                                                        'Solicitar Productos',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          200,
                                                                      height:
                                                                          30,
                                                                      color: Colors
                                                                          .white,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                      elevation:
                                                                          0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          5,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final storesAvailable = pedidoPorAceptar5DIASOrdersForClientsRecord
                                                                          .totalSuppliersIds
                                                                          .toList()
                                                                          ?.toList() ??
                                                                      [];
                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        storesAvailable
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            storesAvailableIndex) {
                                                                      final storesAvailableItem =
                                                                          storesAvailable[
                                                                              storesAvailableIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            0,
                                                                            20,
                                                                            3),
                                                                        child: StreamBuilder<
                                                                            List<StoresRecord>>(
                                                                          stream:
                                                                              queryStoresRecord(
                                                                            queryBuilder: (storesRecord) =>
                                                                                storesRecord.where('id', isEqualTo: storesAvailableItem),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50,
                                                                                  height: 50,
                                                                                  child: SpinKitCircle(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    size: 50,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<StoresRecord>
                                                                                rowStoresRecordList =
                                                                                snapshot.data;
                                                                            final rowStoresRecord = rowStoresRecordList.isNotEmpty
                                                                                ? rowStoresRecordList.first
                                                                                : null;
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 180,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      child: Text(
                                                                                        rowStoresRecord.name,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 190,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      child: FutureBuilder<ApiCallResponse>(
                                                                                        future: GetSupplierFromNormalOrderCall.call(
                                                                                          storeId: rowStoresRecord.id,
                                                                                          bundleId: widget.bundleId,
                                                                                        ),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return Center(
                                                                                              child: SizedBox(
                                                                                                width: 50,
                                                                                                height: 50,
                                                                                                child: SpinKitCircle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  size: 50,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          final textGetSupplierFromNormalOrderResponse = snapshot.data;
                                                                                          return Text(
                                                                                            GetSupplierFromNormalOrderCall.canSupplyAmount(
                                                                                              (textGetSupplierFromNormalOrderResponse?.jsonBody ?? ''),
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1,
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    setState(() => FFAppState().productsStoreWillSupply = []);
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return Padding(
                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                          child: VerProductosWidget(
                                                                                            storeId: rowStoresRecord.id,
                                                                                            bundleId: widget.bundleId,
                                                                                            customerId: columnOrderBundlesRecord.owner,
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  text: 'Solicitar Productos',
                                                                                  options: FFButtonOptions(
                                                                                    width: 200,
                                                                                    height: 30,
                                                                                    color: Color(0x00F1F1F1),
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Color(0xFFAEAEAE),
                                                                                          fontSize: 14,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                    elevation: 0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: 5,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                  child: StreamBuilder<List<OrdersForStoresRecord>>(
                                                                                    stream: queryOrdersForStoresRecord(
                                                                                      queryBuilder: (ordersForStoresRecord) => ordersForStoresRecord.where('bundleId', isEqualTo: widget.bundleId).where('type', isEqualTo: 'normal').where('store', isEqualTo: rowStoresRecord.id),
                                                                                      singleRecord: true,
                                                                                    ),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 50,
                                                                                            height: 50,
                                                                                            child: SpinKitCircle(
                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              size: 50,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      List<OrdersForStoresRecord> iconOrdersForStoresRecordList = snapshot.data;
                                                                                      // Return an empty Container when the document does not exist.
                                                                                      if (snapshot.data.isEmpty) {
                                                                                        return Container();
                                                                                      }
                                                                                      final iconOrdersForStoresRecord = iconOrdersForStoresRecordList.isNotEmpty ? iconOrdersForStoresRecordList.first : null;
                                                                                      return Icon(
                                                                                        Icons.check_rounded,
                                                                                        color: Color(0xFF4FE124),
                                                                                        size: 24,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  if (pedidoPorAceptar5DIASOrdersForClientsRecord
                                                          .isFromSellerWiseOrder ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.56,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  OrdersForStoresRecord>>(
                                                            stream:
                                                                queryOrdersForStoresRecord(
                                                              queryBuilder: (ordersForStoresRecord) => ordersForStoresRecord
                                                                  .where(
                                                                      'bundleId',
                                                                      isEqualTo:
                                                                          widget
                                                                              .bundleId)
                                                                  .where('type',
                                                                      isEqualTo:
                                                                          'normal'),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        SpinKitCircle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 50,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<OrdersForStoresRecord>
                                                                  rowOrdersForStoresRecordList =
                                                                  snapshot.data;
                                                              // Return an empty Container when the document does not exist.
                                                              if (snapshot.data
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final rowOrdersForStoresRecord =
                                                                  rowOrdersForStoresRecordList
                                                                          .isNotEmpty
                                                                      ? rowOrdersForStoresRecordList
                                                                          .first
                                                                      : null;
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.52,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x00EEEEEE),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              20),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                20,
                                                                                20,
                                                                                20),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                      child: Text(
                                                                                        'FECHA DEL PEDIDO',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Color(0xFF909090),
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                      child: Text(
                                                                                        dateTimeFormat('M/d h:mm a', pedidoPorAceptar5DIASOrdersForClientsRecord.createdDate),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Colors.black,
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                      child: Text(
                                                                                        'ENTREGA ESTIMADA',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Color(0xFF909090),
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                      child: Text(
                                                                                        pedidoPorAceptar5DIASOrdersForClientsRecord.deliverDate,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Colors.black,
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                            child: Text(
                                                                                              'MÉTODO DE PAGO',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    color: Color(0xFF909090),
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                            child: StreamBuilder<List<OrderBundlesRecord>>(
                                                                                              stream: queryOrderBundlesRecord(
                                                                                                queryBuilder: (orderBundlesRecord) => orderBundlesRecord.where('id', isEqualTo: widget.bundleId),
                                                                                                singleRecord: true,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50,
                                                                                                      height: 50,
                                                                                                      child: SpinKitCircle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                        size: 50,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<OrderBundlesRecord> textOrderBundlesRecordList = snapshot.data;
                                                                                                // Return an empty Container when the document does not exist.
                                                                                                if (snapshot.data.isEmpty) {
                                                                                                  return Container();
                                                                                                }
                                                                                                final textOrderBundlesRecord = textOrderBundlesRecordList.isNotEmpty ? textOrderBundlesRecordList.first : null;
                                                                                                return Text(
                                                                                                  textOrderBundlesRecord.paymentMethod,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Montserrat',
                                                                                                        color: Colors.black,
                                                                                                        fontSize: 14,
                                                                                                        fontWeight: FontWeight.normal,
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
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                StreamBuilder<List<OrdersForStoresRecord>>(
                                                                              stream: queryOrdersForStoresRecord(
                                                                                queryBuilder: (ordersForStoresRecord) => ordersForStoresRecord.where('bundleId', isEqualTo: widget.bundleId).where('type', isEqualTo: 'normal'),
                                                                                singleRecord: true,
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50,
                                                                                      height: 50,
                                                                                      child: SpinKitCircle(
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        size: 50,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<OrdersForStoresRecord> rowOrdersForStoresRecordList = snapshot.data;
                                                                                // Return an empty Container when the document does not exist.
                                                                                if (snapshot.data.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final rowOrdersForStoresRecord = rowOrdersForStoresRecordList.isNotEmpty ? rowOrdersForStoresRecordList.first : null;
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 250,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x00EEEEEE),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                              child: Text(
                                                                                                'VENDEDOR',
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Montserrat',
                                                                                                      color: Color(0xFF909090),
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            StreamBuilder<List<StoresRecord>>(
                                                                                              stream: queryStoresRecord(
                                                                                                queryBuilder: (storesRecord) => storesRecord.where('id', isEqualTo: rowOrdersForStoresRecord.store),
                                                                                                singleRecord: true,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 50,
                                                                                                      height: 50,
                                                                                                      child: SpinKitCircle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                        size: 50,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<StoresRecord> rowStoresRecordList = snapshot.data;
                                                                                                // Return an empty Container when the document does not exist.
                                                                                                if (snapshot.data.isEmpty) {
                                                                                                  return Container();
                                                                                                }
                                                                                                final rowStoresRecord = rowStoresRecordList.isNotEmpty ? rowStoresRecordList.first : null;
                                                                                                return Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 52,
                                                                                                      height: 52,
                                                                                                      clipBehavior: Clip.antiAlias,
                                                                                                      decoration: BoxDecoration(
                                                                                                        shape: BoxShape.circle,
                                                                                                      ),
                                                                                                      child: Image.network(
                                                                                                        valueOrDefault<String>(
                                                                                                          rowStoresRecord.logo,
                                                                                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                          child: Text(
                                                                                                            rowStoresRecord.name,
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Montserrat',
                                                                                                                  color: Colors.black,
                                                                                                                  fontSize: 14,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                          child: Text(
                                                                                                            rowStoresRecord.address,
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Montserrat',
                                                                                                                  color: Color(0xFFAEAEAE),
                                                                                                                  fontSize: 12,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  fontStyle: FontStyle.italic,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0,
                                                                      20,
                                                                      0,
                                                                      20),
                                                          child: Text(
                                                            'Productos',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final productsInOrder =
                                                          GetSuborderInfoCall
                                                                  .products(
                                                                (rowGetSuborderInfoResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList() ??
                                                              [];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            productsInOrder
                                                                .length,
                                                            (productsInOrderIndex) {
                                                          final productsInOrderItem =
                                                              productsInOrder[
                                                                  productsInOrderIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        20),
                                                            child: StreamBuilder<
                                                                List<
                                                                    ProductsRecord>>(
                                                              stream:
                                                                  queryProductsRecord(
                                                                queryBuilder: (productsRecord) =>
                                                                    productsRecord.where(
                                                                        'id',
                                                                        isEqualTo:
                                                                            getJsonField(
                                                                          productsInOrderItem,
                                                                          r'''$.productId''',
                                                                        ).toString()),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          SpinKitCircle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            50,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ProductsRecord>
                                                                    containerProductsRecordList =
                                                                    snapshot
                                                                        .data;
                                                                final containerProductsRecord =
                                                                    containerProductsRecordList
                                                                            .isNotEmpty
                                                                        ? containerProductsRecordList
                                                                            .first
                                                                        : null;
                                                                return Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.56,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            VariantsRecord>>(
                                                                      stream:
                                                                          queryVariantsRecord(
                                                                        parent:
                                                                            containerProductsRecord.reference,
                                                                        queryBuilder: (variantsRecord) => variantsRecord.where(
                                                                            'id',
                                                                            isEqualTo:
                                                                                getJsonField(
                                                                              productsInOrderItem,
                                                                              r'''$.variantId''',
                                                                            ).toString()),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: SpinKitCircle(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 50,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<VariantsRecord>
                                                                            rowVariantsRecordList =
                                                                            snapshot.data;
                                                                        final rowVariantsRecord = rowVariantsRecordList.isNotEmpty
                                                                            ? rowVariantsRecordList.first
                                                                            : null;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                    child: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        containerProductsRecord.mainImage,
                                                                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                                      ),
                                                                                      width: 100,
                                                                                      height: 100,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                                                                      child: Text(
                                                                                        containerProductsRecord.title.maybeHandleOverflow(maxChars: 25),
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 14,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            'x',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              productsInOrderItem,
                                                                                              r'''$.amount''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                            child: Text(
                                                                                              rowVariantsRecord.unit,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                      child: Text(
                                                                                        formatNumber(
                                                                                          rowVariantsRecord.publicPrice,
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.periodDecimal,
                                                                                          currency: '',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    if (!(pedidoPorAceptar5DIASOrdersForClientsRecord.isFromSellerWiseOrder) ?? true)
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Disponible en',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  fontSize: 14,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                            child: Text(
                                                                                              containerProductsRecord.stores.toList().length.toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                            child: Text(
                                                                                              ' sellers',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            if (!(pedidoPorAceptar5DIASOrdersForClientsRecord.isFromSellerWiseOrder) ??
                                                                                true)
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Surtir como Sr. Construcción',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                      ToggleIcon(
                                                                                        onPressed: () async {
                                                                                          setState(() => FFAppState().toggleIcon = !FFAppState().toggleIcon);
                                                                                        },
                                                                                        value: FFAppState().toggleIcon,
                                                                                        onIcon: Icon(
                                                                                          Icons.check_box,
                                                                                          color: FlutterFlowTheme.of(context).green,
                                                                                          size: 25,
                                                                                        ),
                                                                                        offIcon: Icon(
                                                                                          Icons.check_box_outline_blank,
                                                                                          color: FlutterFlowTheme.of(context).green,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 30, 20),
                      child: StreamBuilder<List<OrderBundlesRecord>>(
                        stream: queryOrderBundlesRecord(
                          queryBuilder: (orderBundlesRecord) =>
                              orderBundlesRecord.where('id',
                                  isEqualTo: widget.bundleId),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitCircle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<OrderBundlesRecord>
                              columnOrderBundlesRecordList = snapshot.data;
                          final columnOrderBundlesRecord =
                              columnOrderBundlesRecordList.isNotEmpty
                                  ? columnOrderBundlesRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                                  child: Text(
                                                    'USUARIO',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xFF909090),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  columnOrderBundlesRecord
                                                      .customerName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                shape: BoxShape.circle,
                                              ),
                                              child: StreamBuilder<
                                                  List<UsersRecord>>(
                                                stream: queryUsersRecord(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord.where('uid',
                                                          isEqualTo:
                                                              pedidoPorAceptar5DIASOrdersForClientsRecord
                                                                  .customerId),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child: SpinKitCircle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsersRecord>
                                                      circleImageUsersRecordList =
                                                      snapshot.data;
                                                  // Return an empty Container when the document does not exist.
                                                  if (snapshot.data.isEmpty) {
                                                    return Container();
                                                  }
                                                  final circleImageUsersRecord =
                                                      circleImageUsersRecordList
                                                              .isNotEmpty
                                                          ? circleImageUsersRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    width: 120,
                                                    height: 120,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        circleImageUsersRecord
                                                            .photoUrl,
                                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                      ),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                                  child: Text(
                                                    'TELÉFONO',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xFF909090),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  columnOrderBundlesRecord
                                                      .customerPhone,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                                  child: Text(
                                                    'DIRECCIÓN',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xFF909090),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  columnOrderBundlesRecord
                                                      .customerAddress
                                                      .maybeHandleOverflow(
                                                          maxChars: 15),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              initialExpanded: false,
                                              child: ExpandablePanel(
                                                header: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(25, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Productos',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 15,
                                                                ),
                                                      ),
                                                      Text(
                                                        '\$883.12',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 15,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                collapsed: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                ),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25, 0, 35, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Producto 1',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '\$500.00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Producto 2',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '\$501.00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25, 0, 35, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Subtotal',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '\$500.00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Descuento',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '-\$1.00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Subtotal pagado',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '\$999.00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Cargo por venta',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '-\$115.88',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              initialExpanded: false,
                                              child: ExpandablePanel(
                                                header: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(25, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Envío',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 15,
                                                                ),
                                                      ),
                                                      Text(
                                                        '\$9.37',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 15,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                collapsed: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                ),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25, 0, 35, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Enviado por',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '[Enviador]',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Distancia total',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '1.6 km',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25, 0, 35, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Costo de Envío',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '\$10.60',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Cargo por envío',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '-\$1.23',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              initialExpanded: false,
                                              child: ExpandablePanel(
                                                header: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(25, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Impuestos',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 15,
                                                                ),
                                                      ),
                                                      Text(
                                                        '-\$211.95',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 15,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                collapsed: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                ),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25, 0, 35, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Retención ISR',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '-\$52.99',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Retención IVA',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '-\$141.30',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25, 0, 35, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Retención 2%',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '-\$17.66',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              initialExpanded: false,
                                              child: ExpandablePanel(
                                                header: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(25, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Monto a pagar',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 15,
                                                                ),
                                                      ),
                                                      Text(
                                                        '\$671.17',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFF1EEBBD),
                                                                  fontSize: 15,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                collapsed: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                ),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25, 0, 35, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        10),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Monto a pagar',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '\$671.17',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xFFAEAEAE),
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
