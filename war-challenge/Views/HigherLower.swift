//
//  HigherLower.swift
//  war-challenge
//
//  Created by Matko Setnik on 24.05.2022..
//

import SwiftUI

struct HigherLower: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var gameFinished = false
    
    
    var body: some View {
        ZStack{
            Image("background")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                if(playerScore == 10) {
                    VStack {
                        Text("You Win! Rematch?")
                            .foregroundColor(.white)
                            .font(.title3)
                        
                        Button {
                            again()
                        } label: {
                            Text("Again")
                        }
                        .tint(.green)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .controlSize(.large)

                    }
                } else if (cpuScore == 10) {
                    VStack {
                        Text("Loser! Rematch?")
                            .foregroundColor(.white)
                            .font(.title3)
                        
                        Button {
                            again()
                        } label: {
                            Text("Again")
                        }
                        .tint(.red)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .controlSize(.large)

                    }
                } else {
                    Button {
                        let playerRand = Int.random(in: 2...14)
                        let cpuRand = Int.random(in: 2...14)
                        
                        // Update cards
                        playerCard = "card" + String(playerRand)
                        cpuCard = "card" +  String(cpuRand)
                                            
                        // update score
                        if(playerRand > cpuRand) {
                             playerScore += 1
                        } else if (cpuRand > playerRand) {
                            cpuScore += 1
                        }
                        
                        if(playerScore == 10 && cpuScore == 10) {
                            gameFinished = true
                        }
                        
                    } label: {
                        Image("dealbutton")
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                            .font(.headline)
                        Text(String(playerScore))
                            .foregroundColor(Color.white)
                            .font(.title)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .foregroundColor(Color.white)
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .foregroundColor(Color.white)
                            .font(.title)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    private func again() {
        playerScore = 0
        cpuScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HigherLower()
    }
}
