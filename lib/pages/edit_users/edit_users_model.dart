import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'edit_users_widget.dart' show EditUsersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditUsersModel extends FlutterFlowModel<EditUsersWidget> {
  ///  Local state fields for this page.

  bool? create = false;

  bool? ubicationSet = false;

  LatLng? ubicationMaps;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for display_nameUpdate widget.
  FocusNode? displayNameUpdateFocusNode;
  TextEditingController? displayNameUpdateController;
  String? Function(BuildContext, String?)? displayNameUpdateControllerValidator;
  // State field(s) for emailView widget.
  FocusNode? emailViewFocusNode;
  TextEditingController? emailViewController;
  String? Function(BuildContext, String?)? emailViewControllerValidator;
  // State field(s) for uidUpdate widget.
  FocusNode? uidUpdateFocusNode;
  TextEditingController? uidUpdateController;
  String? Function(BuildContext, String?)? uidUpdateControllerValidator;
  // State field(s) for phone_numberUpdate widget.
  FocusNode? phoneNumberUpdateFocusNode;
  TextEditingController? phoneNumberUpdateController;
  String? Function(BuildContext, String?)? phoneNumberUpdateControllerValidator;
  // State field(s) for addressUpdate widget.
  FocusNode? addressUpdateFocusNode;
  TextEditingController? addressUpdateController;
  String? Function(BuildContext, String?)? addressUpdateControllerValidator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    displayNameUpdateFocusNode?.dispose();
    displayNameUpdateController?.dispose();

    emailViewFocusNode?.dispose();
    emailViewController?.dispose();

    uidUpdateFocusNode?.dispose();
    uidUpdateController?.dispose();

    phoneNumberUpdateFocusNode?.dispose();
    phoneNumberUpdateController?.dispose();

    addressUpdateFocusNode?.dispose();
    addressUpdateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
