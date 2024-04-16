import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:gold_team_investor_go/gold_team/constants/colors.dart';
import 'package:gold_team_investor_go/gold_team/constants/navigators.dart';
import 'package:gold_team_investor_go/gold_team/exe_directory/exe_model.dart';
import 'package:gold_team_investor_go/gold_team/presentation/screens/add_screens/no_internet.dart';
import 'package:gold_team_investor_go/gold_team/presentation/widgets/app_bar_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../model/conntectivity_class.dart';

class DetailedLesson extends StatefulWidget {
  const DetailedLesson({super.key, required this.lessonModel});

  final ExeLessonModel lessonModel;

  @override
  State<DetailedLesson> createState() => _DetailedLessonState();
}

class _DetailedLessonState extends State<DetailedLesson> {
  late YoutubePlayerController _controller;
  int currentIndex = 0;

  int currentVideoIndex = 0;

  void playVideo(int index) {
    setState(() {
      currentVideoIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              widget.lessonModel.lessonsLinks![currentIndex]) ??
          "",
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var connectivityService = Provider.of<ConnectivityService>(context);

    return Scaffold(
      appBar: AppBarApp(
        title: "${widget.lessonModel.title}",
      ),
      backgroundColor: mainTheme(context),
      // body: connectivityService.isConnected ? _singleLesson() : NoInternet(),
    body: _singleLesson(),
    );
  }

  _singleLesson() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(30),
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.indigoAccent,
              ),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "To'liq Oynada Ko'rish Uchun Bosing ==>",
                  style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () => navPush(context,
                        FUllScreen(link: widget.lessonModel.lessonsLinks![0])),
                    icon: Icon(Icons.fullscreen)),
              ],
            ),
            const Gap(30),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            const Gap(30),
            _lessonNumberBuilder()
          ],
        ),
      ),
    );
  }

  _lessonNumberBuilder() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
          itemCount: widget.lessonModel.lessonsLinks?.length,
          itemBuilder: (context, index) {
            final Color color =
                index % 2 == 0 ? Colors.white : Colors.grey.shade300;

            final bool isPlaying = index == currentVideoIndex;
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = (currentIndex = index) %
                          widget.lessonModel.lessonsLinks!.length;
                      _controller.load(YoutubePlayer.convertUrlToId(
                              widget.lessonModel.lessonsLinks![currentIndex]) ??
                          "");
                      _controller.play();
                    });
                    playVideo(index);
                  },
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black26,
                      backgroundColor:
                          isPlaying ? Colors.lightBlue.shade200 : color,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(10),
                      Icon(
                        Icons.play_circle_outlined,
                        color: isPlaying ? Colors.white : Colors.grey.shade800,
                        size: isPlaying ? 28 : 20,
                      ),
                      const Gap(20),
                      Text(
                        "${index + 1}-dars",
                        style: GoogleFonts.nunitoSans(
                            color:
                                isPlaying ? Colors.white : Colors.grey.shade800,
                            fontSize: isPlaying ? 20 : 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}

class FUllScreen extends StatefulWidget {
  const FUllScreen({super.key, required this.link});

  final String link;

  @override
  State<FUllScreen> createState() => _FUllScreenState();
}

class _FUllScreenState extends State<FUllScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.link) ?? "",
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
    );
  }
}
