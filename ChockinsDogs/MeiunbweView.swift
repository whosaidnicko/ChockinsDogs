//
//  MeiunbweView.swift
//  ChockinsDogs
//
//  Created by Nicolae Chivriga on 09/03/2025.
//

import SwiftUI


struct MeiunbweView: View {
    @State var appearAiveything: Bool = false
    var body: some View {
        ZStack {
            Image("obbkagridinto")
                .resizable()
                .ignoresSafeArea()
            
            HStack(spacing: 20)  {
                NavigationLink {
                    OptionititoViushka()
                } label: {
                    Image("nastroibutoncik")
                        
                }
                .scaleEffect(appearAiveything ? 1 : 0)
                .animation(Animation.bouncy.delay(0.11), value: appearAiveything)

             
                
                VStack {
                    Image("lochockgs")
                        .offset(y: appearAiveything ? 0 : -UIScreen.main.bounds.height)
                        .animation(Animation.bouncy.delay(0.22), value: appearAiveything)
                    
                    NavigationLink {
                        DosplacpuzzleView()
                    } label: {
                        Image("butonciks")
                    }
                        .offset(y: appearAiveything ? 0 : UIScreen.main.bounds.height)
                        .animation(Animation.bouncy.delay(0.33), value: appearAiveything)
                }
                
                NavigationLink {
                    Rulietomavs()
                } label: {
                    Image("praviliuha")
                }

               
                    .offset(x: appearAiveything ? 0 : UIScreen.main.bounds.width)
                    .animation(Animation.bouncy.delay(0.44), value: appearAiveything)
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            appearAiveything = true 
        }
    }
}
