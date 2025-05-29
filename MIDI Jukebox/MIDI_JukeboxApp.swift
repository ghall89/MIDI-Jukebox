import SwiftUI

@main
struct MIDI_JukeboxApp: App {
	var body: some Scene {
		DocumentGroup(newDocument: MIDI_JukeboxDocument()) { file in
			ContentView(document: file.document)
		}
		.windowStyle(.hiddenTitleBar)
		.windowResizability(.contentSize)
	}
}
