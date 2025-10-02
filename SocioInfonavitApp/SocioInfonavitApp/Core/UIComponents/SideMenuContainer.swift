import SwiftUI

// MARK: - SideMenuContainer

struct SideMenuContainer<Content: View, Menu: View>: View {
  // MARK: - Properties

  @Binding var isOpen: Bool
  let menuWidth: CGFloat
  let content: () -> Content
  let menu: () -> Menu

  // MARK: - Body

  var body: some View {
    ZStack(alignment: .leading) {
      content()
        .disabled(isOpen)
        .overlay(

          Color.black.opacity(isOpen ? 0.4 : 0)
            .ignoresSafeArea()
            .onTapGesture {
              withAnimation(.easeInOut) {
                isOpen = false
              }
            }
        )

      HStack {
        menu()
          .frame(width: menuWidth)
          .background(Color.app(.backgroundPrimary))
          .offset(x: isOpen ? 0 : -menuWidth)
          .animation(.easeInOut(duration: 0.3), value: isOpen)

        Spacer()
      }
    }
  }
}
