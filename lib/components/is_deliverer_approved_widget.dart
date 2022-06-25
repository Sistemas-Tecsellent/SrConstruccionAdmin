import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class IsDelivererApprovedWidget extends StatefulWidget {
  const IsDelivererApprovedWidget({
    Key key,
    this.delivererUID,
  }) : super(key: key);

  final String delivererUID;

  @override
  _IsDelivererApprovedWidgetState createState() =>
      _IsDelivererApprovedWidgetState();
}

class _IsDelivererApprovedWidgetState extends State<IsDelivererApprovedWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DeliverersRecord>>(
      stream: queryDeliverersRecord(
        queryBuilder: (deliverersRecord) =>
            deliverersRecord.where('uid', isEqualTo: widget.delivererUID),
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
        List<DeliverersRecord> toggleIconDeliverersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final toggleIconDeliverersRecord =
            toggleIconDeliverersRecordList.isNotEmpty
                ? toggleIconDeliverersRecordList.first
                : null;
        return ToggleIcon(
          onPressed: () async {
            final deliverersUpdateData = createDeliverersRecordData(
              isApproved: toggleIconDeliverersRecord.isApproved,
            );
            await toggleIconDeliverersRecord.reference
                .update(deliverersUpdateData);
          },
          value: toggleIconDeliverersRecord.isApproved,
          onIcon: Icon(
            Icons.toggle_on,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 25,
          ),
          offIcon: Icon(
            Icons.toggle_off,
            color: Color(0xFF909090),
            size: 25,
          ),
        );
      },
    );
  }
}
