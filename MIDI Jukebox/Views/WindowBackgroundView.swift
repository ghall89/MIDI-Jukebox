import SwiftUI

struct WindowBackgroundView: View {
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.fill(
					LinearGradient(gradient: Gradient(colors: [
						.windowGradientStart,
						.windowGradientEnd
					]),
					startPoint: .top, endPoint: .bottom)
				)
				.stroke(.windowGradientEnd, style: .init(lineWidth: 1))
				.frame(height: 190)
				.offset(y: -23)
			RoundedRectangle(cornerRadius: Constants.windowControlsRadius)
				.fill(Color.black.mix(with: .white, by: 0.34))
				.frame(width: 62, height: 21)
				.padding(1)
				.background {
					RoundedRectangle(cornerRadius: Constants.windowControlsRadius)
						.fill(
							LinearGradient(gradient: Gradient(colors: [
								Color.black.mix(with: .white, by: 0.1),
								Color.black.mix(with: .white, by: 0.9),
							]),
							startPoint: .top, endPoint: .bottom)
						)
				}
				.offset(x: -215, y: -86)
			Circle()
				.fill(
					LinearGradient(gradient: Gradient(colors: [
						Color.white.opacity(0),
						Color.white.opacity(0.05)
					]),
					startPoint: .top, endPoint: .bottom)
				)
				.scaleEffect(x: 4, y: 1, anchor: .center)
				.offset(y: -64)
		}
	}
}

private enum Constants {
	static let windowControlsRadius: CGFloat = 8
}
