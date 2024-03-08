import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutas_model.dart';
export 'rutas_model.dart';

class RutasWidget extends StatefulWidget {
  const RutasWidget({super.key});

  @override
  State<RutasWidget> createState() => _RutasWidgetState();
}

class _RutasWidgetState extends State<RutasWidget> {
  late RutasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RutasModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'ebnzopla' /* Rutas */,
          ),
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Baloo Da 2',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 53.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.network(
                          valueOrDefault<String>(
                            currentUserPhoto,
                            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fes.vecteezy.com%2Ffoto%2F5434200-fondo-abstracto-amarillo-y-naranja-con-patron-de-circulo-fondo-de-geometria-moderna&psig=AOvVaw1wRlsUyr3jZaPG1SNCJaNg&ust=1702514102395000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLix88aVi4MDFQAAAAAdAAAAABAX',
                          ),
                        ).image,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 359.0,
                      height: 517.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
