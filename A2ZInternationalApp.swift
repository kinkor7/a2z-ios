import SwiftUI

@main
struct A2ZInternationalApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                DashboardView()
            }
            .accentColor(.a2zDarkBlue)
        }
    }
}
