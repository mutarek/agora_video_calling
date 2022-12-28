// import 'dart:async';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:pip_view/pip_view.dart';
// import 'package:wakelock/wakelock.dart';
// import '../utils/settings.dart';
//
// class CallPage extends StatefulWidget {
//   const CallPage({Key? key}) : super(key: key);
//
//   @override
//   _CallPageState createState() => _CallPageState();
// }
//
// class _CallPageState extends State<CallPage> {
//   // String channelId = channgeId;
//   // int _remoteUid = 0;
//   // bool _localUserJoined = false;
//   // bool muted = false;
//   // bool videoPaused = false;
//   // bool switchMainView = false;
//   // bool mutedVideo = false;
//   // bool reConnectingRemoteView = false;
//   // bool isFront = false;
//   // late RtcEngine _engine;
//
//   @override
//   void initState() {
//     super.initState();
//     // initialize();
//     // Wakelock.enable();
//   }
//
//   @override
//   void dispose() {
//     //_dispose();
//     super.dispose();
//   }
//
//   // Future<void> _dispose() async {
//   //   clear();
//   //   await _engine.leaveChannel();
//   //   Wakelock.disable();
//   // }
//
//   // clear() {
//   //   isFront = false;
//   //   reConnectingRemoteView = false;
//   //   videoPaused = false;
//   //   muted = false;
//   //   mutedVideo = false;
//   //   switchMainView = false;
//   //   _localUserJoined = false;
//   // }
//
//   // Future<void> initialize() async {
//   //   await _initAgoraRtcEngine();
//   //   _addAgoraEventHandlers();
//   //   await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//   //   await _engine.enableVideo();
//   //   await _engine.startPreview();
//   //   await _engine.joinChannel(
//   //     token: token,
//   //     channelId: channelId,
//   //     uid: _remoteUid,
//   //     options: const ChannelMediaOptions(),
//   //   );
//   //
//   //   // await [Permission.microphone, Permission.camera].request();
//   //   // await _initAgoraRtcEngine();
//   //   // _addAgoraEventHandlers();
//   //   // VideoEncoderConfiguration configuration = const VideoEncoderConfiguration();
//   //   // await _engine.setVideoEncoderConfiguration(configuration);
//   //   // await _engine.enableVideo();
//   //   // await _engine.startPreview();
//   //   // await _engine.joinChannel(
//   //   //   token: token,
//   //   //   channelId: channelId,
//   //   //   uid: 0,
//   //   //   options: const ChannelMediaOptions(),
//   //   // );
//   // }
//   //
//   // /// Create agora sdk instance and initialize
//   // Future<void> _initAgoraRtcEngine() async {
//   //   _engine = createAgoraRtcEngine();
//   //   await _engine.initialize(const RtcEngineContext(
//   //     appId: appId,
//   //     channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//   //   ));
//   //   await _engine.enableVideo();
//   //   await _engine.startPreview();
//   //   await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//   // }
//   //
//   // /// Add agora event handlers
//   // void _addAgoraEventHandlers() {
//   //   // _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
//   //   //   setState(() {
//   //   //     final info = 'onError: $code';
//   //   //     _infoStrings.add(info);
//   //   //   });
//   //   // }, joinChannelSuccess: (channel, uid, elapsed) {
//   //   //   setState(() {
//   //   //     final info = 'onJoinChannel: $channel, uid: $uid';
//   //   //     _infoStrings.add(info);
//   //   //   });
//   //   // }, leaveChannel: (stats) {
//   //   //   setState(() {
//   //   //     _infoStrings.add('onLeaveChannel');
//   //   //     _users.clear();
//   //   //   });
//   //   // }, userJoined: (uid, elapsed) {
//   //   //   setState(() {
//   //   //     final info = 'userJoined: $uid';
//   //   //     _infoStrings.add(info);
//   //   //     _users.add(uid);
//   //   //   });
//   //   // }, userOffline: (uid, elapsed) {
//   //   //   setState(() {
//   //   //     final info = 'userOffline: $uid';
//   //   //     _infoStrings.add(info);
//   //   //     _users.remove(uid);
//   //   //   });
//   //   // }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
//   //   //   setState(() {
//   //   //     final info = 'firstRemoteVideo: $uid ${width}x $height';
//   //   //     _infoStrings.add(info);
//   //   //   });
//   //   // }));
//   //
//   //   _engine.registerEventHandler(
//   //     RtcEngineEventHandler(
//   //         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//   //       debugPrint("local user ${connection.localUid} joined");
//   //       setState(() {
//   //         _localUserJoined = true;
//   //       });
//   //     }, onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//   //       debugPrint("remote user $remoteUid joined");
//   //       setState(() {
//   //         _remoteUid = remoteUid;
//   //         _localUserJoined = true;
//   //       });
//   //     }, onUserOffline: (RtcConnection connection, int remoteUid,
//   //             UserOfflineReasonType reason) {
//   //       debugPrint("remote user $remoteUid left channel");
//   //       if (reason == UserOfflineReasonType.userOfflineQuit) {
//   //         Wakelock.disable();
//   //         setState(() {
//   //           _remoteUid = 0;
//   //         });
//   //       } else {
//   //         setState(() {
//   //           _remoteUid = 0;
//   //         });
//   //       }
//   //     }, onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//   //       debugPrint(
//   //           '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//   //     }, onLeaveChannel: (RtcConnection connection, stats) {
//   //       setState(() {
//   //         // _infoStrings.add('onLeaveChannel');
//   //         // _users.clear();
//   //         _remoteUid = 0;
//   //       });
//   //     }),
//   //   );
//   // }
//   //
//   // /// Helper function to get list of native views
//   // // List<Widget> _getRenderViews() {
//   // //   final List<StatefulWidget> list = [];
//   // //   if (widget.role == ClientRoleType.clientRoleBroadcaster) {
//   // //     //list.add(RtcLocalView.SurfaceView());
//   // //   }
//   // //   return list;
//   // // }
//   //
//   // /// Video view wrapper
//   // Widget _videoView(view) {
//   //   return Expanded(child: Container(child: view));
//   // }
//   //
//   // /// Video view row wrapper
//   // Widget _expandedVideoRow(List<Widget> views) {
//   //   final wrappedViews = views.map<Widget>(_videoView).toList();
//   //   return Expanded(
//   //     child: Row(
//   //       children: wrappedViews,
//   //     ),
//   //   );
//   // }
//
//   /// Video layout wrapper
//   // Widget _viewRows() {
//   //   final views = _getRenderViews();
//   //   switch (views.length) {
//   //     case 1:
//   //       return Container(
//   //           child: Column(
//   //         children: <Widget>[_videoView(views[0])],
//   //       ));
//   //     case 2:
//   //       return Container(
//   //           child: Column(
//   //         children: <Widget>[
//   //           _expandedVideoRow([views[0]]),
//   //           _expandedVideoRow([views[1]])
//   //         ],
//   //       ));
//   //     case 3:
//   //       return Container(
//   //           child: Column(
//   //         children: <Widget>[
//   //           _expandedVideoRow(views.sublist(0, 2)),
//   //           _expandedVideoRow(views.sublist(2, 3))
//   //         ],
//   //       ));
//   //     case 4:
//   //       return Container(
//   //           child: Column(
//   //         children: <Widget>[
//   //           _expandedVideoRow(views.sublist(0, 2)),
//   //           _expandedVideoRow(views.sublist(2, 4))
//   //         ],
//   //       ));
//   //     default:
//   //   }
//   //   return Container();
//   // }
//
//   // /// Toolbar layout
//   // Widget _toolbar() {
//   //   if (widget.role == ClientRoleType.clientRoleBroadcaster) return Container();
//   //   return Container(
//   //     alignment: Alignment.bottomCenter,
//   //     padding: const EdgeInsets.symmetric(vertical: 48),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       children: <Widget>[
//   //         RawMaterialButton(
//   //           onPressed: _onToggleMute,
//   //           child: Icon(
//   //             muted ? Icons.mic_off : Icons.mic,
//   //             color: muted ? Colors.white : Colors.blueAccent,
//   //             size: 20.0,
//   //           ),
//   //           shape: CircleBorder(),
//   //           elevation: 2.0,
//   //           fillColor: muted ? Colors.blueAccent : Colors.white,
//   //           padding: const EdgeInsets.all(12.0),
//   //         ),
//   //         RawMaterialButton(
//   //           onPressed: () => _onCallEnd(context),
//   //           child: Icon(
//   //             Icons.call_end,
//   //             color: Colors.white,
//   //             size: 35.0,
//   //           ),
//   //           shape: CircleBorder(),
//   //           elevation: 2.0,
//   //           fillColor: Colors.redAccent,
//   //           padding: const EdgeInsets.all(15.0),
//   //         ),
//   //         RawMaterialButton(
//   //           onPressed: _onSwitchCamera,
//   //           child: Icon(
//   //             Icons.switch_camera,
//   //             color: Colors.blueAccent,
//   //             size: 20.0,
//   //           ),
//   //           shape: CircleBorder(),
//   //           elevation: 2.0,
//   //           fillColor: Colors.white,
//   //           padding: const EdgeInsets.all(12.0),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   /// Info panel to show logs
//   // Widget _panel() {
//   //   return Container(
//   //     padding: const EdgeInsets.symmetric(vertical: 48),
//   //     alignment: Alignment.bottomCenter,
//   //     child: FractionallySizedBox(
//   //       heightFactor: 0.5,
//   //       child: Container(
//   //         padding: const EdgeInsets.symmetric(vertical: 48),
//   //         child: ListView.builder(
//   //           reverse: true,
//   //           itemCount: _infoStrings.length,
//   //           itemBuilder: (BuildContext context, int index) {
//   //             if (_infoStrings.isEmpty) {
//   //               return Text(
//   //                   "null"); // return type can't be null, a widget was required
//   //             }
//   //             return Padding(
//   //               padding: const EdgeInsets.symmetric(
//   //                 vertical: 3,
//   //                 horizontal: 10,
//   //               ),
//   //               child: Row(
//   //                 mainAxisSize: MainAxisSize.min,
//   //                 children: [
//   //                   Flexible(
//   //                     child: Container(
//   //                       padding: const EdgeInsets.symmetric(
//   //                         vertical: 2,
//   //                         horizontal: 5,
//   //                       ),
//   //                       decoration: BoxDecoration(
//   //                         color: Colors.yellowAccent,
//   //                         borderRadius: BorderRadius.circular(5),
//   //                       ),
//   //                       child: Text(
//   //                         _infoStrings[index],
//   //                         style: TextStyle(color: Colors.blueGrey),
//   //                       ),
//   //                     ),
//   //                   )
//   //                 ],
//   //               ),
//   //             );
//   //           },
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   // void _onCallEnd(BuildContext context) {
//   //   Navigator.pop(context);
//   // }
//   //
//   // void _onToggleMute() {
//   //   setState(() {
//   //     muted = !muted;
//   //   });
//   //   _engine.muteLocalAudioStream(muted);
//   // }
//   //
//   // void _onSwitchCamera() {
//   //   _engine.switchCamera();
//   }
// }
//
//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: const Text('Agora Calling'),
//     //   ),
//     //   backgroundColor: Colors.black,
//     //   // body: Stack(
//     //   //   children: [
//     //   //     Center(
//     //   //       child: _remoteVideo(),
//     //   //     ),
//     //   //     Align(
//     //   //       alignment: Alignment.topLeft,
//     //   //       child: SizedBox(
//     //   //         width: 100,
//     //   //         height: 150,
//     //   //         child: Center(
//     //   //             child: _localUserJoined
//     //   //                 ? AgoraVideoView(
//     //   //                     controller: VideoViewController(
//     //   //                       rtcEngine: _engine,
//     //   //                       canvas: const VideoCanvas(uid: 0),
//     //   //                     ),
//     //   //                   )
//     //   //                 : CircularProgressIndicator()),
//     //   //       ),
//     //   //     ),
//     //   //   ],
//     //   // ),
//     // );
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Center(
//             child: _remoteVideo(),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: SizedBox(
//               width: 100,
//               height: 150,
//               child: Center(
//                   child: _localUserJoined
//                       ? AgoraVideoView(
//                           controller: VideoViewController(
//                             rtcEngine: _engine,
//                             canvas: const VideoCanvas(uid: 0),
//                           ),
//                         )
//                       : CircularProgressIndicator()),
//             ),
//           ),
//           Positioned(
//             bottom: 10,
//             left: 10,
//             right: 10,
//             child: Container(
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: InkWell(
//                       onTap: () {
//                         _onToggleMute();
//                       },
//                       child: Icon(
//                         muted ? Icons.mic : Icons.mic_off,
//                         size: 35,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: InkWell(
//                       onTap: () {
//                         _onCallEnd(context);
//                       },
//                       child: Icon(
//                         Icons.call,
//                         size: 35,
//                         color: Colors.red,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: InkWell(
//                       onTap: () {
//                         _onSwitchCamera();
//                       },
//                       child: Icon(
//                         Icons.switch_camera,
//                         size: 35,
//                         color: Colors.white,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _remoteVideo() {
//     if (_remoteUid == 0) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: _remoteUid),
//           connection: const RtcConnection(channelId: channgeId),
//         ),
//       );
//     } else {
//       return AgoraVideoView(
//         controller: VideoViewController(
//           rtcEngine: _engine,
//           canvas: const VideoCanvas(uid: 0),
//         ),
//       );
//     }
//   }
//
