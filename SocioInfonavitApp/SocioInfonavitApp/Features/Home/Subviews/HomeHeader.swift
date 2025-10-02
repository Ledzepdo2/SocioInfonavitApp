import SwiftUI

// MARK: - HomeHeader

struct HomeHeader: View {
  // MARK: - Properties

  @Binding var isMenuOpen: Bool

  // MARK: - Body

  var body: some View {
    HStack {
      Button(action: {
        withAnimation { isMenuOpen.toggle() }
      }) {
        Image(systemName: "line.horizontal.3")
          .font(.title2)
          .foregroundColor(.app(.redPrimary))
      }
      Spacer()
      Image.app(.socioInfonavit)
        .resizable()
        .scaledToFit()
        .frame(height: 24)
      Spacer()
    }
    .padding(.horizontal)
    .padding(.top, 16)
  }
}
