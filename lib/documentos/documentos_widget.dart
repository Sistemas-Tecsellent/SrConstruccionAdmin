import '../components/logo_completo_widget.dart';
import '../components/notifications_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentosWidget extends StatefulWidget {
  const DocumentosWidget({Key key}) : super(key: key);

  @override
  _DocumentosWidgetState createState() => _DocumentosWidgetState();
}

class _DocumentosWidgetState extends State<DocumentosWidget> {
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
                          context.pushNamed(
                            'Dashboard',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.dashboard_outlined,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Dashboard',
                            style: FlutterFlowTheme.of(context).title3.override(
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
                          context.pushNamed(
                            'PEDIDOS',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.local_shipping_outlined,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Pedidos',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFFB5B5B5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          tileColor: FlutterFlowTheme.of(context).primaryColor,
                          dense: false,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'CotizacionePendientes',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.insert_drive_file_outlined,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Cotizaciones',
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
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'Finanzastodaslascompras',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.attach_money_rounded,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Finanzas',
                            style: FlutterFlowTheme.of(context).title3.override(
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
                          context.pushNamed(
                            'Productos',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_bag_outlined,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Productos',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFFB5B5B5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'VendedoresRegistrados',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.storefront,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Vendedores',
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
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'RepartidoresRegistrados',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.motorcycle_rounded,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Repartidores',
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
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'Usuarios',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.tag_faces,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Usuarios',
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
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed('RegistroWeb');
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.link_rounded,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Registros Web',
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
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'Promociones',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.receipt_long_outlined,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Promociones',
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
                          context.pushNamed(
                            'Ajustes',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.settings_outlined,
                            color: Color(0xFFB5B5B5),
                          ),
                          title: Text(
                            'Ajustes',
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pop();
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
                                FlutterFlowTheme.of(context).subtitle2.override(
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
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: FlutterFlowPdfViewer(
                              networkPath:
                                  'http://www.pdf995.com/samples/pdf.pdf',
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.8,
                              horizontalScroll: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
