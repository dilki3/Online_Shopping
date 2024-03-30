//
//  HelpView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-29.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Added to make background white
            
            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                    
                    Text("Help ?")
                        .font(.title2)
                        .frame(height: 46)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Welcome to the Shopix Help Center!")
                            .font(.title)
                            .foregroundColor(Color(hex: "#8349D0"))
                        
                        
                        Text("Here are some common questions and answers to help you get the most out of our app:").font(.body)
                        
                        // Example help text
                        HelpItem(question: "How do I place an order?", answer: "To place an order, follow these simple steps")
                        HelpItem(question: "What payment methods do you accept?", answer: "We accept various payment methods, including credit/debit cards, PayPal, and Apple Pay.")
                        HelpItem(question: "How can I track my order?", answer: "Once your order has been shipped, you will receive a tracking number via email...")
                        HelpItem(question: "What is your return policy?", answer: "We offer a hassle-free return policy within 30 days of your purchase...")
               
                    }
                    .padding(25)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct HelpItem: View {
    let question: String
    let answer: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(question).font(.title2).fontWeight(.medium)
            Text(answer).font(.body).foregroundColor(.secondary)
        }
    }
}
#Preview {
    HelpView()
}
