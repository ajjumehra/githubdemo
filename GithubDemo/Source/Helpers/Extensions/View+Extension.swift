//
//  View+Extension.swift
//  GithubDemo
//
//  Created by Ajay Mehra on 31/07/22.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func hidden(_ hidden: Binding<Bool>) -> some View {
        if !hidden.wrappedValue {
            self
        }
    }
}
