import 'package:flutter_svg/svg.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({Key key}) : super(key: key);

  @override
  _HomePageCopyWidgetState createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'buttonOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1.2,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      await actions.lockOrientation();
    });

    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0x00000000),
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor:
          Color(0x00000000), //FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 1, 16, 0),
                    child: Text(
                      'Hi, can you test interactions for me? Thank u :\">',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.75, 0.4),
                  child: FutureBuilder<ApiCallResponse>(
                    future: APIShowDemoCall.call(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      final buttonAPIShowDemoResponse = snapshot.data;

                      return FFButtonWidget(
                        onPressed: () async {
                          APIShowDemoCall.call();
                          await (animationsMap['buttonOnActionTriggerAnimation']
                                  .curvedAnimation
                                  .parent as AnimationController)
                              .forward(from: 0.0);
                        },
                        icon: Center(
                          child: SvgPicture.asset(
                            'assets/images/wetaus_symbol_white_transparent.svg',
                            width: 64,
                            height: 64,
                            color: Colors.white,
                          ),
                        ),
                        text: '',
                        options: FFButtonOptions(
                          width: 130,
                          height: 130,
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          color: Color(0xFFFF4E00),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 120,
                        ),
                        showLoadingIndicator: false,
                      ).animated(
                          [animationsMap['buttonOnActionTriggerAnimation']]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
