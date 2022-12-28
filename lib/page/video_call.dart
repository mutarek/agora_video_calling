import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videocallingappdemo/utils/settings.dart';
import 'package:wakelock/wakelock.dart';

import 'call_controller.dart';

class VideoCall extends StatefulWidget {
  bool videoCall;

  VideoCall({required this.videoCall});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final callCon = Get.put(CallController());

  @override
  void initState() {
    super.initState();
    Wakelock.enable(); // Turn on wakelock feature till call is running
  }

  @override
  void dispose() {
    // _engine.leaveChannel();
    // _engine.destroy();
    Wakelock.disable(); // Turn off wakelock feature after call end
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Obx(() => Stack(
              children: [
                Center(
                  child: callCon.localUserJoined == true
                      ? AgoraVideoView(
                          controller: VideoViewController.remote(
                            rtcEngine: callCon.engine,
                            canvas: VideoCanvas(uid: callCon.myremoteUid.value),
                            connection:
                                const RtcConnection(channelId: channgeId),
                          ),
                        )
                      : const Center(
                          child: Text(
                            'No Remote',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: Center(
                        child: callCon.localUserJoined.value
                            ? AgoraVideoView(
                                controller: VideoViewController(
                                  rtcEngine: callCon.engine,
                                  canvas: const VideoCanvas(uid: 0),
                                ),
                              )
                            : CircularProgressIndicator()),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              callCon.onToggleMute();
                            },
                            child: Icon(
                              callCon.muted.value ? Icons.mic : Icons.mic_off,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              callCon.onCallEnd();
                            },
                            child: Icon(
                              Icons.call,
                              size: 35,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              callCon.onSwitchCamera();
                            },
                            child: Icon(
                              Icons.switch_camera,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
