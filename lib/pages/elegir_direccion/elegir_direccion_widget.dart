import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'elegir_direccion_model.dart';
export 'elegir_direccion_model.dart';

class ElegirDireccionWidget extends StatefulWidget {
  const ElegirDireccionWidget({
    super.key,
    this.referenceUsers,
    this.viajeref,
  });

  final DocumentReference? referenceUsers;
  final DocumentReference? viajeref;

  @override
  State<ElegirDireccionWidget> createState() => _ElegirDireccionWidgetState();
}

class _ElegirDireccionWidgetState extends State<ElegirDireccionWidget> {
  late ElegirDireccionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ElegirDireccionModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'newmxjjl' /* Rutas */,
          ),
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Baloo Da 2',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      currentUserLocationValue = await getCurrentUserLocation(
                          defaultLocation: LatLng(0.0, 0.0));
                      setState(() {
                        FFAppState().Prueba = currentUserLocationValue;
                      });
                      setState(() {
                        _model.pageState = true;
                      });
                    },
                    text: FFLocalizations.of(context).getText(
                      '1njq0qsd' /* Button */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 649.0,
                    decoration: BoxDecoration(),
                    child: Builder(builder: (context) {
                      final _googleMapMarker = currentUserLocationValue;
                      return FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        onCameraIdle: (latLng) =>
                            setState(() => _model.googleMapsCenter = latLng),
                        initialLocation: _model.googleMapsCenter ??=
                            currentUserLocationValue!,
                        markers: [
                          if (_googleMapMarker != null)
                            FlutterFlowMarker(
                              _googleMapMarker.serialize(),
                              _googleMapMarker,
                            ),
                        ],
                        markerColor: GoogleMarkerColor.red,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: true,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      );
                    }),
                  ),
                ],
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (_model.placePickerValue != null) {
                    setState(() {
                      FFAppState().InicioViaje = _model.placePickerValue.latLng;
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowPlacePicker(
                      iOSGoogleMapsApiKey:
                          'AIzaSyB-gJR4XQWsbvkkVp_TYC8wNUU0J75TSTY',
                      androidGoogleMapsApiKey:
                          'AIzaSyCkJbZmeDwKBBGgGdUhfRqmd7R3374dwxI',
                      webGoogleMapsApiKey:
                          'AIzaSyDXsqP1YUfNRRJ81AOxRoq-ASII0Pu_N1Q',
                      onSelect: (place) async {
                        setState(() => _model.placePickerValue = place);
                      },
                      defaultText: FFLocalizations.of(context).getText(
                        '5kh2kw37' /* Select Location */,
                      ),
                      icon: Icon(
                        Icons.place,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 16.0,
                      ),
                      buttonOptions: FFButtonOptions(
                        width: 200.0,
                        height: 40.0,
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await RideRecord.collection
                            .doc()
                            .set(createRideRecordData(
                              userLocation: FFAppState().InicioViaje,
                              userUid: widget.referenceUsers?.id,
                              destinationLocation:
                                  _model.placePickerValue.latLng,
                              userName: widget.referenceUsers?.id,
                              isDriverAssigned: false,
                              destinationAddress:
                                  _model.placePickerValue.address,
                            ));

                        context.pushNamed(
                          'EditUsers',
                          queryParameters: {
                            'viajeref': serializeParam(
                              widget.viajeref,
                              ParamType.DocumentReference,
                            ),
                            'referenceUser': serializeParam(
                              widget.referenceUsers,
                              ParamType.DocumentReference,
                            ),
                            'editParameter': serializeParam(
                              '',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'ul44vq6x' /* Confirmar viaje */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
