//
//  Slots.swift
//  war-challenge
//
//  Created by Matko Setnik on 24.05.2022..
//

import SwiftUI

struct Slots: View {
    
    @State private var credits = 1500
    @State private var itemsToRender = [1, 2,3 ]
    private var bonus = 1500
    @State private var btnDisabled = false
    
    var body: some View {
        VStack {
            Text("SwiftUI Slots!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 50.0)
            Spacer()
            Text("Credits: " + String(credits))
            
            Spacer()
            HStack {
                Spacer()
                Image("fruit\(String(itemsToRender[0]))")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image("fruit\(String(itemsToRender[1]))")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image("fruit\(String(itemsToRender[2]))")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Spacer()
                
            
            if (btnDisabled) {
               Text("You lose! Try again")
                
                Button("Again") {
                    reset()
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                
            } else {
                Button("Spin") {
                    spin()
                }
                .tint(.purple)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            }
            Spacer()
        }
        
        
    }
    
    
    
    private func spin() -> Void {
        credits -= 250
        
        let item1 = Int.random(in: 1...3)
        let item2 = Int.random(in: 1...3)
        let item3 = Int.random(in: 1...3)
        
        
        itemsToRender = [item1, item2,item3]
        
        checkResult()
    }
    
    private func checkResult() {
        if(itemsToRender[0] == itemsToRender[1] && itemsToRender[1] == itemsToRender[2]) {
            credits += bonus
        }
        
        if(credits == 0) {
            btnDisabled = true
        }
    }
    
    private func reset () {
        credits = 1500
        btnDisabled = false
    }
}

struct Slots_Previews: PreviewProvider {
    static var previews: some View {
        Slots()
    }
}
