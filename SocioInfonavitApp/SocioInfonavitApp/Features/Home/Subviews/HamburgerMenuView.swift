//
//  HamburgerMenuView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct HamburgerMenuView: View {
    @Binding var query: String
    let onLogout: () -> Void
    let onMyBenevits: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 12) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 52, height: 52)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Socio Infonavit")
                        .font(.app(.montserratSemiBold, size: 16))
                        .foregroundColor(.white)
                    
                    Text("Bienvenido")
                        .font(.app(.montserratRegular, size: 14))
                        .foregroundColor(.white)
                }
            }
            
            Divider()
            
            SearchBarView(query: $query)
            
            Divider()
            Button(action: onMyBenevits) {
                Label("Mis Benevits", systemImage: "gift.fill")
                    .font(.app(.montserratSemiBold, size: 16))
                    .foregroundColor(.white)
            }
            Spacer()
            Button(action: onLogout) {
                Label("Cerrar sesión", systemImage: "rectangle.portrait.and.arrow.right")
                    .font(.app(.montserratSemiBold, size: 16))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.app(.redPrimary))
    }
}
