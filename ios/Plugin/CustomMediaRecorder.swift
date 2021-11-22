//
//  CustomMediaRecorder.swift
//  Plugin
//
//  Created by Avihu Harush on 17/07/2021.
//

import Foundation
import AVFoundation

class CustomMediaRecorder {
    
    private var recordingSession: AVAudioSession!
    private var audioRecorder: AVAudioRecorder!
    private var audioFilePath: URL!
    
    private let settings = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
        AVSampleRateKey: 44100,
        AVNumberOfChannelsKey: 1,
        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
    ]
    
    private func getDirectoryToSaveAudioFile() -> URL {
        return URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
    }
    
    public func startRecording() -> Bool {
        do {
            recordingSession = AVAudioSession.sharedInstance()
            try recordingSession.setCategory(AVAudioSession.Category.playAndRecord)
            try recordingSession.setActive(true)
            audioFilePath = getDirectoryToSaveAudioFile().appendingPathComponent("\(UUID().uuidString).aac")
            audioRecorder = try AVAudioRecorder(url: audioFilePath, settings: settings)
            audioRecorder.record()
            return true
        } catch {
            return false
        }
    }
    
    public func pauseRecording() {
        do {
          audioRecorder.pause()
        } catch {}
    }
  
    public func resumeRecording() {
        do {
          audioRecorder.record()
        } catch {}
    }

    public func stopRecording(deleteFile: Bool = false) {
        do {
            audioRecorder.stop()
            try recordingSession.setActive(false)
            if (deleteFile) {
              audioRecorder.deleteRecording()
            }
            audioRecorder = nil
            recordingSession = nil
        } catch {}
    }
    
    public func getOutputFile() -> URL {
        return audioFilePath
    }
}
