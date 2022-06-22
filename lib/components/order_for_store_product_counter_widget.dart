import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderForStoreProductCounterWidget extends StatefulWidget {
  const OrderForStoreProductCounterWidget({
    Key key,
    this.productId,
    this.variantId,
    this.unit,
    this.normalPrice,
  }) : super(key: key);

  final String productId;
  final String variantId;
  final String unit;
  final String normalPrice;

  @override
  _OrderForStoreProductCounterWidgetState createState() =>
      _OrderForStoreProductCounterWidgetState();
}

class _OrderForStoreProductCounterWidgetState
    extends State<OrderForStoreProductCounterWidget> {
  int countControllerValue;
  int stagedAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.3,
              ),
              decoration: BoxDecoration(),
              child: Container(
                width: 160,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0xFF9E9E9E),
                    width: 1,
                  ),
                ),
                child: FlutterFlowCountController(
                  decrementIconBuilder: (enabled) => FaIcon(
                    FontAwesomeIcons.minus,
                    color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                    size: 20,
                  ),
                  incrementIconBuilder: (enabled) => FaIcon(
                    FontAwesomeIcons.plus,
                    color: enabled
                        ? FlutterFlowTheme.of(context).primaryColor
                        : Color(0xFFEEEEEE),
                    size: 20,
                  ),
                  countBuilder: (count) => Text(
                    count.toString(),
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  count: countControllerValue ??= 0,
                  updateCount: (count) =>
                      setState(() => countControllerValue = count),
                  stepSize: 1,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.3,
              ),
              decoration: BoxDecoration(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if ((countControllerValue) <= 0) {
                            setState(() =>
                                FFAppState().productsStoreWillSupply = functions
                                    .unstageProductFromLocalState(
                                        widget.variantId,
                                        FFAppState()
                                            .productsStoreWillSupply
                                            .toList())
                                    .toList());
                          } else {
                            setState(() =>
                                FFAppState().productsStoreWillSupply = functions
                                    .stageProductToLocalState(
                                        widget.productId,
                                        widget.variantId,
                                        countControllerValue,
                                        FFAppState()
                                            .productsStoreWillSupply
                                            .toList(),
                                        widget.normalPrice,
                                        widget.unit)
                                    .toList());
                          }

                          stagedAmount = await actions.setStagedCountForVariant(
                            widget.variantId,
                            FFAppState().productsStoreWillSupply.toList(),
                          );

                          setState(() {});
                        },
                        text: 'Asignar',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Color(0xFF1EEBBD),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
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
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.3,
              ),
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            if ((stagedAmount != null))
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                child: Text(
                                  valueOrDefault<String>(
                                    stagedAmount.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                          ],
                        ),
                        Text(
                          'Unidades asignadas',
                          style: FlutterFlowTheme.of(context).bodyText1,
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
    );
  }
}
