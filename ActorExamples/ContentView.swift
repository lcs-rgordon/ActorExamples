//
//  ContentView.swift
//  ActorExamples
//
//  Created by Russell Gordon on 2021-08-03.
//

import SwiftUI

actor User {
    
    var score = 10
    
    func printScore() {
        print("My score is \(score)")
    }
    
    func copyScore(from other: User) async {
        // Steal another user's score
        score = await other.score
    }
    
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
