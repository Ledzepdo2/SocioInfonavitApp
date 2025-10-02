import SwiftUI

// MARK: - HamburgerMenuView

struct HamburgerMenuView: View {
  // MARK: - Properties

  @Binding var query: String
  let onLogout: () -> Void
  let onMyBenevits: () -> Void

  // MARK: - Body

  var body: some View {
    VStack(alignment: .leading, spacing: 24) {
      HStack(spacing: 12) {
        Image(systemName: "person.circle.fill")
          .resizable()
          .frame(width: 52, height: 52)
          .foregroundColor(.white)

        VStack(alignment: .leading, spacing: 4) {
          Text("home.menu.userTitle")
            .font(.app(.montserratSemiBold, size: 16))
            .foregroundColor(.white)

          Text("home.menu.greeting")
            .font(.app(.montserratRegular, size: 14))
            .foregroundColor(.white)
        }
      }

      Divider()

      SearchBarView(query: $query)

      Divider()
      Button(action: onMyBenevits) {
        Label(String(localized: "home.menu.myBenevits"), systemImage: "gift.fill")
          .font(.app(.montserratSemiBold, size: 16))
          .foregroundColor(.white)
      }
      Spacer()
      Button(action: onLogout) {
        Label(
          String(localized: "home.menu.logout"),
          systemImage: "rectangle.portrait.and.arrow.right"
        )
        .font(.app(.montserratSemiBold, size: 16))
        .foregroundColor(.white)
      }
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.app(.redPrimary))
  }
}
