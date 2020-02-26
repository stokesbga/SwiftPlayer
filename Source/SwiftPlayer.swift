//
//  SwiftPlayer.swift
//  Pods
//
//  Created by iTSangar on 1/14/16.
//
//

import Foundation
import MediaPlayer

// MARK: - SwiftPlayer Delegate -
public protocol SwiftPlayerDelegate: class {
  func playerDurationTime(_ time: Float)
  func playerCurrentTimeChanged(_ time: Float)
  func playerRateChanged(_ isPlaying: Bool)
  func playerCurrentTrackChanged(_ track: PlayerTrack?)
}

extension SwiftPlayerDelegate {
  func playerDurationTime(_ time: Float) {}
  func playerCurrentTimeChanged(_ time: Float) {}
  func playerRateChanged(_ isPlaying: Bool) {}
  func playerCurrentTrackChanged(_ track: PlayerTrack?) {}
}

// MARK: - SwiftPlayer Queue Delegate -
public protocol SwiftPlayerQueueDelegate: class {
  func queueUpdated()
}

extension SwiftPlayerQueueDelegate {
  func queueUpdated() {}
}


// MARK: - SwiftPlayer Struct -
/// Struct to access player actions 🎵
open class SwiftPlayer {
  
  /// Set logs
  open static func logs(_ active: Bool) {
    HysteriaManager.sharedInstance.logs = active
  }
  
  /// Set delegate
  open static func delegate(_ delegate: SwiftPlayerDelegate) {
    HysteriaManager.sharedInstance.delegate = delegate
  }
  
  /// Set ViewController
  open static func controller(_ controller: UIViewController?) {
    HysteriaManager.sharedInstance.controller = controller
  }
  
  // Get ViewController
  open static func playerController() -> UIViewController? {
    return HysteriaManager.sharedInstance.controller
  }
  
  /// ▶️ Play music
  open static func play() {
    HysteriaManager.sharedInstance.play()
  }
  
  /// ▶️🔢 Play music by specified index
  open static func playAtIndex(_ index: Int) {
    HysteriaManager.sharedInstance.playAtIndex(index)
  }
  
  /// ▶️0️⃣ Play all tracks starting by 0
  open static func playAll() {
    HysteriaManager.sharedInstance.playAllTracks()
  }
  
  /// ⏸ Pause music if music is playing
  open static func pause() {
    HysteriaManager.sharedInstance.pause()
  }
  
  /// ⏩ Play next music
  open static func next() {
    HysteriaManager.sharedInstance.next()
  }
  
  /// ⏪ Play previous music
  open static func previous() {
    HysteriaManager.sharedInstance.previous()
  }
  
  /// Return true if sound is playing
  open static func isPlaying() -> Bool {
    return HysteriaManager.sharedInstance.hysteriaPlayer!.isPlaying()
  }
  
  /// 🔀 Enable the player shuffle
  open static func enableShufle() {
    HysteriaManager.sharedInstance.enableShuffle()
  }
  
  /// Disable player shuffle
  open static func disableShuffle() {
    HysteriaManager.sharedInstance.disableShuffle()
  }
  
  /// Return true if 🔀 shuffle is enable
  open static func isShuffle() -> Bool {
    return HysteriaManager.sharedInstance.shuffleStatus()
  }
  
  /// 🔁 Enable repeat mode on music list
  open static func enableRepeat() {
    HysteriaManager.sharedInstance.enableRepeat()
  }
  
  /// 🔂 Enable repeat mode only in actual music
  open static func enableRepeatOne() {
    HysteriaManager.sharedInstance.enableRepeatOne()
  }
  
  /// Disable repeat mode
  open static func disableRepeat() {
    HysteriaManager.sharedInstance.disableRepeat()
  }
  
  /// Return true if 🔁 repeat or 🔂 repeatOne is enable
  open static func isRepeat() -> Bool {
    let (_, _, Off) = HysteriaManager.sharedInstance.repeatStatus()
    return !Off
  }
  
  /// Return true if 🔂 repeatOne is enable
  open static func isRepeatOne() -> Bool {
    let (_, One, _) = HysteriaManager.sharedInstance.repeatStatus()
    return One
  }
  
  /// 🔘 Set new seek value from UISlider
  open static func seekToWithSlider(_ slider: UISlider) {
    HysteriaManager.sharedInstance.seekTo(slider)
  }
  
  /// Get duration time of track
  open static func trackDurationTime() -> Float {
    return HysteriaManager.sharedInstance.playingItemDurationTime()
  }
  
  /// 🔊 Player volume view
  open static func volumeViewFrom(_ view: UIView) -> MPVolumeView {
    return HysteriaManager.sharedInstance.volumeViewFrom(view)
  }
  
  // MARK: QUEUE
 
  /// Set new playlist in player
  open static func newPlaylist(_ playlist: [PlayerTrack]) -> SwiftPlayer.Type {
    HysteriaManager.sharedInstance.setPlaylist(playlist)
    return self
  }
  
  /// Set queue delegate
  open static func queueDelegate(_ delegate: SwiftPlayerQueueDelegate) {
    HysteriaManager.sharedInstance.queueDelegate = delegate
  }
  
  /// Add new track in next queue
  open static func addNextTrack(_ track: PlayerTrack) {
    HysteriaManager.sharedInstance.addPlayNext(track)
  }
  
  /// Total tracks in playlists
  open static func totalTracks() -> Int {
    return HysteriaManager.sharedInstance.queue.totalTracks()
  }
  
  /// Tracks in main queue
  open static func mainTracks() -> [PlayerTrack] {
    return HysteriaManager.sharedInstance.queue.mainQueue
  }
  
  /// Tracks without playing track in next queue
  open static func nextTracks() -> [PlayerTrack] {
    if let index = SwiftPlayer.currentTrackIndex() {
      if SwiftPlayer.trackAtIndex(index).origin == TrackType.next {
        var pop = HysteriaManager.sharedInstance.queue.nextQueue
        pop.remove(at: 0)
        return pop
      }
    }
    
    
    return HysteriaManager.sharedInstance.queue.nextQueue
  }
  
  /// All tracks by index 
  open static func trackAtIndex(_ index: Int) -> PlayerTrack {
    return HysteriaManager.sharedInstance.queue.trackAtIndex(index)
  }
  
  /// Current AVPlayerItem
  open static func currentItem() -> AVPlayerItem {
    return HysteriaManager.sharedInstance.currentItem()
  }
  
  /// Current index of playlist
  open static func currentTrackIndex() -> Int? {
    return HysteriaManager.sharedInstance.currentIndex()
  }
  
  /// Play music from main queue by specified index
  open static func playMainAtIndex(_ index: Int) {
    HysteriaManager.sharedInstance.playMainAtIndex(index)
  }
  
  /// Play music from next queue by specified index
  open static func playNextAtIndex(_ index: Int) {
    HysteriaManager.sharedInstance.playNextAtIndex(index)
  }
}
