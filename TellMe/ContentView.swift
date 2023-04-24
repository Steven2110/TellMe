//
//  ContentView.swift
//  TellMe
//
//  Created by Steven Wijaya on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var question: String = ""
    @State private var answer: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    TextField("Enter a yes/no question", text: $question)
                    HStack {
                        Spacer()
                        Button {
                            question = ""
                            answer = ""
                        } label: {
                            Image(systemName: "x.circle")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 4)
                }
                .padding(.bottom)
                HStack {
                    Spacer()
                    Button {
                        if question != "" {
                            answer = generateResult()
                        } else {
                            showAlert = true
                        }
                    } label: {
                        Text("Generate answer")
                            .foregroundColor(.primary)
                            .colorInvert()
                            .frame(width: 175, height: 45)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                HStack {
                    Text("Answer: ")
                    Spacer()
                    Text(answer)
                        .bold()
                    
                }
            }
            .padding()
            .navigationTitle("Tell Me Yes or No")
            .alert("Empty Question", isPresented: $showAlert) {
                Button(role: .cancel) {
                    //
                } label: {
                    Text("Ok")
                }

            } message: {
                Text("Please enter a valid yes/no question.")
            }
        }
    }
    
    func generateResult() -> String {
        if(Double.random(in: 0.0...1.0) > p) {
            return "Yes"
        } else {
            return "No"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
