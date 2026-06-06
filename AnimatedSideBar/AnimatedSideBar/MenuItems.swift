//
//  MenuItems.swift
//  AnimatedSideBar
//
//  Created by vasantha_m on 06/06/26.
//

import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let color: Color
}

let menuItems = [
    MenuItem(icon: "house.fill",title: "Home",color: .blue),
    MenuItem(icon: "person.fill", title: "Profile",color: .purple),
    MenuItem(icon: "bell.fill",title: "Notifications",color: .red),
    MenuItem(icon: "gear",title: "Settings",color: .orange),
    MenuItem(icon: "star.fill",title: "Favorites",color: .yellow),
    MenuItem(icon: "envelope.fill",title: "Messages",color: .green)
]

struct RoundedCornerShape: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius
            )
        )

        return Path(path.cgPath)
    }
}
