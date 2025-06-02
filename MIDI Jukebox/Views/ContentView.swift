import AquaUI
import SwiftUI

struct ContentView: View {
	@StateObject var midiController: MIDIController

	init(document: MIDI_JukeboxDocument) {
		_midiController = StateObject(wrappedValue: try! MIDIController(midiData: document.midiData))
	}

	var body: some View {
		VStack(spacing: 10) {
			ProgressView()
				.offset(y: -14)
			ControlView()
		}
		.padding()
		.padding(.top, 0)
		.background {
			WindowBackgroundView()
		}
		.ignoresSafeArea(.all)
		.frame(width: 500, height: 145)
		.environmentObject(midiController)
	}
}
