//
//  minigame2View.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/02.
//

import SwiftUI
import Combine

struct MiniGame2View: View {
    @ObservedObject var viewM = MiniGame2VM()
    @State private var isPaused: Bool = true
    
    var body: some View {
        VStack{
            GroupBox{
                ForEach(0..<10){ i in
                    HStack{
                        ForEach(0..<10){ j in
                            Button {
                                if viewM.gameboard[i] == 1 {
                                    viewM.checkboard = [i]
                                }
                            }
                        label: {
                            Text("")
                                .frame(width: 30, height: 30, alignment: .center)
                        }
                        .background(viewM.gameboard[(i * 2) + (j)] == 0 ? Color(hex: "4E9F3D") : Color(hex: "D8E9A8"))
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                        .cornerRadius(9)
                        }
                    }
                }
            }
        }.padding()
        GroupBox{
            ForEach(0..<2){ i in
                HStack{
                    ForEach(0..<6){ j in
                        Button {
                            if viewM.checkArray.isEmpty{
                                viewM.add(pos: (i * 2) + (j))
                                viewM.alphaboard[(i * 2) + (j)] = 1
                                print(viewM.checkArray)
                            }
                            else{
                                // 단어와 뜻이 맞으면 disable
                                if viewM.check(a: viewM.alphabet[viewM.checkArray[0]], b: viewM.alphabet[(i * 2) + (j)]) {
                                    viewM.alphaboard[(i * 2) + (j)] = 2
                                    viewM.alphaboard[viewM.checkArray[0]] = 2
                                    // 게임이 끝났는지 체크
                                    if viewM.checkEnd(){
                                        self.isPaused = false
                                    }
                                }
                                // 단어와 뜻이 다르면
                                else {
                                    for i in viewM.checkArray{
                                        viewM.alphaboard[i] = 0
                                    }
                                }
                                viewM.checkArray.removeAll()
                            }
                        } label: {
                            Text(viewM.alphabet[(i * 2) + (j)])
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                        .background(viewM.alphaboard[(i * 2) + (j)] == 0 ? Color(hex: "4E9F3D") : Color(hex: "D8E9A8"))
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        // Disable Animation
                        .scaleEffect(viewM.alphaboard[(i * 2) + (j)] == 2 ? 0 : 1)
                        .animation(.easeInOut(duration: 0.3), value: viewM.alphaboard[(i * 4) + (j)] == 2 ? 0 : 1)
                    }
                }
            }
        }
    }
}


struct minigame2View_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2View()
    }
}
