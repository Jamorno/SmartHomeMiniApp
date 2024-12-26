//
//  ViewRoom.swift
//  SmartHomeMiniApp
//
//  Created by Jamorn Suttipong on 13/9/2567 BE.
//

import SwiftUI

struct ViewRoom: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("BackgroundPhoto")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .trailing) {
                HStack(alignment: .top) {
                    ExtractedView(imageName: "chevron.backward.circle.fill")
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 20) {
                        ExtractedView(imageName: "bell.circle")
                        ExtractedView(imageName: "qrcode.viewfinder")
                        ExtractedView(imageName: "slider.vertical.3")
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Living Room")
                        .font(.system(size: 46))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(.white)
                                .frame(width: 130, height: 250)
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.white)
                        }
                        
                        ToggleView(toggleModel: .tv)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ViewRoom()
}

struct ExtractedView: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 54, height: 54)
            .foregroundStyle(.white)
    }
}
