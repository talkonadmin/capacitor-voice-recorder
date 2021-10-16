import { WebPlugin } from '@capacitor/core';

import type { GenericResponse, RecordingData, VoiceRecorderPlugin } from './definitions';

export class VoiceRecorderWeb extends WebPlugin implements VoiceRecorderPlugin {

  canDeviceVoiceRecord (): Promise<GenericResponse> {
    return Promise.reject(new Error('VoiceRecorder does not have web implementation'));
  }

  hasAudioRecordingPermission (): Promise<GenericResponse> {
    return Promise.reject(new Error('VoiceRecorder does not have web implementation'));
  }

  requestAudioRecordingPermission (): Promise<GenericResponse> {
    return Promise.reject(new Error('VoiceRecorder does not have web implementation'));
  }

  startRecording (): Promise<GenericResponse> {
    return Promise.reject(new Error('VoiceRecorder does not have web implementation'));
  }

  pauseRecording (): Promise<GenericResponse> {
    return Promise.reject(new Error('VoiceRecorder does not have web implementation'));
  }

  resumeRecording (): Promise<GenericResponse> {
    return Promise.reject(new Error('VoiceRecorder does not have web implementation'));
  }

  stopRecording (): Promise<RecordingData> {
    return Promise.reject(new Error('VoiceRecorder does not have web implementation'));
  }

  cancelRecording (): Promise<GenericResponse> {
    return Promise.reject(new Error('VoiceRecorder does not have web implementation'));
  }

}
