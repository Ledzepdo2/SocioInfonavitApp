import SwiftUI

// MARK: - SearchBarView

struct SearchBarView: View {
  // MARK: - Properties

  @Binding var query: String

  // MARK: - Body

  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
        .foregroundColor(.app(.graySecondary))

      TextField(String(localized: "home.search.placeholder"), text: $query)
        .textInputAutocapitalization(.none)
        .disableAutocorrection(true)
        .foregroundColor(.primary)

      if !query.isEmpty {
        Button(action: {
          query = ""
        }) {
          Image(systemName: "xmark.circle.fill")
            .foregroundColor(.app(.graySecondary))
        }
      }
    }
    .padding(.horizontal, 12)
    .padding(.vertical, 10)
    .background(Color.app(.backgroundSecondary))
    .cornerRadius(12)
  }
}
