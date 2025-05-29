import SwiftUI

struct ContentView: View {
	@StateObject var midiController: MIDIController

	init(document: MIDI_JukeboxDocument) {
		_midiController = StateObject(wrappedValue: try! MIDIController(midiData: document.midiData))
	}

	var body: some View {
		VStack(spacing: 10) {
			ProgressView()
			HStack(alignment: .center) {
				Button(action: {
					midiController.seek(direction: .back)
				}, label: {
					Image(systemName: "backward.fill")
						.font(.system(size: 20))
				})
				.buttonStyle(.plain)
				Button(action: midiController.playPause, label: {
					Image(systemName: midiController.player.isPlaying ? "pause.fill" : "play.fill")
						.font(.system(size: 20))
				})
				.buttonStyle(.plain)

				Button(action: {
					midiController.seek(direction: .forward)
				}, label: {
					Image(systemName: "forward.fill")
						.font(.system(size: 20))
				})
				.buttonStyle(.plain)
			}
			.frame(maxWidth: .infinity)
			.overlay {
				HStack {
					Spacer()
					Toggle(isOn: $midiController.loopTrack, label: {
						Image(systemName: "repeat")
							.foregroundStyle(midiController.loopTrack ? Color.accentColor : Color.primary)
							.font(.system(size: 14))
					})
					.toggleStyle(.button)
					.buttonStyle(.plain)
				}
				.frame(maxWidth: .infinity)
			}
		}
		.padding()
		.padding(.top, 0)
		.background {
			LinearGradient(gradient: Gradient(colors: [.windowGradientStart, .windowGradientEnd]), startPoint: .top, endPoint: .bottom)
				.ignoresSafeArea(.all)
		}
		.frame(minWidth: 300)
		.environmentObject(midiController)
	}
}
