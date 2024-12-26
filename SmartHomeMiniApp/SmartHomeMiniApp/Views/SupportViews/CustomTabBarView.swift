//
//  CustomTabBarView.swift
//  SmartHomeMiniApp
//
//  Created by Jamorn Suttipong on 11/9/2567 BE.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var currentTab: TabBarModel
    
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabBarModel.allCases, id: \.rawValue) {tab in
                Button {
                    currentTab = tab
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 50)
                            .foregroundStyle(currentTab == tab ? Color("PrimaryColor") : .white)
                        
                        if currentTab == tab {
                            Text(tab.title)
                                .font(.caption)
                                .foregroundStyle(currentTab == tab ? Color("PrimaryColor") : .white)
                        }
                    }
                    .padding(.vertical, 2)
                    .padding(.leading, 10)
                    .padding(.trailing, 15)
                    .background {
                        if currentTab == tab {
                            Capsule()
                                .fill(.white)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                }
            }
        }
        .frame(height: 64)
        .padding(.horizontal, 5)
        .background(Color("SecondaryColor"))
        .clipShape(Capsule())
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: currentTab)
    }
    
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .viewRoom:
            return 1
        case .setting:
            return 2
        case .profile:
            return 3
        }
    }
}

#Preview {
    CustomTabBarView(currentTab: .constant(.home))
}
