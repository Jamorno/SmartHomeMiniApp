//
//  TabBarView.swift
//  SmartHomeMiniApp
//
//  Created by Jamorn Suttipong on 14/9/2567 BE.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var currentTab: TabBarModel = .home
    
    @State private var isTabBarHidden = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                TabView(selection: $currentTab) {
                    HomeView()
                        .tag(TabBarModel.home)
//                        .background {
//                            if !isTabBarHidden {
//                                HideTabBar {
//                                    isTabBarHidden = true
//                                }
//                            }
//                        }
                    ViewRoom()
                        .tag(TabBarModel.viewRoom)
                    HomeView()
                        .tag(TabBarModel.setting)
                    HomeView()
                        .tag(TabBarModel.profile)
                }
                
                CustomTabBarView(currentTab: $currentTab)
            }
        }
    }
}

//struct HideTabBar: UIViewRepresentable {
//    var result:() -> ()
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView(frame: .zero)
//        view.backgroundColor = .clear
//        
//        DispatchQueue.main.async {
//            if let tabController = view.tabController {
//                UITabBar.appearance().isHidden = false
//                tabController.tabBar.isHidden = true
//                result()
//            }
//        }
//        
//        return view
//    }
//    
//    func updateUIView(_ uiView: UIView, context: Context) {
//        
//    }
//}
//
//extension UIView {
//    var tabController: UITabBarController? {
//        if let controller = sequence(first: self, next: {
//            $0.next
//        }).first(where: {$0 is UITabBarController}) as? UITabBarController {
//            return controller
//        }
//        
//        return nil
//    }
//}

#Preview {
    TabBarView()
}
