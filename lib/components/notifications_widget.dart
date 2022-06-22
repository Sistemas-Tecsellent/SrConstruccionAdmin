import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../notificaciones/notificaciones_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
            reverseDuration: Duration(milliseconds: 0),
            child: NotificacionesWidget(),
          ),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional(1, -1),
        children: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 0,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.notifications,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 38,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                  reverseDuration: Duration(milliseconds: 0),
                  child: NotificacionesWidget(),
                ),
              );
            },
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Text(
                '21',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 11,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
