//
//  OpubiwnbeginView.swift
//  ChockinsDogs
//
//  Created by Nicolae Chivriga on 09/03/2025.
//

import SwiftUI
import Lottie


struct OpubiwnbeginView: View {
    @State var animatego: Bool = false
    var body: some View {
        ZStack {
            Image("obbkagridinto")
                .resizable()
                .ignoresSafeArea()
            
            NavigationLink("", destination: MeiunbweView(), isActive: $animatego)
            VStack {
                LottieView(animation: .named("caisheinocik"))
                    .playing(loopMode: .loop)
                    .resizable()
                
                    .frame(width: 165, height: 165)
                
                AnimatedText(
                    text: "LOADING...",
                    animation: TextLoadingAnimation(
                        font: .system(size: 15, weight: .bold, design: .rounded),
                        textColor: .white,
                        startOffset: 15,
                        endOffset: -15,
                        duration: 0.6,
                        staggerDelay: 0.1,
                        letterSpacing: 8
                    )
                )
            }
        }
        .fixadptivws()
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.4) {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                   impactMed.impactOccurred()
                self.animatego = true
            }
        }
    }
}



import SwiftUI

struct AnimatedText: View {
    let text: String
    let animation: TextLoadingAnimation

    @State private var offsets: [CGFloat]
    @State private var opacities: [Double]

    init(text: String, animation: TextLoadingAnimation) {
        self.text = text
        self.animation = animation
        self._offsets = State(initialValue: Array(repeating: animation.startOffset, count: text.count))
        self._opacities = State(initialValue: Array(repeating: animation.startOpacity, count: text.count))
    }

    var body: some View {
        HStack(spacing: animation.letterSpacing) {
            ForEach(Array(text.enumerated()), id: \.offset) { index, letter in
                Text(String(letter))
                    .font(animation.font)
                    .fontWeight(.bold)
                    .foregroundColor(animation.textColor)
                    .offset(y: offsets[index])
                    .opacity(opacities[index])
                    .animation(
                        Animation.easeInOut(duration: animation.duration)
                            .repeatForever()
                            .delay(Double(index) * animation.staggerDelay),
                        value: offsets[index]
                    )
            }
        }
        .onAppear {
            for i in 0..<text.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * animation.staggerDelay) {
                    offsets[i] = animation.endOffset
                    opacities[i] = animation.endOpacity
                }
            }
        }
    }
}

// Struct for customizing animation behavior
struct TextLoadingAnimation {
    var font: Font = .largeTitle
    var textColor: Color = .blue
    var startOffset: CGFloat = 10
    var endOffset: CGFloat = -10
    var startOpacity: Double = 0.3
    var endOpacity: Double = 1.0
    var duration: Double = 0.8
    var staggerDelay: Double = 0.1
    var letterSpacing: CGFloat = 5
}


