//
//  ContentView.swift
//  ActorExamples
//
//  Created by Russell Gordon on 2021-08-03.
//

import SwiftUI

// Allows us to serialize a queue so that the data can be accessed safely
actor URLCache {
    
    // Private, so we hide the cache so it is accessed through the method
    private var cache = [URL: Data]()
    
    func data(for url: URL) async throws -> Data {
        if let cached = cache[url] {
            return cached
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        cache[url] = data
        
        return data
    }
}

// Example of creating a data race – two tasks could be calling transfer at the same time on the same account
// NOT GOOD! Transfer $100 from an account with only $100 in it... two transfers could pass the guard statement at the same time, allowing $200 to be transferred from the account that had only $100 in it... we end up with -$100, which should not be possible
actor BankAccount {
    var balance: Decimal
    
    init(initialBalance: Decimal) {
        balance = initialBalance
    }
    
    func deposit(amount: Decimal) {
        balance += amount
    }
    
    func transfer(amount: Decimal, to other: BankAccount) {
        guard balance >= amount else {
            return
        }
        balance -= amount
        await other.deposit(amount: amount)
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
