//
//  StepsView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

private struct StepPreferenceKey: PreferenceKey {
	static var defaultValue: [Int: CGFloat] = [:]
	static func reduce(value: inout [Int: CGFloat], nextValue: () -> [Int: CGFloat]) {
		value.merge(nextValue(), uniquingKeysWith: { $1 })
	}
}

struct StepsView: View {
	let steps: [String]
	@State private var activeStep: Int = 0
	@State private var animateGradient = false

	var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea()

			MeshGradient(width: 3, height: 3, points: [
				.init(0, 0), .init(0.5, 0), .init(1, 0),
				.init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
				.init(0, 1), .init(0.5, 1), .init(1, 1)
			], colors: [
				.brown, .yellow, .orange,
				.orange, .orange, .yellow,
				.yellow, .brown, .orange
			])
			.blur(radius: 25, opaque: true)
			.ignoresSafeArea()
			.opacity(0.6)

			GeometryReader { proxy in
				ScrollViewReader { scrollProxy in
					ScrollView {
						LazyVStack(alignment: .leading, spacing: 16) {
							Color.clear
								.frame(height: proxy.size.height/2)

							ForEach(0..<steps.count) { index in
								HStack(alignment: .top) {
									Text("\(index + 1)")
										.padding()
										.font(.title)
										.fontWeight(.bold)
										.foregroundColor(activeStep == index ? .yellow : .white.opacity(0.2))
										.blur(radius: activeStep == index ? 0 : 3)

									Text(self.steps[index])
										.padding()
										.font(.title)
										.fontWeight(.bold)
										.foregroundColor(activeStep == index ? .yellow : .white.opacity(0.2))
										.blur(radius: activeStep == index ? 0 : 3)
								}
								.padding()
								.id(index)
								.onTapGesture {
									withAnimation {
										activeStep = index
										scrollProxy.scrollTo(index, anchor: .center)
									}
								}
								.background(GeometryReader { geo in
									Color.clear.preference(
										key: StepPreferenceKey.self,
										value: [index: geo.frame(in: .named("scroll")).midY]
									)
								})
								.animation(.easeInOut(duration: 0.3), value: activeStep)
							}

							Color.clear
								.frame(height: proxy.size.height/2)
						}
					}
					.coordinateSpace(name: "scroll")
					.onPreferenceChange(StepPreferenceKey.self) { values in
						let centerY = proxy.size.height / 2
						if let closest = values.min(by: { abs($0.value - centerY) < abs($1.value - centerY) }) {
							activeStep = closest.key
						}
					}
				}
			}
		}
		.sensoryFeedback(.impact(flexibility: .solid, intensity: 0.5), trigger: activeStep)
	}
}

#Preview {
	let mockSteps = [
		"Подготовьте все ингредиенты и протрите рабочую поверхность.",
		"Нагрейте духовку до 180°C.",
		"В большой миске смешайте муку, сахар и разрыхлитель.",
		"Добавьте яйца и растопленное масло, хорошо перемешайте.",
		"Выложите тесто в форму и выпекайте 25–30 минут.",
		"Дайте готовому пирогу остыть прежде чем нарезать."
	]

	StepsView(steps: mockSteps)
}
