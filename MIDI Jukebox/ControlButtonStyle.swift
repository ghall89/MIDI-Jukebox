import SwiftUI

struct ControlButtonStyle: ButtonStyle {
	let keepPressed: Bool?

	init(keepPressed: Bool? = false) {
		self.keepPressed = keepPressed
	}

	func makeBody(configuration: Configuration) -> some View {
		RoundedRectangle(cornerRadius: Constants.buttonRadius)
			.fill(.windowGradientEnd)
			.shadow(radius: 4)
			.frame(width: Constants.buttonWidth, height: Constants.buttonWidth)
			.overlay {
				configuration.label
					.padding()
					.frame(width: Constants.buttonWidth, height: Constants.buttonWidth)
					.background(
						RoundedRectangle(cornerRadius: Constants.buttonRadius)
							.fill(LinearGradient(gradient: Gradient(colors: [.windowGradientStart, .windowGradientMid]), startPoint: .topLeading, endPoint: .bottomTrailing))
							.overlay {
								Circle()
//								RoundedRectangle(cornerRadius: Constants.buttonRadius)
									.fill(LinearGradient(gradient: Gradient(colors: [.windowGradientMid, .windowGradientStart]), startPoint: .topLeading, endPoint: .bottomTrailing))
									.padding(4)
							}
					)
					.foregroundColor(.black)
					.offset(y: configuration.isPressed ? 0 : (keepPressed == true ? -1 : -2))
			}
			.padding(1)
			.background {
				RoundedRectangle(cornerRadius: Constants.buttonRadius)
					.fill(.black)
			}
			.animation(.linear(duration: 0.01), value: configuration.isPressed)
	}
}

private enum Constants {
	static let buttonWidth: CGFloat = 36
	static let buttonHeight: CGFloat = 28
	static let buttonRadius: CGFloat = 6
}
