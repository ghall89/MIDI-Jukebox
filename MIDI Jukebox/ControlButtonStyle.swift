import SwiftUI

struct ControlButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		RoundedRectangle(cornerRadius: 8)
			.fill(.windowGradientEnd)
			.shadow(radius: 4)
			.frame(width: Constants.buttonWidth, height: Constants.buttonWidth)
			.overlay {
				configuration.label
					.padding()
					.frame(width: Constants.buttonWidth, height: Constants.buttonWidth)
					.background(
						RoundedRectangle(cornerRadius: 8)
							.fill(LinearGradient(gradient: Gradient(colors: [.windowGradientStart, .windowGradientMid]), startPoint: .topLeading, endPoint: .bottomTrailing))
							.overlay {
								RoundedRectangle(cornerRadius: 8)
									.fill(LinearGradient(gradient: Gradient(colors: [.windowGradientMid, .windowGradientStart]), startPoint: .topLeading, endPoint: .bottomTrailing))
									.padding(4)
							}
					)
					.foregroundColor(.black)
					.offset(y: configuration.isPressed ? -1 : -3)
			}
			.padding(1)
			.background {
				RoundedRectangle(cornerRadius: 8)
					.fill(.black)
			}
			.animation(.linear(duration: 0.06), value: configuration.isPressed)
	}
}

private enum Constants {
	static let buttonWidth: CGFloat = 36
	static let buttonHeight: CGFloat = 28
}
