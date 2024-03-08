import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'create_pets_widget.dart' show CreatePetsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePetsModel extends FlutterFlowModel<CreatePetsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Pet_Name widget.
  FocusNode? petNameFocusNode;
  TextEditingController? petNameController;
  String? Function(BuildContext, String?)? petNameControllerValidator;
  // State field(s) for Pet_type widget.
  String? petTypeValue;
  FormFieldController<String>? petTypeValueController;
  // State field(s) for Pet_Description widget.
  FocusNode? petDescriptionFocusNode1;
  TextEditingController? petDescriptionController1;
  String? Function(BuildContext, String?)? petDescriptionController1Validator;
  // State field(s) for Pet_Description widget.
  FocusNode? petDescriptionFocusNode2;
  TextEditingController? petDescriptionController2;
  String? Function(BuildContext, String?)? petDescriptionController2Validator;
  // State field(s) for BorndateText widget.
  FocusNode? borndateTextFocusNode;
  TextEditingController? borndateTextController;
  String? Function(BuildContext, String?)? borndateTextControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    petNameFocusNode?.dispose();
    petNameController?.dispose();

    petDescriptionFocusNode1?.dispose();
    petDescriptionController1?.dispose();

    petDescriptionFocusNode2?.dispose();
    petDescriptionController2?.dispose();

    borndateTextFocusNode?.dispose();
    borndateTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
