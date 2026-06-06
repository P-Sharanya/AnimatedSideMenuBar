//
//  MenuItemVIew.swift
//  AnimatedSideBar
//
//  Created by vasantha_m on 06/06/26.
//

import SwiftUI

struct MenuItemView: View {
    let menuItem: MenuItem

    @State private var isHovered = false

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: menuItem.icon)
                .foregroundColor(menuItem.color)
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .background(
                    Circle()
                        .fill(menuItem.color.opacity(0.1))
                )

            Text(menuItem.title)
                .foregroundColor(.primary)
                .font(.headline)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.gray.opacity(0.5))
                .opacity(isHovered ? 1 : 0)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    isHovered
                        ? menuItem.color.opacity(0.1)
                        : Color.clear
                )
        )
        .contentShape(Rectangle())
        .onHover { hovering in
            withAnimation(.easeInOut(duration: 0.2)) {
                isHovered = hovering
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.3,dampingFraction: 0.8 )) {
                //handle the menu item tap
            }
        }
    }
}
