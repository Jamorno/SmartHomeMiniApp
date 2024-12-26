//
//  ToggleView.swift
//  SmartHomeMiniApp
//
//  Created by Jamorn Suttipong on 10/9/2567 BE.
//

import SwiftUI

struct ToggleView: View {
    
    @State var isOn = false
    
    var toggleModel: ToggleModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: toggleModel.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.white)
                
                Spacer()
                
                //toggle
                Toggle("", isOn: $isOn)
                    .toggleStyle(customToggleView())
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(toggleModel.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(toggleModel.description)
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.6))
            }
        }
        .padding()
        .frame(width: 190, height: 250)
        .background(isOn ? Color("PurpleColor") : Color("PrimaryColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct customToggleView: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        let isOn = configuration.isOn
        
        return ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: 60, height: 100)
                .foregroundStyle(isOn ? Color("DarkPurple") : Color("BackgroundColor"))
            
                //button
                .overlay(alignment: .leading) {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(isOn ? Color("BackgroundColor") : Color("SecondaryColor"))
                        .offset(x: 5 , y: isOn ? -20 : 20)
                    Image(systemName: isOn ? "lightbulb.max.fill" : "lightbulb")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(isOn ? .white : Color("BackgroundColor"))
                        .offset(x: 5, y: isOn ? -20 : 20)
                }
        }
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}

#Preview {
    ToggleView(toggleModel: .vacuum)
}
