//
//  ContentView.swift
//  ActorExamples
//
//  Created by Russell Gordon on 2021-08-03.
//

import SwiftUI

// Actors have a queue of requests that are executed in the order they are received
// Priorities for requests can be used to escalate requests
// Only one piece of logic can access mutable state of an actor at a time (actor isolation)
actor User {
    
    let score = 10
    
    func printScore() {
        print("My score is \(score)")
    }
    
    func copyScore(from other: User) async {
        // Steal another user's score
        print(other.score)
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
