//
//  MainViewModel.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 30/09/2025
//

import Foundation
import Combine

@MainActor
final class AuthViewModel: ObservableObject {
    @Published private(set) var state: String = "idle"

    func load() async {
        // Llama servicios async/await aquí
        self.state = "loaded"
    }
}

