import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct CareerAssistantView: View {
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Hi 👋 I’m the A2Z Career Assistant. Let's start with your name!", isUser: false)
    ]
    @State private var inputText: String = ""
    @State private var currentStep: Int = 0
    @State private var userData: [String: String] = [:]

    let steps = ["Name", "Country", "Language", "Job", "Experience"]

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(messages) { msg in
                        HStack {
                            if msg.isUser { Spacer() }
                            Text(msg.text)
                                .padding(12)
                                .background(msg.isUser ? Color.a2zDarkBlue : Color.a2zSoftGray)
                                .foregroundColor(msg.isUser ? .white : .primary)
                                .cornerRadius(16)
                                .frame(maxWidth: 280, alignment: msg.isUser ? .trailing : .leading)
                            if !msg.isUser { Spacer() }
                        }
                    }
                }
                .padding()
            }

            if currentStep < steps.count {
                HStack {
                    TextField("Type here...", text: $inputText)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 1)

                    Button(action: sendMessage) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.a2zDarkBlue)
                            .padding()
                    }
                }
                .padding()
            } else {
                Button(action: openWhatsApp) {
                    Text("Connect on WhatsApp")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.a2zGold)
                        .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("Career Assistant")
    }

    func sendMessage() {
        guard !inputText.isEmpty else { return }

        let userMsg = inputText
        messages.append(ChatMessage(text: userMsg, isUser: true))

        let step = steps[currentStep]
        userData[step] = userMsg

        inputText = ""
        currentStep += 1

        if currentStep < steps.count {
            let nextStep = steps[currentStep]
            messages.append(ChatMessage(text: "Great! Now, please tell me your \(nextStep):", isUser: false))
        } else {
            messages.append(ChatMessage(text: "Thank you! I have collected your details. Click below to connect with our team on WhatsApp.", isUser: false))
        }
    }

    func openWhatsApp() {
        let text = "I would like to enquire about employment opportunities.\\n\\n" +
                  "Name: \(userData["Name"] ?? "")\\n" +
                  "Country: \(userData["Country"] ?? "")\\n" +
                  "Language: \(userData["Language"] ?? "")\\n" +
                  "Job: \(userData["Job"] ?? "")\\n" +
                  "Experience: \(userData["Experience"] ?? "")\\n\\n" +
                  "Source: A2Z iOS App Assistant"

        let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: "https://wa.me/447426410645?text=\(encodedText)")!
        UIApplication.shared.open(url)
    }
}
