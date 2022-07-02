import '../ajustes/ajustes_widget.dart';
import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/logo_completo_widget.dart';
import '../components/notifications_widget.dart';
import '../components/ver_sellers2_widget.dart';
import '../cotizacione_pendientes/cotizacione_pendientes_widget.dart';
import '../dashboard/dashboard_widget.dart';
import '../finanzastodaslascompras/finanzastodaslascompras_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
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

class PedidoEnPreparacion5DIASWidget extends StatefulWidget {
  const PedidoEnPreparacion5DIASWidget({
    Key key,
    this.bundleId,
    this.orderId,
  }) : super(key: key);

  final String bundleId;
  final String orderId;

  @override
  _PedidoEnPreparacion5DIASWidgetState createState() =>
      _PedidoEnPreparacion5DIASWidgetState();
}

class _PedidoEnPreparacion5DIASWidgetState
    extends State<PedidoEnPreparacion5DIASWidget> {
  String delivererIdFromAPI;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                    StreamBuilder<List<OrdersForClientsRecord>>(
                      stream: queryOrdersForClientsRecord(
                        queryBuilder: (ordersForClientsRecord) =>
                            ordersForClientsRecord.where('id',
                                isEqualTo: widget.orderId),
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
                        List<OrdersForClientsRecord>
                            rowOrdersForClientsRecordList = snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final rowOrdersForClientsRecord =
                            rowOrdersForClientsRecordList.isNotEmpty
                                ? rowOrdersForClientsRecordList.first
                                : null;
                        return Row(
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
                            if (!(rowOrdersForClientsRecord
                                    .isFromSellerWiseOrder) ??
                                true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final ordersForClientsUpdateData =
                                        createOrdersForClientsRecordData(
                                      status: 'delivering',
                                      statusForClient:
                                          'En camino a tu dirección',
                                    );
                                    await rowOrdersForClientsRecord.reference
                                        .update(ordersForClientsUpdateData);
                                  },
                                  text: 'Enviar  Pedido',
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
                        );
                      },
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
        child: StreamBuilder<List<OrdersForClientsRecord>>(
          stream: queryOrdersForClientsRecord(
            queryBuilder: (ordersForClientsRecord) =>
                ordersForClientsRecord.where('id', isEqualTo: widget.orderId),
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
            List<OrdersForClientsRecord> rowOrdersForClientsRecordList =
                snapshot.data;
            final rowOrdersForClientsRecord =
                rowOrdersForClientsRecordList.isNotEmpty
                    ? rowOrdersForClientsRecordList.first
                    : null;
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
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
                                tileColor:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
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
                                  reverseDuration: Duration(milliseconds: 0),
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: StreamBuilder<List<OrderBundlesRecord>>(
                      stream: queryOrderBundlesRecord(
                        queryBuilder: (orderBundlesRecord) => orderBundlesRecord
                            .where('id', isEqualTo: widget.bundleId),
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
                        List<OrderBundlesRecord> columnOrderBundlesRecordList =
                            snapshot.data;
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.56,
                                  decoration: BoxDecoration(),
                                  child: Padding(
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
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                widget.orderId,
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
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 5),
                                                child: Text(
                                                  'PREPARACIÓN',
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
                                            Container(
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
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
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
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 20, 0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 20),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.56,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (!(rowOrdersForClientsRecord
                                                            .isFromSellerWiseOrder) ??
                                                        true)
                                                      Column(
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              20),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                            'M/d h:mm a',
                                                                            rowOrdersForClientsRecord.createdDate),
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        'ENTREGA ESTIMADA',
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              20),
                                                                      child:
                                                                          Text(
                                                                        rowOrdersForClientsRecord
                                                                            .deliverDate,
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        20,
                                                                        0),
                                                            child: Container(
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
                                                                          0.4,
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
                                                                                40,
                                                                                5),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
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
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                                                                                    child: StreamBuilder<List<StoresRecord>>(
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
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
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
                                                                                          ],
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
                                                                              30,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                120,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00EEEEEE),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                              child: Text(
                                                                                'ENTREGA',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Color(0xFF909090),
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              100,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00EEEEEE),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                20),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 20,
                                                                                      height: 20,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFF59E149),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 3,
                                                                                      height: 20,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFF59E149),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 20,
                                                                                      height: 20,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFF59E149),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 3,
                                                                                      height: 20,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFF59E149),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 20,
                                                                                      height: 20,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFFEEEEEE),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 3,
                                                                                      height: 20,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFFEEEEEE),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: 20,
                                                                                      height: 20,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFFEEEEEE),
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 3,
                                                                                        height: 8,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x00EEEEEE),
                                                                                          shape: BoxShape.rectangle,
                                                                                        ),
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Buscando Repartidor',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                                  fontSize: 12,
                                                                                                ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 3,
                                                                                            height: 23,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x0059E149),
                                                                                              shape: BoxShape.rectangle,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Recolectando Productos',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 12,
                                                                                                ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 3,
                                                                                            height: 23,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x0059E149),
                                                                                              shape: BoxShape.rectangle,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'En camino a tu dirección',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                                  fontSize: 12,
                                                                                                ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 3,
                                                                                            height: 23,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x0059E149),
                                                                                              shape: BoxShape.rectangle,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Entregado',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                                  fontSize: 12,
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
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 20,
                                                                  20, 20),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          StreamBuilder<
                                                              List<
                                                                  DeliverersRecord>>(
                                                            stream:
                                                                queryDeliverersRecord(
                                                              queryBuilder: (deliverersRecord) =>
                                                                  deliverersRecord.where(
                                                                      'email',
                                                                      isEqualTo:
                                                                          rowOrdersForClientsRecord
                                                                              .deliverer),
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
                                                              List<DeliverersRecord>
                                                                  columnDeliverersRecordList =
                                                                  snapshot.data;
                                                              // Return an empty Container when the document does not exist.
                                                              if (snapshot.data
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final columnDeliverersRecord =
                                                                  columnDeliverersRecordList
                                                                          .isNotEmpty
                                                                      ? columnDeliverersRecordList
                                                                          .first
                                                                      : null;
                                                              return Column(
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                    child: Text(
                                                                      'REPARTIDOR',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0xFF909090),
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              30,
                                                                          height:
                                                                              30,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              columnDeliverersRecord.photoUrl,
                                                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.fitWidth,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              3,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            columnDeliverersRecord.displayName,
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
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      rowOrdersForClientsRecord
                                                                          .deliverer,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
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
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          if ((rowOrdersForClientsRecord
                                                                  .parcelName) !=
                                                              '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          70,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Column(
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                    child: Text(
                                                                      'PAQUETERÍA',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0xFF909090),
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              30,
                                                                          height:
                                                                              30,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABU1BMVEW/DQ3///+6AADEXGH9//++Dgv//f+wAAC2AAC8AAC9DQ38/vy+AACzAAD6///CCw2qAADWrKvkuLDLoZraurb1////+v+nAACdAACxLSj//frFAAD/9/CiAAD5/f/lxsCyEhv4//n7//aaAAC3EQv/9vXHCQvJjon/7+3y//jw/f/CXVrBXmLWoKKyPjq2SEm2EBPNiYaiHh6rGSGoHRbUAA6TJBn/7/bYkY79zMHLmZXafX6/ZWvWraHfubLnysyyVFT77ODw3duoREi/dnDaqbS4hX/LgYaualy9Q0PIXFmnVVS0cnjJVl68YGfDVmWtISytZ2akMzv30cHcnaqfQzLMAxu2OTf108+1h4GiQ1LOjZbDgXP00+G8amGeRUa2ITPFQU21TEHHmqDh0MrtwciuTkS9opuhKi3iraeqMUCeMTHShY7Tmo3r1czWwLfGa1uRoSeTAAAPZ0lEQVR4nO2a61fbSJbArYpUeqvsgGQj2QIZubABYzuQSYameRinMzTd6aQ33dC7CbuTabKwmTD7/3/aW1WysQ1ssuf0mbMf7u8ckiBV1a1bVfdVSqmEIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIP9/YTkzmOE4Ts6NPP+aHgbLHW4oHMaML3bIWW4wRzQ2+Fc0/6PhOe8/WQGerGyv8K/pYRjcM/0VxfZO/sVJG0/726r1n/qlf76GzPAG7TrQelZ/bn5ND4f4h4uyi+DP5ZLzpQ7+bqslRdS/8dkfMOf/G4bhLwcaEKTBnvc1Pfrlb5uaputU9Ar3TedLGjLzQA90IcI9tP6pGsoDYxi1o9TNANd98qCG00qYXRppbuaCkrquDewvakjK7ZAKCbS+6tlfnta943GYA4PZzp5y8Ss0B28ALiQ3Zl474C0YPMmTrbgpdoOGw6phQFvxMyvEEW5CDsh57vXiyNXFloTU1egxN+DtvC3CXDhTUzCYd6zJLdT084YwfJbftXfGCjfHwCcxVgIXNtcCFGSl0vxjVpqoaMztT54zeA76kJEeSw21F75jjBdldnDGuaOkcO5fd2KlYXv3u+8GK5zwuycPRr+di/cyCOSR1rrkKfjVp/e4bAdUcgoV2X0aipc8sW3Ptm0iEf/wPOIl4hBxzhi37eKl+NMjppXnlu0l/nWQCemd7Ado7Ym1sOyE3GLbluV56kj7xFsdrscZ1WFFPpmeTUowdOKRsdiii+fZsFYQg2BCpPoiDCIhIv6L5flM+OKZ5mpeniEVN+DfRn7PQWWlvLz9aPOnR7NsnFSFneR9Un0y9+Z7h9snrx49Oh0qDbXoh+8f7Z3YZOXHR5tzw2y+OjHFGfBOXv10qK3HHaFh63RjY+OMGE759Y/zHX7cPC57oCDpPdrcPAUzlM4serOxuXlWylc2Ht1hc6ucyA2vbm4+8Z07x4Jx0qiokzBLPLwiYHLk+KA++0I/WnUabdHCVf2CQIs1/bmVvKHxPeMc7MCprg21SE/TGLyMeNiMtU2f17r3CNa1g5/h0FdbUkKqNEyFPXwm9si9b6b7O31QY/Tnhd3zb/z81znLNpzGtZIqRpdObizp3HSYOWopGZP3abBcZVvgM7SZx9oesbuU6reNJ7wwHf66nqZT42Rpa9v3K/HMEFJyoFF62XC8kzm9YTUPidW928Glaatb5qT3L6dvu79c9vx5DVl+3LxvC2GM+MxKTuud4iiOSemaT0YanX2q1V8Tc1nXg2BqkYpxnq3k3l6WBrdiIMidr3q9IL0rlVKw07O+N9CmZ+VqQRY3ePlcaTYtI9CjtF1mZvflu9/+9fGbiuXMacitfwvu11ADDf1lPZw5erBL0WFiVnS3M9traNr9ljaWTIFbDbcNv+vScPwELDGk11byXH9gabUtx1yc1ZCmnZsyX6lHd1oHOg2ihuG9OHz3/v3Fvx9YdyzRPIiy+zVsV43/aMLazb1+9iSpDjV3ziIWPfLX+4fRhoRXzzU6u2OjxPyd3mNVYomerfLG8M6brp/8qN/VUNez5kHV8HYHo4vHvdFbcz5a8FqdynWP9crHk16vd7zcjNRyH5j+xWQhqVvpffjY6338cJYzG9qd/tByg4iGkXbw8cOH3o5T6q8sTfFpmMFrsZWVpMqWllb+Ju0wo+HCVq930jeq7aYM59Rd7H3onfSOf5dywki/rPEcJHwYqaQwin6HHr0lz5kRsPSLXIWUpkGX5OzT+Zuzq99utpL5pMD7OY6khuFNlSQQ1szdph7KpVrwwN4mS3VZ9WRMFQHfYYSXX8ZuQOG8BV2TezwvcSeHaMvA04u/WPUgTpUP+iHJmWOVK3IcN4o3TAcGAcFNqUH4vkYcK0m8hULDoGvxUr9fMgfjXdr1IU5yEdotETKFCJIkjUvZAX72EoP7p+fdyvlh2ZhLOkrWQFeHhS4kVQI7bF66QUh1WPyLhH2cuNmw4hOYGGRIkATkOWj4WHN18BlBc8805OOSY0ME9wQwodU2OEBXJM5XCSwNqbUzuYdBverIjGiguUrDXc/ymJfXzqUgGPAVpBRQEfr7utI52PQskSaK9IOJ5EKxKsMYWGFrCfIdnpjHPR+Wet4OzUqo7ND9TwjmwMdWGK27IvNo2L9W25M9HF55XACTg01KuDnUqO5maVp/zbkhcjPDr15tQszflLyJAwoRM6DPapCjGP5VKO3QDW78khgC5q9CS7wLPTa+3ziVE5YDQlUN+WrtSGqYuq3tREg2eKm6erax8T20h1Ri87uo2PSh74gMmCceKOrMaciqwzCVe+iOdysIo1C44CGsNVkDM3DFSdDD9rElsmhR1Zdyx7oSLlYPaHBTdeB53yA73eGU6wg10FCEt0shXySxckKRWyFQ57NS9QiiuV4cM/lG6ttJQXBJZL52T4WxNLgxc8fp93NvZ/c9ncSJOC6WjO57kK3LqZXAhOaChbfU0iZuHBxkAc1oUDFLzCnvg+WLDY1pUL/whQXIPIFZe7IHmJqs8+D0nA7FQugxAAWVppJyOO9rouwxrIpSJXJHFhxSLnIA6go7dYVY+aPmHXxrybUn36gUIQ2+JVA0OMw6HMaiuoxEPZV1Ok1Z2WSRPni4OmUlcgGxmyp7viWAXWxeENAwL1/DJCHDh3QrjF+uJuM83lTpBWRTa3JCyWHUiYtVyqIo64SFhvRQyDcgXiirqm8RoaG31wxSSoNQ5QgTIjcYyQmzcjdVp1QbESiMONmop3EnboHvBGgUx4WG2tZDGorC0OwGYw2nJdFQj3/2RLFGzFGdgksI3Ajmew1uUGnYuFEaNuOeLe4nntSjZ2KzaegKb+FqykgC2q4Ku7C3W6myg6MGHEED5g8HXGgIOcQ0YUj/y1YShipfDFpnhDvEuGqGUeTGsHlScAhKyhWNlISHNKwehEUC/XiG/etrU5SNPCf2p/ciDaFuB5Zzv6HWi/Xrqdz4ZrvvQfgw92FLMqHC9dpgsDZ4t6BOaQBRVWr4qHit/cOHlTOc1QMdwi5Y4rPFWcnX131fSOA7sbLMYNiwoPQt79NWJ4iCrN5dk1TiUGl4YN5f3EOxCZ6kIXfPpevtmumbE3xg0stbfRu5yqppcL7NOGTy3uG4sFj2wW2wbfU66vQsUbgl/kAucDMKdokIo9YuLar1v5tQijteTeWCcdheNacRgqVkb09X2X24D8c65z+LKx5o39oSEizT+6wcEc0G5KFrOPCrZAPsX4eiJgB/IerOgrmG5C8qIYyj9c5+jYGGEEaV1Wm7llHitgzOOtW7VTkKrx0FhZFc2OICobxM1RZqx5bQ0N5QGrraojkld0qyBWmr6rFGIALbA2l1Kd01+xB8mVdtF3E8PrQf0hD21l8TGtI4pOAv2O21kboQmPzm2cpzggtJ6SlxGK8u6nL8THsFboBb+1LDNNyTNmTYL93CSOIdLu5Cau1Cw/aquN91QLDs4dJde1bW+Jfqsp7KTYoPwQwN/7E8kwHdSPo54475WY+kztrRzoN3VCx3zIPilNJ3MmpOCZpeijy5osWEqP4CIjZvtJWRZK0d62nuEJVAhdpAXGsy67SlFRoOy1y47GM3jaWGN6bR50bJXFYaZtpvXsm5RzDbaRfpcX0FJIxvLiEHtMBPOY1XdRqqY3BT/l9u4Vhf5ixCw5sG2GF5gmlywxNWIWyjTGq7KpgFmRtcQn2SnGnKlbv1Vf6U5d4l1ONihW9qkGBWN9uhylf0oGIRgxtwqMG9QtqtL/gQ2SAUtFOlobtcK88aYskRly1eDwoA5XxXk6clx1+WM3Ddg1XInstv2uk4BnT9O7drYxwYRhujHy1PcznyzMFiwT8Wl2k4bhic+w6zXxZ5QtR8vtpwiF0RJhVHaWf5eOdTN6JF6hG53xADNIRyTxhRJ9IvfIiyzOvFyogCt3W+OM3+f1sloaE1CCMVXuLP1YbjWJWi+IqXf2l8um7dFq17/nyufath7g0m7SC/iugk7If6G1I9gDOhbhZ0N5oUZuEiKTnla00JjILW8Dzn1gZkCVqHRusZbUf6ZDkoREtxJ6rKPUgF6kuWWFr/ZaY01LPYnbkSCCDREJdt5uOwKB+z5vCyyr2RSvHS0K0Pm5l7W9Zdkbu3TxM79PZvR3enidpLSa3uUjdTOVyW3WacF4QZ5fNxRQJJyXJZqJCChrAQURbT4hpXAFU0ZK3GlZp9nB41xNIa5rVKgCAgwvK5U9KjJU9UB075JojUMQw64WKZezttdewh0K/T6PY+aFhlD3744rm3fHs7BCcrgj2EgkeIPKpZP8UZjTP4Lcgg3Bca6ppIgxk4iuIqKnbj5yR/SiAJg4IrczPIxaausw7KIh0me+osUH0fzBAyDfOy01IaFilNUKAPq0RWmeUbWmgYx9p3UBT5I3GgXMjVMpF/TOa97PP+g36GWy91mqYRjefRXvjmWxhcm31M18PhmQ0zJHs0FQU8lC7rWU+Ej/KaGAjSNVdkbnoUZ6IDVLdgdqb3NhC/pWnrg7za5P4alULHWhYThr8WSVXektujZqrcdSuMt8AwnHI3BgliA+CYpGEa6VLEeYM/+PUSlqr2mGpzV2OKQWLe3H2qR8t/IkI+K39uijxWLGZrRXzuzMvftMMA5IK/jc8XC0egxyMPwuXqUIWW5oWfF2tbOP85NG3k9aWGzFnU1ev14NmK/AJirtVhk9NUj9bDgxcR7LiU8ebOzcz0OWW10cK9LFnO4O7Ttb+W1VcI56n5sVsB/raw8FmmkX1mXnWHLdjn+s2obB7uyg7dhc/9ap5sdLuy+w5RkY/lrPyuci9niVN82qptSgkLu92BJZ8k5uvrI7Ft7eVRo7GxuysHXfj7r/yhnAbKaO54NiEzXw4kJuSe1p2nxPNEwiQiNGeyk2VZnq+ufiAH9BtXhxcnK2bCjXEHQiD/YKYpB7M4BGvZNs9ZQizZf47cLor0nCfQDdqYlsnlRyLYer8BNf7WjulZBoHwrebqPPgtWdwolWQiY8yTw9EyZJo495jJT0wOFI7yCxucT94ff/kxbO55CRHf9uWnLtHBKOVw4EqyrSHuUAw1eyjCxPB3BMs7BHXoJt1YSWko/hcAhzWzxSctcQtQvP2q/0OAIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIH8U/wMJ/7BVfwo+CAAAAABJRU5ErkJggg==',
                                                                            fit:
                                                                                BoxFit.fitWidth,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            rowOrdersForClientsRecord.parcelName,
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
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            3),
                                                                    child: Text(
                                                                      rowOrdersForClientsRecord
                                                                          .parcelGuide,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            3),
                                                                    child: Text(
                                                                      rowOrdersForClientsRecord
                                                                          .parcelLink,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).green,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (rowOrdersForClientsRecord
                                                            .isFromSellerWiseOrder ??
                                                        true)
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.56,
                                                        decoration:
                                                            BoxDecoration(),
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
                                                                                        dateTimeFormat('M/d h:mm a', rowOrdersForClientsRecord.createdDate),
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
                                                                                        rowOrdersForClientsRecord.deliverDate,
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
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                              'MÉTODO DE ENVÍO',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    color: Color(0xFF909090),
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: 150,
                                                                                            height: 50,
                                                                                            child: Stack(
                                                                                              children: [
                                                                                                if ((rowOrdersForStoresRecord.deliveredBy) == 'Mi Repartidor')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                    child: Text(
                                                                                                      'Repartidor propio',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            color: Colors.black,
                                                                                                            fontSize: 14,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                if ((rowOrdersForStoresRecord.deliveredBy) == 'Solicitar Repartidor')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                    child: Text(
                                                                                                      'Solicita repartidor',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Montserrat',
                                                                                                            color: Colors.black,
                                                                                                            fontSize: 14,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                if ((rowOrdersForStoresRecord.deliveredBy) == 'Paquetería / Flete / Otro')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                    child: Text(
                                                                                                      'Paquetería / Flete / Otro',
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
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          if ((rowOrdersForStoresRecord.deliveredBy) ==
                                                                              'Solicitar Repartidor')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                                                    child: Text(
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
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                              controller: textController ??= TextEditingController(
                                                                                                text: rowOrdersForClientsRecord.deliverer,
                                                                                              ),
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                'textController',
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        delivererIdFromAPI = await actions.getDelivererIdFromEmail(
                                                                                          textController?.text ?? '',
                                                                                        );

                                                                                        final ordersForClientsUpdateData = createOrdersForClientsRecordData(
                                                                                          assignedDeliverer: delivererIdFromAPI,
                                                                                          deliverer: textController?.text ?? '',
                                                                                        );
                                                                                        await rowOrdersForClientsRecord.reference.update(ordersForClientsUpdateData);

                                                                                        final ordersForStoresUpdateData = createOrdersForStoresRecordData(
                                                                                          assignedDeliverer: delivererIdFromAPI,
                                                                                        );
                                                                                        await rowOrdersForStoresRecord.reference.update(ordersForStoresUpdateData);

                                                                                        setState(() {});
                                                                                      },
                                                                                      text: 'Asignar',
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
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 20),
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
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            FutureBuilder<ApiCallResponse>(
                                              future: GetOrderForClientInfoCall
                                                  .call(
                                                orderId: widget.orderId,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final columnGetOrderForClientInfoResponse =
                                                    snapshot.data;
                                                return Builder(
                                                  builder: (context) {
                                                    final productsInOrder =
                                                        GetOrderForClientInfoCall
                                                                .products(
                                                              (columnGetOrderForClientInfoResponse
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
                                                                  .fromSTEB(0,
                                                                      0, 0, 20),
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
                                                              List<ProductsRecord>
                                                                  containerProductsRecordList =
                                                                  snapshot.data;
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
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Padding(
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
                                                                      parent: containerProductsRecord
                                                                          .reference,
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
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                SpinKitCircle(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 50,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<VariantsRecord>
                                                                          rowVariantsRecordList =
                                                                          snapshot
                                                                              .data;
                                                                      final rowVariantsRecord = rowVariantsRecordList
                                                                              .isNotEmpty
                                                                          ? rowVariantsRecordList
                                                                              .first
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
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                      containerProductsRecord.title,
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
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Surtido por',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                      FutureBuilder<ApiCallResponse>(
                                                                                        future: GetSellersThatSuppliedProductCall.call(
                                                                                          bundleId: widget.bundleId,
                                                                                          variantId: rowVariantsRecord.id,
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
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  size: 50,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }
                                                                                          final rowGetSellersThatSuppliedProductResponse = snapshot.data;
                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                child: Text(
                                                                                                  GetSellersThatSuppliedProductCall.amount(
                                                                                                    (rowGetSellersThatSuppliedProductResponse?.jsonBody ?? ''),
                                                                                                  ).toString(),
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
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Container(
                                                                                width: 100,
                                                                                height: 40,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return Padding(
                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                          child: VerSellers2Widget(
                                                                                            productId: containerProductsRecord.id,
                                                                                            variantId: rowVariantsRecord.id,
                                                                                            amount: getJsonField(
                                                                                              productsInOrderItem,
                                                                                              r'''$.amount''',
                                                                                            ).toString(),
                                                                                            bundleId: widget.bundleId,
                                                                                            orderType: 'normal',
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Ver Sellers',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.keyboard_arrow_right,
                                                                                        color: Colors.black,
                                                                                        size: 24,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
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
                                                );
                                              },
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
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 30, 20),
                  child: Column(
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: Text(
                                            'USUARIO',
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
                                        Text(
                                          rowOrdersForClientsRecord
                                              .customerName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
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
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where('uid',
                                                  isEqualTo:
                                                      rowOrdersForClientsRecord
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              circleImageUsersRecordList =
                                              snapshot.data;
                                          final circleImageUsersRecord =
                                              circleImageUsersRecordList
                                                      .isNotEmpty
                                                  ? circleImageUsersRecordList
                                                      .first
                                                  : null;
                                          return Container(
                                            width: 120,
                                            height: 120,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                circleImageUsersRecord.photoUrl,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: Text(
                                            'TELÉFONO',
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
                                        Text(
                                          rowOrdersForClientsRecord
                                              .customerPhone,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 5),
                                            child: Text(
                                              'DIRECCIÓN',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF909090),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            rowOrdersForClientsRecord
                                                .customerAddress
                                                .maybeHandleOverflow(
                                                    maxChars: 30),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
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
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Productos',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                    FlutterFlowTheme.of(context)
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(25, 0, 35, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Producto 1',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '\$500.00',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Producto 2',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '\$501.00',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(25, 0, 35, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Subtotal',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '\$500.00',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Descuento',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '-\$1.00',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Subtotal pagado',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '\$999.00',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Cargo por venta',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '-\$115.88',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Envío',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                    FlutterFlowTheme.of(context)
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(25, 0, 35, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Enviado por',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '[Enviador]',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Distancia total',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '1.6 km',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(25, 0, 35, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Costo de Envío',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '\$10.60',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Cargo por envío',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '-\$1.23',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Impuestos',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                    FlutterFlowTheme.of(context)
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(25, 0, 35, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Retención ISR',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '-\$52.99',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Retención IVA',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '-\$141.30',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(25, 0, 35, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Retención 2%',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '-\$17.66',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Monto a pagar',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 15,
                                                        ),
                                              ),
                                              Text(
                                                '\$671.17',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF1EEBBD),
                                                      fontSize: 15,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        collapsed: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(25, 0, 35, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Monto a pagar',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Text(
                                                          '\$671.17',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFAEAEAE),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
