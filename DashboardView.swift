import SwiftUI

struct DashboardItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let route: String
}

struct DashboardView: View {
    let items = [
        DashboardItem(title: "Find Jobs", subtitle: "Explore latest international vacancies", icon: "magnifyingglass", route: "jobs"),
        DashboardItem(title: "D Visa Assistant", subtitle: "Guidance on long-stay visas", icon: "info.circle", route: "visa"),
        DashboardItem(title: "Career Assistant", subtitle: "Fast-track your application", icon: "message", route: "assistant"),
        DashboardItem(title: "About A2Z", subtitle: "Our mission and transparency", icon: "building.columns", route: "about"),
        DashboardItem(title: "Contact Us", subtitle: "Connect with our experts", icon: "envelope", route: "contact")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Welcome to Global Opportunity")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.a2zDarkBlue)
                        .padding(.bottom, 20)

                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            HStack(spacing: 16) {
                                Image(systemName: item.icon)
                                    .foregroundColor(.a2zDarkBlue)
                                    .font(.title2)
                                    .frame(width: 40)

                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text(item.subtitle)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        }
                    }
                }
                .padding()
            }
            .background(Color.a2zSoftGray)
            .navigationTitle("A2Z International")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailView: View {
    let item: DashboardItem

    var body: some View {
        VStack {
            Text("\(item.title) is coming soon...")
                .font(.title)
                .foregroundColor(.gray)
        }
        .navigationTitle(item.title)
    }
}
