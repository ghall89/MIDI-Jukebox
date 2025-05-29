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
			ControlView()
		}
		.padding()
		.padding(.top, 0)
		.background {
			LinearGradient(gradient: Gradient(colors: [.windowGradientStart, .windowGradientEnd]), startPoint: .top, endPoint: .bottom)
				.frame(height: 190)
		}
		.ignoresSafeArea(.all)
		.frame(width: 500)
		.environmentObject(midiController)
	}
}
