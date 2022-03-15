import 'package:audio_session/audio_session.dart';
import 'package:ccvc_mobile/config/resources/color.dart';
import 'package:ccvc_mobile/config/resources/styles.dart';
import 'package:ccvc_mobile/generated/l10n.dart';
import 'package:ccvc_mobile/presentation/bao_chi_mang_xa_hoi_screen/tin_tuc_thoi_su_screen/ui/nghe_ban_tin/bloc/play_radio_cubit.dart';
import 'package:ccvc_mobile/utils/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class PlayRadio extends StatefulWidget {
  final PlayRadioCubit cubit;
  const PlayRadio({Key? key,required this.cubit}) : super(key: key);

  @override
  _PlayRadioState createState() => _PlayRadioState();
}

class _PlayRadioState extends State<PlayRadio> with WidgetsBindingObserver {
  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),);
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    },);
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",),),);
    } catch (e) {
      return;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
                position: position,
                bufferedPosition: bufferedPosition,
              ),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display play/pause button and volume/speed sliders.
            // Display seek bar. Using StreamBuilder, this widget rebuilds
            // each time the position, buffered position or duration changes.
            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.position ?? Duration.zero,
                  bufferedPosition:
                  positionData?.bufferedPosition ?? Duration.zero,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      color: unselectLabelColor,
                      onPressed: () {},
                      icon: const Icon(Icons.skip_previous),
                    ),
                    StreamBuilder<bool>(
                      stream: widget.cubit.streamPlay,
                      builder: (context,snapshot){
                        final data=snapshot.data??false;
                        data ? _player.play():_player.pause();
                        return GestureDetector(
                          onTap: () {
                            widget.cubit.changePlay();
                          },
                          child: SvgPicture.asset(ImageAssets.icPlay),
                        );
                      },
                    ),
                    IconButton(
                      color: unselectLabelColor,
                      onPressed: () {},
                      icon: const Icon(Icons.skip_next),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_up),
                      color: unselectLabelColor,
                    )
                  ],
                ),
                Text(
                  S.current.time_play,
                  style: textNormalCustom(
                    color: AqiColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PositionData {
  final Duration? position;
  final Duration? bufferedPosition;

  PositionData({this.position, this.bufferedPosition});
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration bufferedPosition;

  const SeekBar(
      {Key? key, required this.position, required this.bufferedPosition,})
      : super(key: key);

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  @override
  Widget build(BuildContext context) {
    return  Slider(
      value: widget.position.inSeconds.toDouble(),
      max: widget.bufferedPosition.inSeconds.toDouble(),
      activeColor: labelColor,
      inactiveColor: borderButtomColor,
      onChanged: (value) {},
    );

  }
}
