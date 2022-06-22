import '../ajustes/ajustes_widget.dart';
import '../components/logo_completo_widget.dart';
import '../components/notifications_widget.dart';
import '../cotizacione_pendientes/cotizacione_pendientes_widget.dart';
import '../dashboard/dashboard_widget.dart';
import '../finanzastodaslascompras/finanzastodaslascompras_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../pedidos/pedidos_widget.dart';
import '../productos/productos_widget.dart';
import '../promociones/promociones_widget.dart';
import '../registro_web/registro_web_widget.dart';
import '../repartidores_registrados/repartidores_registrados_widget.dart';
import '../usuarios/usuarios_widget.dart';
import '../vendedores_por_aprobar/vendedores_por_aprobar_widget.dart';
import '../vendedores_registrados/vendedores_registrados_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificacionesWidget extends StatefulWidget {
  const NotificacionesWidget({Key key}) : super(key: key);

  @override
  _NotificacionesWidgetState createState() => _NotificacionesWidgetState();
}

class _NotificacionesWidgetState extends State<NotificacionesWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 400,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 4, 4, 4),
                                    child: TextFormField(
                                      controller: textController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText: 'Buscar',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF262D34),
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 5,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  fillColor: FlutterFlowTheme.of(context).green,
                                  icon: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
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
                        ),
                        InkWell(
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
                              color: Color(0xFFB5B5B5),
                            ),
                            title: Text(
                              'Pedidos',
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
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
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
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.sms_outlined,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Mensajes',
                            style: FlutterFlowTheme.of(context).title3.override(
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Notificaciones',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                  ),
                            ),
                          ],
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
                              child: VendedoresPorAprobarWidget(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.81,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 5,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nueva Tienda',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Text(
                                                'Se ha registrado un nuevo vendedor. Revisa la información para aprobar o rechazar la tienda.',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              Text(
                                                '10 min',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFFCBCBCB),
                                                      fontWeight:
                                                          FontWeight.normal,
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
