//
//  ATBackgroundStyle.swift
//  BottomBar-SwiftUI
//
//  Created by Sumit on 05/06/24.
//

import SwiftUI


/// The protocol that defines the backgroundstyle of the tab view.
public protocol ATBackgroundStyle: View {
    
    /// The current state of the tab view.
    var state: ATTabState { get }
    
}
