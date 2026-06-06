//
//  ContentView.swift
//  AnimatedSideBar
//
//  Created by vasantha_m on 06/06/26.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 15) {
                Circle()
                    .fill(
                        LinearGradient(colors: [.black,.gray,.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 70)
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                        
                    )
                    .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
                VStack(alignment: .leading, spacing: 5) {
                    Text("User Name")
                        .font(.title2.bold())
                    Text("Premium Member")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 60)
            .padding(.horizontal)
            
            Rectangle()
                .fill(
                    LinearGradient(colors: [.clear,.gray.opacity(0.2),.clear], startPoint: .leading, endPoint: .trailing)
                )
                .frame(height: 1)
                .padding(.vertical, 30)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 5){
                    ForEach(menuItems) { item in
                        MenuItemView(menuItem: item)
                    }
                }
            }
            VStack(spacing: 20) {
                Button(action: {}){
                    HStack {
                        Image(systemName: "arrow.right.square.fill")
                        Text("Logout")
                    }
                    .foregroundColor(.red)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.red.opacity(0.5), lineWidth: 1)
                    )
                }
                Text("App Version 1.0")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            .padding()
            .padding(.bottom,30)
        }
    }
}
