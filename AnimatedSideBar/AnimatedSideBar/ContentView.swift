//
//  ContentView.swift
//  AnimatedSideBar
//
//  Created by vasantha_m on 06/06/26.
//

import SwiftUI

struct ContentView: View{
    @State private var isShowingMenu = false
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    menuButton
                    Spacer()
                }
                Spacer()
                subscribeSection
                Spacer()
            }
            .blur(radius: isShowingMenu ? 5 : 0)
            
            sideMenu
        }
    }
    private var menuButton: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)){
                isShowingMenu.toggle()
            }
        }){
            Image(systemName: "line.horizontal.3")
                .imageScale(.large)
                .foregroundColor(.primary)
                .rotationEffect(Angle(degrees: isShowingMenu ? 90 : 0))
                .padding(12)
                .background(
                    Circle()
                        .fill(Color.gray.opacity(0.1))
                        .shadow(color: .gray.opacity(0.2),radius: 5, x: 0, y: 2)
                )
        }
        .padding()
    }
    
    private var subscribeSection: some View {
        VStack(spacing: 20){
            Image(systemName: "hand.wave")
                .imageScale(.large)
                .foregroundColor(.blue)
                .font(.system(size: 40))
            
            Text("Hi This IOS Project")
                .font(.title2.bold())
                .foregroundColor(.primary)
            
            Text("The Animated side bar ")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .gray.opacity(0.2),radius: 10, x: 0, y: 5)
        )
        .padding()
    }
    
    private var sideMenu: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                MenuView()
                    .frame(width: min(geometry.size.width * 0.75, 300))
                    .frame(maxHeight: .infinity)
                    .background(
                        ZStack {
                            Color(.systemBackground)
                            
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [.blue.opacity(0.2),.purple.opacity(0.2)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 200, height: 200)
                                .blur(radius: 50)
                                .offset(x: -100, y: -50)
                            
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [.orange.opacity(0.2),.red.opacity(0.2)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 200, height: 200)
                                .blur(radius: 50)
                                .offset(x: 50, y: geometry.size.height - 100)
                        }
                    )
                    .clipShape(
                        RoundedCornerShape(radius: 30, corners: [.topRight, .bottomRight])
                    )
                    .shadow(color: .black, radius: 20, x: 5, y: 0)
                    .offset(x: isShowingMenu ? 0 : -geometry.size.width)
                
                Spacer()
            }
            .background(
                Color.black.opacity(isShowingMenu ? 0.3 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)){
                            isShowingMenu = false
                        }
                    }
            )
        }
        .ignoresSafeArea()
        .animation(.spring(response: 0.3,dampingFraction: 0.8), value: isShowingMenu)
    }
}
