import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancePlayer;
  const AudioFile({Key? key, required this.advancePlayer}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = Duration();
  Duration _position = Duration();
  final String path = "music/peace.mp3";

  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  bool isRepeat = false;
  Color color = Colors.black;
  final List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    widget.advancePlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _position = position;
      });
    });
    widget.advancePlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });
    widget.advancePlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        setState(() {
          _position = Duration.zero;
          isPlaying = false;
          isRepeat = false;
        });
      }
    });

    try {
      widget.advancePlayer.setSourceAsset(path);
    } catch (e) {
      print("Error setting asset: $e");
      // Handle the error as needed
    }
  }

  Widget btnStart() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: Icon(
        isPlaying ? _icons[1] : _icons[0],
        size: 50,
        //color: Colors.blue,
      ),
      onPressed: () {
        try {
          if (isPlaying) {
            widget.advancePlayer.pause(); // Pause the audio
          } else {
            widget.advancePlayer.setSourceAsset(path);
            widget.advancePlayer.resume(); // Resume the audio
          }
          setState(() {
            isPlaying = !isPlaying;
          });
        } catch (e) {
          print("Error setting asset: $e");
          // Handle the error as needed
        }
      },
    );
  }

  Widget btnFast() {
    return IconButton(
      icon: Icon(Icons.fast_forward),
      color: Colors.black,
      onPressed: () {
        widget.advancePlayer.setPlaybackRate(2.5);
      },
    );
  }

  Widget btnSlow() {
    return IconButton(
      icon: Icon(Icons.fast_rewind),
      color: Colors.black,
      onPressed: () {
        widget.advancePlayer.setPlaybackRate(0.5);
      },
    );
  }

  Widget btnLoop() {
    return IconButton(
      icon: Icon(Icons.loop),
      color: Colors.black,
      onPressed: () {},
    );
  }

  Widget btnRepeat() {
    return IconButton(
        icon: Icon(Icons.repeat),
        color: color,
        // color: Colors.black,
        onPressed: () {
          if (!isRepeat) {
            widget.advancePlayer.setReleaseMode(ReleaseMode.loop);
            setState(() {
              color = Colors.blue;
              isRepeat = true;
            });
          } else {
            widget.advancePlayer.setReleaseMode(ReleaseMode.release);
            color = Colors.black;
            isRepeat = false;
          }
        });
  }

  Widget slider() {
    double maxDuration = _duration.inSeconds.toDouble();
    return Slider(
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble().clamp(0.0, maxDuration),
      min: 0.0,
      max: maxDuration,
      onChanged: (double value) {
        setState(() {
          _position = Duration(seconds: value.toInt());
        });
      },
      onChangeEnd: (double value) {
        changeToSecond(value.toInt());
      },
    );
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.advancePlayer.seek(newDuration);
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString().split(".")[0],
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  _duration.toString().split(".")[0],
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}
