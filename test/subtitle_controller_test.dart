import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subtitle_wrapper_package/bloc/subtitle/subtitle_bloc.dart';
import 'package:subtitle_wrapper_package/data/repository/subtitle_repository.dart';
import 'package:subtitle_wrapper_package/subtitle_controller.dart';
import 'package:video_player/video_player.dart';

class MockVideoPlayerController extends Mock implements VideoPlayerController {}

void main() {
  var _subtitleController = SubtitleController(
    subtitleUrl: 'https://pastebin.com/raw/ZWWAL7fK',
    showSubtitles: true,
    subtitleDecoder: SubtitleDecoder.utf8,
    subtitleType: SubtitleType.webvtt,
  );

  group(
    'Subtitle controller',
    () {
      test('attach', () async {
        _subtitleController.attach(SubtitleBloc(
          subtitleController: _subtitleController,
          subtitleRepository: SubtitleDataRepository(
            subtitleController: _subtitleController,
          ),
          videoPlayerController: MockVideoPlayerController(),
        ));
      });
      test('detach', () async {
        _subtitleController.detach();
      });

      test('update subtitle url', () async {
        _subtitleController.attach(SubtitleBloc(
          subtitleController: _subtitleController,
          subtitleRepository: SubtitleDataRepository(
            subtitleController: _subtitleController,
          ),
          videoPlayerController: MockVideoPlayerController(),
        ));
        _subtitleController.updateSubtitleUrl(
          url: 'https://pastebin.com/raw/ZWWAL7fK',
        );
      });

      test('update subtitle content', () async {
        _subtitleController.attach(SubtitleBloc(
          subtitleController: _subtitleController,
          subtitleRepository: SubtitleDataRepository(
            subtitleController: _subtitleController,
          ),
          videoPlayerController: MockVideoPlayerController(),
        ));
        _subtitleController.updateSubtitleContent(
          content: '',
        );
      });

      test('update subtitle content without attach', () async {
        _subtitleController.detach();
        _subtitleController.updateSubtitleContent(
          content: '',
        );
      });
      test('update subtitle url without attach', () async {
        _subtitleController.detach();
        _subtitleController.updateSubtitleUrl(
          url: 'https://pastebin.com/raw/ZWWAL7fK',
        );
      });
    },
  );
}
