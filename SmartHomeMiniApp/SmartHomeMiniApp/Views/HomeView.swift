//
//  HomeView.swift
//  SmartHomeMiniApp
//
//  Created by Jamorn Suttipong on 9/9/2567 BE.
//

import SwiftUI

struct HomeView: View {
    
    @State private var categories: Categories = .bedroom
    
    @State private var sliderVaule: Double = 50
    @State private var isSwitchOn = true
    
    @State private var toggleModel: ToggleModel = .tv
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    
                    //heading
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Welcome home")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("SecondaryColor"))
                            Text("Jamorn!")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 10) {
                            Image(systemName: "bell.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(Color("SecondaryColor"))
                                .frame(width: 58, height: 58)
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 58, height: 58)
                        }
                    }
                    .padding(.bottom, 10)
                    
                    //categories room
                    VStack(alignment: .leading) {
                        Text("Scenes")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 5) {
                                ForEach(Categories.allCases) {room in
                                    Text(room.rawValue)
                                        .font(.headline)
                                        .padding()
                                        .frame(height: 44)
                                        .foregroundStyle(categories == room ? .white : .black)
                                        .background(categories == room ? Color("PurpleColor") : .white)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .onTapGesture {
                                            withAnimation(.snappy) {
                                                categories = room
                                            }
                                        }
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    //current devices
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Smart lamp")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Bedroom")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("SecondaryColor"))
                            
                            Spacer()
                            
                            Image(systemName: sliderVaule == 0 ? "lightswitch.off" : "lightswitch.on")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(sliderVaule == 0 ? Color("SecondaryColor") : .white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        if isSwitchOn {
                                            isSwitchOn.toggle()
                                            sliderVaule = 50
                                        } else {
                                            isSwitchOn.toggle()
                                            sliderVaule = 0
                                        }
                                    }
                                }
                        }
                        //slider bar
                        HStack {
                            Image(systemName: sliderVaule == 0 ? "lightbulb": "lightbulb.max.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                            Slider(value: $sliderVaule, in: 0...100)
                                .accentColor(Color("PurpleColor"))
                                
                            Text("\(Int(sliderVaule))%")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: .infinity)
                    .background(Color("PrimaryColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    
                    .padding(.bottom, 15)
                    
                    //recent used devide
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Recent used devide")
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text("All")
                                .foregroundStyle(Color("PurpleColor"))
                        }
                        .font(.title2)
                        .fontWeight(.semibold)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(ToggleModel.allCases, id: \.self) {i in
                                    ToggleView(toggleModel: i)
                                }
                            }
                            
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
