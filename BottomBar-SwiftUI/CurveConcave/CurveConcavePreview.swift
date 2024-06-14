//
//  CurveConcavePreview.swift
//  BottomBar-SwiftUI
//  Created by Sumit on 05/06/24.

 import SwiftUI

 struct CurveConcavePreview: View {
     
    @State private var selection: Int = 0
    @State private var constant = ATConstant(axisMode: .bottom, screen: .init(activeSafeArea: false), tab: .init())
    @State private var radius: CGFloat = 96
    @State private var concaveDepth: CGFloat = 0.96
    @State private var color: Color = Color(hex: 0x1A4E56)
    
    var body: some View {
        GeometryReader { proxy in
            AxisTabView(selection: $selection, constant: constant) { state in
                ATCurveStyle(state, color: color, radius: radius, depth: concaveDepth)
             } content: {
                 
               ControlView(selection: $selection, constant: $constant, radius: $radius, concaveDepth: $concaveDepth, color: $color, tag: 0, systemName: "house.fill", safeArea: proxy.safeAreaInsets)
                ControlView(selection: $selection, constant: $constant, radius: $radius, concaveDepth: $concaveDepth, color: $color, tag: 1, systemName: "sheqelsign.circle", safeArea: proxy.safeAreaInsets)
              ControlView(selection: $selection, constant: $constant, radius: $radius, concaveDepth: $concaveDepth, color: $color, tag: 2, systemName: "calendar", safeArea: proxy.safeAreaInsets)
                ControlView(selection: $selection, constant: $constant, radius: $radius, concaveDepth: $concaveDepth, color: $color, tag: 3, systemName: "gearshape", safeArea: proxy.safeAreaInsets)
                ControlView(selection: $selection, constant: $constant, radius: $radius, concaveDepth: $concaveDepth, color: $color, tag: 5, systemName: "calendar", safeArea: proxy.safeAreaInsets)

            } onTapReceive: { selectionTap in
                /// Imperative syntax
                print("---------------------")
                print("Selection : ", selectionTap)
                print("Already selected : ", self.selection == selectionTap)
            }
        }
        .animation(.easeInOut, value: constant)
        .animation(.easeInOut, value: radius)
        .animation(.easeInOut, value: concaveDepth)
        .navigationTitle("Screen \(selection + 1)")
        .edgesIgnoringSafeArea(.top)
    }
}


fileprivate
struct ControlView: View {
    
    @Binding var selection: Int
    @Binding var constant: ATConstant
    @Binding var radius: CGFloat
    @Binding var concaveDepth: CGFloat
    @Binding var color: Color
    
    let tag: Int
    let systemName: String
    let safeArea: EdgeInsets
    
    private var backgroundColor: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color(hex: 0x141E23), Color(hex: 0x0C2530), Color(hex: 0x0C1E26)]), startPoint: .top, endPoint: .bottom)
    }
    
    private var content: some View {
        VStack(spacing: 20) {
            
            if selection == 0 {
              //  Text("gkgkhl")
                 //   .foregroundStyle(.white)
            } else {
              //  Text("OtherThings")
                   // .foregroundStyle(.white)
            }
        }.padding([.top],200)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(backgroundColor)
            if constant.axisMode == .bottom {
                ScrollView {
                    content
                        .padding()
                        .padding(.top, getTopPadding())
                        .padding(.bottom, getBottomPadding())
                }
            }else {
                ScrollView {
                    content
                        .padding()
                        .padding(.top, getTopPadding())
                        .padding(.bottom, getBottomPadding())
                }
            }
        }
        .tabItem(tag: tag, normal: {
            TabButton(constant: $constant, selection: $selection, tag: tag, isSelection: false, systemName: systemName)
        }, select: {
            TabButton(constant: $constant, selection: $selection, tag: tag, isSelection: true, systemName: systemName)
        })
    }
    
    private func getTopPadding() -> CGFloat {
        guard !constant.screen.activeSafeArea else { return 0 }
        return constant.axisMode == .top ? constant.tab.normalSize.height + safeArea.top : 0
    }
    
    private func getBottomPadding() -> CGFloat {
        guard !constant.screen.activeSafeArea else { return 0 }
        return constant.axisMode == .bottom ? constant.tab.normalSize.height + safeArea.bottom : 0
    }
}

fileprivate
struct TabButton: View {
    
    @Binding var constant: ATConstant
    @Binding var selection: Int
    
    let tag: Int
    let isSelection: Bool
    let systemName: String
    
    @State private var y: CGFloat = 0
    
    var content: some View {
        ZStack(alignment: .leading) {
          if isSelection {
               Image("Menu")
                  .resizable()
                  .scaledToFill()
                  .font(.system(size: 24))
           } else {
                Image(systemName: systemName)
                    .resizable()
                    .scaledToFit()
                    .font(.system(size: 24))
                    .padding([.top],18)
                    .padding(14)
           }
        }.frame(width: 70,height:70)
        .foregroundColor(isSelection ? Color.red : Color.white)
        .background(isSelection ? Color.red : Color.clear)
        .clipShape(Capsule())
        .offset(y: y)
        .onAppear {
            if isSelection {
                withAnimation(.easeInOut(duration: 0.26)) {
                    y = constant.axisMode == .top ? 22 : -22
                }
                withAnimation(.easeInOut(duration: 0.3).delay(0.25)) {
                    y = constant.axisMode == .top ? 17 : -17
                }
            }else {
                y = 0
            }
        }
    }
    var body: some View {
        if constant.axisMode == .top {
            content
        }else {
            content
        }
    }
 }


  struct CurveConcavePreview_Previews: PreviewProvider {
     static var previews: some View {
        CurveConcavePreview()
     }
  }
