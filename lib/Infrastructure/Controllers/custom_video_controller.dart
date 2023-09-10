import 'package:bccm_player/bccm_player.dart';
import 'package:get/get.dart';

class CustomVideoController extends GetxController {
  late BccmPlayerController playerController;

  @override
  void onInit() {
    super.onInit();
    playerController = BccmPlayerController(
      MediaItem(
        url:
            'https://d1gnaphp93fop2.cloudfront.net/videos/multiresolution/rendition_new10.m3u8',
        // 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        // mime: M3u8
        mimeType: 'application/x-mpegURL',
        // metadata: MediaMetadata(title: 'Apple advanced (HLS/HDR)'),
      ),
    );
    playerController.initialize().then((_) {
      playerController.setPrimary();
    });
  }

  // Function for playing new video
  void playNewVideo(String url) {
    playerController.replaceCurrentMediaItem(
      MediaItem(
        url: url,
        mimeType: 'application/x-mpegURL',
      ),
    );
    playerController.play();
  }
}
