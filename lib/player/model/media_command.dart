enum MediaCommandType {
  play,
  pause,
  seek,
  mute,
  unmute,
  speed,
  switchVideo,
  switchToOfflineVideo,
  // those are more to let the player know if they need to do anything when the full screen status changes
  enterFullScreen,
  exitFullScreen
}

class MediaCommand<T> {
  final MediaCommandType type;
  final T? value;

  const MediaCommand(this.type, {this.value});
}
