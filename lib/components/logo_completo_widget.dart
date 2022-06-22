import '../dashboard/dashboard_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoCompletoWidget extends StatefulWidget {
  const LogoCompletoWidget({Key key}) : super(key: key);

  @override
  _LogoCompletoWidgetState createState() => _LogoCompletoWidgetState();
}

class _LogoCompletoWidgetState extends State<LogoCompletoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
      child: InkWell(
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
        child: Image.asset(
          'assets/images/mcatd_1.png',
          width: 100,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
