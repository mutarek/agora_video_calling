// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/material.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final AgoraClient agoraClient = AgoraClient(
//       agoraConnectionData: AgoraConnectionData(
//           appId: "f3669afdd332446493ad9a0820018dc3",
//           channelName: "1by1channel",
//           tempToken:
//               "007eJxTYNjBb/Lt/J+CMr6+XkcxOb3V5zNSRL81CHvO+BMteGgr6y8FhjRjMzPLxLSUFGNjIxMTMxNL48QUy0QDCyMDA0OLlGTjx/krkxsCGRmsnoQyMEIhiM/NYJhUaZickZiXl5rDwAAA/oohSw=="));
//
//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }
//
//   Future<void> initAgora() async {
//     await agoraClient.initialize();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             AgoraVideoViewer(
//               client: agoraClient,
//               layoutType: Layout.floating,
//               showNumberOfUsers: true,
//             ),
//             AgoraVideoButtons(
//               client: agoraClient,
//               enabledButtons: [
//                 BuiltInButtons.toggleCamera,
//                 BuiltInButtons.callEnd,
//                 BuiltInButtons.toggleMic,
//                 BuiltInButtons.switchCamera
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
