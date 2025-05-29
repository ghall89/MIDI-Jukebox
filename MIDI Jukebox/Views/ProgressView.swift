import CompactSlider
import SwiftUI

struct ProgressView: View {
	@EnvironmentObject var midiController: MIDIController

	var body: some View {
		VStack {
			Text(midiController.trackName)
				.font(.custom("Helvetica", size: 14))
				.foregroundStyle(Color.windowGradientEnd)
			HStack(alignment: .center) {
				Text(formatTimeInterval(midiController.currentPosition))
					.font(.custom("Helvetica", size: 11))
					.foregroundStyle(Color.windowGradientEnd)
				CompactSlider(value: $midiController.currentPosition, in: 0 ... midiController.player.duration)
					.compactSliderHandleStyle(.capsule(color: .primary))
					.frame(height: 8)
			}
		}
		.frame(maxWidth: .infinity)
		.padding(8)
		.background {
			RoundedRectangle(cornerRadius: 4)
				.fill(LinearGradient(gradient: Gradient(colors: [.trackInfoGradientStart, .trackInfoGradientEnd]), startPoint: .top, endPoint: .bottom))
		}
		.padding(1)
		.background {
			RoundedRectangle(cornerRadius: 4)
				.fill(.trackInfoGradientEnd)
		}
		.padding(2)
		.background {
			RoundedRectangle(cornerRadius: 5)
				.fill(LinearGradient(gradient: Gradient(colors: [.windowGradientEnd, .windowGradientStart]), startPoint: .top, endPoint: .bottom))
		}
	}

	private func formatTimeInterval(_ interval: TimeInterval) -> String {
		let minutes = Int(interval) / 60
		let seconds = Int(interval) % 60
		return String(format: "%02d:%02d", minutes, seconds)
	}
}
