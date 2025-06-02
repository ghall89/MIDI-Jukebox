import SwiftUI

struct ControlView: View {
	@EnvironmentObject var midiController: MIDIController
	
	var body: some View {
		HStack(alignment: .center, spacing: 2) {
			Button(action: {
				midiController.seek(direction: .back)
			}, label: {
				Image(systemName: "backward.fill")
			})
			.buttonStyle(ControlButtonStyle())
			Button(action: midiController.playPause, label: {
				Image(systemName: midiController.player.isPlaying ? "pause.fill" : "play.fill")
			})
			.buttonStyle(ControlButtonStyle(keepPressed: midiController.player.isPlaying))
			Button(action: {
				midiController.seek(direction: .forward)
			}, label: {
				Image(systemName: "forward.fill")
				
			})
			.buttonStyle(ControlButtonStyle())
		}
		.frame(maxWidth: .infinity)
		.overlay {
			HStack(alignment: .center) {
				Spacer()
				Circle()
					.frame(width: 6)
					.foregroundStyle(midiController.loopTrack ? Color.accentColor.mix(with: .white, by: 0.6) : Color.black)
					.shadow(color: .accent, radius: midiController.loopTrack ? 3 : 0)
					.padding(1)
					.background(
						Circle()
							.fill(.windowGradientEnd)
					)
					.animation(.easeInOut(duration: 0.24), value: midiController.loopTrack)
				Toggle(isOn: $midiController.loopTrack, label: {
					Image(systemName: "repeat")
				})
				.toggleStyle(.button)
				.buttonStyle(ControlButtonStyle(keepPressed: midiController.loopTrack))
			}
			.frame(maxWidth: .infinity)
		}
	}
}
