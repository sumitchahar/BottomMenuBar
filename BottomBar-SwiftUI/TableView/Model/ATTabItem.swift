//
//  ATTabItem.swift
//  BottomBar-SwiftUI
//
//  Created by Sumit on 05/06/24.
//


import SwiftUI

/// Tab button information.
struct ATTabItem: Identifiable {
    
    let id = UUID()
    
    /// A tag that separates the tab view.
    let tag: Any
    
    /// The tab button view in the unselected state.
    let normal: AnyView
    
    /// The tab button view in the selected state.
    let select: AnyView
    
    init<V: View>(tag: Any, normal: V, select: V) {
        self.tag = tag
        self.normal = AnyView(normal)
        self.select = AnyView(select)
    }
}