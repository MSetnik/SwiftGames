//
//  Home.swift
//  war-challenge
//
//  Created by Matko Setnik on 24.05.2022..
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .topLeading, endPoint: .trailing)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Text("Do you want to \n play a game?")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink {
                            HigherLower()
                        } label: {
                            VStack {
                                Image(systemName: "arrow.up.arrow.down.square")
                                    .foregroundColor(Color.white)
                                    .padding(.bottom, 10.0)
                                    .font(.largeTitle)
                                    
                                Text("Higher/Lower")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.white)
                                    .font(.subheadline)
                            }
                        }

                       
                        Spacer()
                        NavigationLink {
                            Slots()
                        } label: {
                            VStack {
                                Image(systemName: "square.grid.3x2")
                                    .foregroundColor(Color.white)
                                    .padding(.bottom, 10.0)
                                    .font(.largeTitle)
                                Text("Slots")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.white)
                                    .font(.subheadline)
                            }
                        }
                        Spacer()
                
                    }
                    Spacer()
                    
                    
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
