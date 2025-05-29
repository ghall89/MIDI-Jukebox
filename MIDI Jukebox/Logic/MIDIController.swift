import AVFAudio
import AVFoundation

final class MIDIController: ObservableObject {
	@Published var trackName: String =  "Unknown Track"
	@Published var player: AVMIDIPlayer
	@Published var currentPosition: TimeInterval = 0.0
	@Published var timer: Timer?
	@Published var loopTrack: Bool = false
	
	init(midiData: Data) throws {
		do {
			self.player = try .init(data: midiData, soundBankURL: nil)
			self.parseTrackName(from: midiData)
			self.player.prepareToPlay()
			self.startPositionMonitoring()
		} catch {
			throw error
		}
	}
	
	deinit {
		self.timer?.invalidate()
		self.timer = nil
		
		if self.player.isPlaying {
			self.player.stop()
		}
	}
	
	func playPause() {
		if self.player.isPlaying {
			self.player.stop()
		} else {
			self.player.play()
		}
	}
	
	func seek(direction: SeekDirection) {
		let modifier: TimeInterval = 5.0
		let currentPosition = self.player.currentPosition
		
		var newValue: TimeInterval?
		
		switch direction {
			case .back:
				newValue = currentPosition - modifier
			case .forward:
				newValue = currentPosition + modifier
		}
		
		self.player.currentPosition = self.clampTimeValue(newValue ?? 0.0)
	}
	
	func seekToTimeInterval(_ value: TimeInterval) {
		print(value)
		let clampedValue = self.clampTimeValue(value)
		
		print(clampedValue)
		
//		self.player.currentPosition = clampedValue
//		self.currentPosition = clampedValue
	}
	
	private func startPositionMonitoring() {
		self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
			guard let self = self else { return }
			self.currentPosition = self.clampTimeValue(self.player.currentPosition)

			if self.player.currentPosition >= self.player.duration {
				self.player.currentPosition = 0.0
				
				if !self.loopTrack {
					self.player.stop()
				}
			}
		}
	}
	
	private func clampTimeValue(_ value: TimeInterval) -> TimeInterval {
		return min(max(value, 0.0), self.player.duration)
	}
	
	private func parseTrackName(from midiData: Data)  {
		print(midiData)
	}
	
	enum SeekDirection {
		case forward
		case back
	}
}
