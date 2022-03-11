//
//  MiniGameView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI

struct MiniGameView: View {
    @State var state = 0
    
    // not navigation
    @State var start = false
    
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        VStack {
            Button("카드 맞추기") {
                print("asdf")
                start = true
            }
            .fullScreenCover(isPresented: $start, content: MiniGameIntro.init)
            .font(.custom("NotoSansKR-Bold", size: 20))
            .padding()
            .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
            .background(Color.init(hex: "008E00"))
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.bottom, 50)
            
            Button("단어 맞추기") {
                print("asdf")
                start = true
            }
            .fullScreenCover(isPresented: $start, content: MiniGame2B.init)
            .font(.custom("NotoSansKR-Bold", size: 20))
            .padding()
            .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
            .background(Color.init(hex: "008E00"))
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.bottom, 50)
            
            Button("타이머 게임") {
                print("asdf")
                start = true
            }
            .fullScreenCover(isPresented: $start, content: WelcomeView.init)
            .font(.custom("NotoSansKR-Bold", size: 20))
            .padding()
            .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
            .background(Color.init(hex: "008E00"))
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        
//        NavigationView {
//            VStack{
//                NavigationLink(destination: MiniGameIntro()) {
//                    Text("카드 맞추기")
//                }
//                .padding()
//                NavigationLink(destination:MiniGame2B()) {
////                                MiniGame2B(currentPage: .constant(Pages.GamePage)
//                    Text("단어 맞추기")
//                }
//                .padding()
//                NavigationLink(destination: WelcomeView()) {
//                    Text("타이머 게임")
//                }
//                .padding()
//            }
//            .navigationBarHidden(true)
//        }
    }
}

struct MiniGameView_Previews: PreviewProvider {
    static var previews: some View {
        MiniGameView()
    }
}
