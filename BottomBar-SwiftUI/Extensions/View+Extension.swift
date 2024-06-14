//
//  View+Extension.swift
//  BottomBar-SwiftUI
//
//  Created by Sumit on 05/06/24.
//

import SwiftUI

public extension View {
    func tabItem<SelectionValue: Hashable,
                 N: View,
                 S: View>(tag: SelectionValue,
                          @ViewBuilder normal: @escaping () -> N,
                          @ViewBuilder select: @escaping () -> S) -> some View {
        modifier(ATTabItemModifier(tag: tag,
                                   normal: normal(),
                                   select: select()))
    }
}
