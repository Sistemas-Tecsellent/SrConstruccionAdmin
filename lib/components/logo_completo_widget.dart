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
        child: Image.asset(
          'assets/images/mcatd_1.png',
          width: 100,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
