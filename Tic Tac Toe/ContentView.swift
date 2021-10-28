//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Student on 10/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = Array(repeating: "", count: 9)
    @State private var xTurn = true
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .fontWeight(.bold)
                .font(.title)
                .padding()
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: 15), count: 3), spacing: 15, content: {
                ForEach(0..<9) { index in
                    ZStack {
                        
                        
                        Color.blue
                        Color.white
                            .opacity(moves[index] == "" ? 1 : 0)
                            .frame(width: 120, height: 120, alignment: .center)
                            .cornerRadius(30)
                            .onTapGesture {
                                withAnimation(Animation.default) {
                                    if moves[index] == "" {
                                        moves[index] = xTurn ? "X" : "O"
                                        xTurn.toggle()
                                    }
                                }
                            }
                            .rotation3DEffect(
                                .init(degrees: moves[index] != "" ? 180 : 0),
                                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                        
                        Text(moves[index])
                            .font(.system(size: 80))
                            .fontWeight(.heavy)
                    }
                }
                
                
                
            })
            
            
        }
        .preferredColorScheme(.dark)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
