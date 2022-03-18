import 'package:audio_session/audio_session.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class PlayRadio extends StatefulWidget {
  final AudioPlayer player;
  final List<String> listLinkRadio;

  const PlayRadio({Key? key, required this.player, required this.listLinkRadio})
      : super(key: key);

  @override
  _PlayRadioState createState() => _PlayRadioState();
}

class _PlayRadioState extends State<PlayRadio> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(),
    );
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    widget.player.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace stackTrace) {},
    );
    try {
      await widget.player.setAudioSource(
        ConcatenatingAudioSource(
          shuffleOrder: DefaultShuffleOrder(),
          children: widget.listLinkRadio
              .map((e) => AudioSource.uri(Uri.parse(e)))
              .toList(),
        ),
        initialIndex: 0, // default
        initialPosition: Duration.zero, // default
      );
    } catch (e) {
      return;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    widget.player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      widget.player.stop();
    }
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        widget.player.positionStream,
        widget.player.bufferedPositionStream,
        widget.player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position: position,
          bufferedPosition: bufferedPosition,
          duration: duration,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<PositionData>(
          stream: _positionDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data;
            return SeekBar(
              duration: positionData?.duration ?? Duration.zero,
              position: positionData?.position ?? Duration.zero,
              bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
            );
          },
        ),
      ],
    );
  }
}

class PositionData {
  final Duration? position;
  final Duration? bufferedPosition;
  final Duration? duration;

  PositionData({this.position, this.bufferedPosition, this.duration});
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  const SeekBar({
    Key? key,
    required this.position,
    required this.bufferedPosition,
    required this.duration,
  }) : super(key: key);

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      max: widget.duration.inSeconds.toDouble(),
      value: widget.position.inSeconds.toDouble(),
      onChanged: (value) {},
      activeColor: labelColor,
      inactiveColor: borderButtomColor,
    );
  }
}
