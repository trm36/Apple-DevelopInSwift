//
//  ContentView.swift
//  PickAPal
//
//  Created by Taylor on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    @State private var savedNames: [String] = []
    
    var body: some View {
        VStack(spacing: 16.0) {
            VStack(spacing: 8.0) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    var nameEntered = nameToAdd
                    guard !nameEntered.isEmpty && !names.contains(nameEntered) else { return }
                    let trimmedNameEntered = nameEntered.trimmingCharacters(in: .whitespacesAndNewlines)
                    names.append(trimmedNameEntered)
                    nameToAdd = ""
                }
            
            HStack {
                Spacer()
                
                Button {
                    savedNames = names
                } label: {
                    Text("Save List")
                }
                .disabled(names.isEmpty)

                Spacer()
                
                Button {
                    names = savedNames
                    pickedName = ""
                } label: {
                    Text("Load List")
                }
                .disabled(savedNames.isEmpty)
                
                Spacer()
            }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            Button {
                guard let name = names.randomElement() else {
                    pickedName = ""
                    return
                }
                
                pickedName = name
                
                if shouldRemovePickedName {
                    names.removeAll { $0 == name }
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8.0)
                    .padding(.horizontal, 16.0)
                    
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
