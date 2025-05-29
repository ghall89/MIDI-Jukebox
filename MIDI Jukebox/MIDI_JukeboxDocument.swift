import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "audio/midi")
    }
}

struct MIDI_JukeboxDocument: FileDocument {
	var midiData: Data
	
	init(midiData: Data = Data()) {
		self.midiData = midiData
	}
	
	static var readableContentTypes: [UTType] { [.midi] }
	
	init(configuration: ReadConfiguration) throws {
		guard let data = configuration.file.regularFileContents else {
			throw CocoaError(.fileReadCorruptFile)
		}
		midiData = data
	}
	
	func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
		return .init(regularFileWithContents: midiData)
	}
}
