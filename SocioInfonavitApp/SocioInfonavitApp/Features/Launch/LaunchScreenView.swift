//
//  LaunchScreenView.swift
//  SocioInfonavitApp
//
//  Created by Jesus Perez on 01/10/25.
//

import SwiftUI

struct LaunchScreenView: View {
  @State private var showLogin = false

  var body: some View {
    GeometryReader { geo in
      ZStack {
        Color.app(.redPrimary).ignoresSafeArea()

        Image.app(.socioInfonavit)
          .resizable()
          .scaledToFit()
          .padding(.horizontal, 32)
          .position(x: geo.size.width / 2, y: geo.size.height / 2)

        LoadingInfonavitView()
          .frame(width: 80, height: 80)
          .position(
            x: geo.size.width / 2,
            y: geo.size.height - (geo.size.height / 3)
          )
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
        showLogin = true
      }
    }
    .fullScreenCover(isPresented: $showLogin) {
      LoginView()
    }
  }
}
