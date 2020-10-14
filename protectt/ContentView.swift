//
//  ContentView.swift
//  protectt
//
//  Created by User09 on 2020/10/14.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    var body: some View {
        VStack{
            Button(show ? "hide" : "show"){
                show.toggle()
            }
            
            if show{
                Image("mm")
                    .transition(.customTransition)
            }else{
                Image("mm")
                    .hidden()
            }
        }
        .animation(.easeInOut(duration: 5))
    }
}

extension AnyTransition{
    static var customTransition : AnyTransition{
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.offset(x: 200, y: 200)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
