import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mandebem/widgets/Background.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Dicas extends StatefulWidget {
  @override
  _DicasState createState() => _DicasState();
}

class _DicasState extends State<Dicas> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'KzNRjcrXL6E',
    params: YoutubePlayerParams(
      showControls: false,

      playlist: [
        'tZzwsR1Ve2A',
        'lp68yKgk2ng',
        'C6GFSsWqX7Y',
        '3fP541Qhfd0',
        'z5fL1L3wYXU'
      ], // Defining custom playlist
      showFullscreenButton: true,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Background(height, width),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YoutubePlayerControllerProvider(
                controller: _controller,
                child: YoutubePlayerIFrame(
                  aspectRatio: 16 / 9,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => _controller.previousVideo(),
                  icon: Icon(Icons.skip_previous),
                ),
                IconButton(
                    onPressed: () {
                      _controller.play();
                    },
                    icon: Icon(Icons.play_arrow)),
                IconButton(
                  onPressed: () => _controller.pause(),
                  icon: Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () => _controller.nextVideo(),
                  icon: Icon(Icons.skip_next),
                )
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
          ],
        ),
      ],
    );
  }
}
