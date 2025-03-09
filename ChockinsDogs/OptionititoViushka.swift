//
//  OptionititoViushka.swift
//  ChockinsDogs
//
//  Created by Nicolae Chivriga on 09/03/2025.
//

import SwiftUI
import StoreKit


struct OptionititoViushka: View {
    var body: some View {
        ZStack {
            Image("obbkagridinto")
                .resizable()
                .ignoresSafeArea()
            // rate
            Image("nastroishile")
            
            Button {
                if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                         SKStoreReviewController.requestReview(in: scene)
                     }
            } label: {
                Image("rateknotpocika")
            }

        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: MergemIniapue())
    }
}
