import "package:flutter/material.dart";
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Playlist',
      home: YouTubePlaylistWidget(),
    );
  }
}

class YouTubePlaylistWidget extends StatefulWidget {
  @override
  _YouTubePlaylistWidgetState createState() => _YouTubePlaylistWidgetState();
}

class _YouTubePlaylistWidgetState extends State<YouTubePlaylistWidget> {
  List<String> videoUrls = [
    "https://www.youtube.com/watch?v=3DsemW_Zwpg",
    "https://www.youtube.com/watch?v=gETtQNxg9D8",
    "https://www.youtube.com/watch?v=qKrCrH3OQDc",
    "https://www.youtube.com/watch?v=vsHgqq6Zmxs",
    "https://www.youtube.com/watch?v=-daDMURQH7w",
    "https://www.youtube.com/watch?v=_q4wiuI7zBk"
  ];

  late YoutubePlayerController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(videoUrls[currentIndex]) ?? "",
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_videoListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _videoListener() {
    if (_controller.value.playerState == PlayerState.ended) {
      _playNextVideo();
    }
  }

  void _playNextVideo() {
    setState(() {
      currentIndex = (currentIndex + 1) % videoUrls.length;
      _controller
          .load(YoutubePlayer.convertUrlToId(videoUrls[currentIndex]) ?? "");
      _controller.play();
    });
  }

  void _playPreviousVideo(){
    setState(() {
      if(currentIndex != 0){
        currentIndex = (currentIndex - 1) % videoUrls.length;
        _controller.load(YoutubePlayer.convertUrlToId(videoUrls[currentIndex]) ?? "");
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Playlist'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors: ProgressBarColors(
            playedColor: Colors.blue,
            handleColor: Colors.blueAccent,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playNextVideo,
        child: Icon(Icons.skip_next),
      ),
    );
  }
}
