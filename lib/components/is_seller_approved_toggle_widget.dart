import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class IsSellerApprovedToggleWidget extends StatefulWidget {
  const IsSellerApprovedToggleWidget({
    Key key,
    this.sellerUID,
  }) : super(key: key);

  final String sellerUID;

  @override
  _IsSellerApprovedToggleWidgetState createState() =>
      _IsSellerApprovedToggleWidgetState();
}

class _IsSellerApprovedToggleWidgetState
    extends State<IsSellerApprovedToggleWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SellersRecord>>(
      stream: querySellersRecord(
        queryBuilder: (sellersRecord) =>
            sellersRecord.where('uid', isEqualTo: widget.sellerUID),
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
        List<SellersRecord> toggleIconSellersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final toggleIconSellersRecord = toggleIconSellersRecordList.isNotEmpty
            ? toggleIconSellersRecordList.first
            : null;
        return ToggleIcon(
          onPressed: () async {
            final sellersUpdateData = createSellersRecordData(
              isApproved: toggleIconSellersRecord.isApproved,
            );
            await toggleIconSellersRecord.reference.update(sellersUpdateData);
          },
          value: toggleIconSellersRecord.isApproved,
          onIcon: Icon(
            Icons.toggle_on,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 25,
          ),
          offIcon: Icon(
            Icons.toggle_off,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 25,
          ),
        );
      },
    );
  }
}
