//
//  ContentView.swift
//  Birthdays
//
//  Created by Taylor on 6/22/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName: String = ""
    @State private var newDate: Date = .now
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20.0) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                    }

                    Button {
                        guard !newName.isEmpty else { return }
                        let trimmedNewName = newName.trimmingCharacters(in: .whitespacesAndNewlines)
                        let newFriend = Friend(name: trimmedNewName, birthday: newDate)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = .now
                    } label: {
                        Text("Save New Friend")
                    }
                }
                .padding()
                .background(.bar)
            }
//            .task {
//                context.insert(Friend(name: "Dewey Smith", birthday: .now))
//                context.insert(Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0)))
//            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
