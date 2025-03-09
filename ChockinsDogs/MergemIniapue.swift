//
//  MergemIniapue.swift
//  ChockinsDogs
//
//  Created by Nicolae Chivriga on 09/03/2025.
//

import SwiftUI


struct MergemIniapue: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("ezsrter")
                .resizable()
                .frame(width: 44, height: 38)
        }

    }
}
