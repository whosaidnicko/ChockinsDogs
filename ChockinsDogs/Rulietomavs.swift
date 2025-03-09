//
//  Rulietomavs.swift
//  ChockinsDogs
//
//  Created by Nicolae Chivriga on 09/03/2025.
//

import SwiftUI


struct Rulietomavs: View {
    var body: some View {
        ZStack {
            Image("obbkagridinto")
                .resizable()
                .ignoresSafeArea()
            
            Image("ruliks")
                .resizable()
                .scaledToFit()
                .padding(30)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: MergemIniapue())
    }
}
