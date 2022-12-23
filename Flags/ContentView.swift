//
//  ContentView.swift
//  Flags
//
//  Created by macbook on 05.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Greece", "Brazil", "Bangladesh", "Sweden", "NewZeland", "Canada", "Germany", "Burundi", "Egypt", "Nigeria", "Vietnam", "Moldova", "Cuba", "NorthKorea", "Morocco", "Mozambique", "SriLanka", "Somali","Argentina", "Mongolia", "Croatia", "Uruguay", "Panama", "Montenegro", "Singapore", "Bulgaria", "Belarus", "Thailand", "China", "India", "Indonesia", "Pakistan", "Russia", "Japan", "Ethiopia", "Philippines", "Iran", "Turkey", "France", "Italy", "Myanmar", "England", "SouthAfrica", "Tanzania", "SouthKorea", "Spain", "Colombia", "Kenya", "Ukraine", "Algeria", "Poland", "Iraq", "Uganda", "Congo", "Sudan", "Malaysia", "Afganistan", "Venezuela", "Peru", "Uzbekistan", "Nepal", "SaudiArabia", "Angola", "Yemen", "Ghana", "Madagascar", "Cameroon", "Cote-d-Ivoire", "Taiwan", "Australia", "Romania", "BurkinaFaso", "Syria", "Niger", "Malawi", "Kazakhstan", "Mali", "Chile", "Netherlands", "Ecuador", "Cambodia", "Zambia", "Guatemala", "Senegal", "Zimbabwe", "SouthSudan", "Guinea", "Chad", "Rwanda", "Belgium", "Tunisia", "Bolivia", "Benin", "Portugal", "DominicanRepublic", "CzechRepublic", "Haiti", "Jordan", "Azerbaijan", "Hungary", "Israel", "Honduras", "Austria", "Tajikistan", "Switzerland", "Togo", "Laos", "Serbia", "PapuaNewGuinea", "Libya", "Lebanon", "ElSalvador", "SierraLeone", "UnitedArabEmirates", "Nicaragua", "Eritrea", "Kyrgyzstan", "CentralAfricanRepublic", "Denmark", "Finland", "Slovakia", "Turkmenistan", "Norway", "Scotland", "Ireland", "CostaRica", "Georgia", "Liberia", "Palestine", "Mauritania", "BosniaAndHerzegovina", "Oman", "Albania", "Armenia", "Jamaica", "Kuwait", "Lithuania", "Namibia", "Qatar", "Botswana", "NorthMacedonia", "Gambia", "Lesotho", "Slovenia", "Latvia", "NorthernIreland", "GuineaBissau", "Gabon", "Swaziland", "Mauritius", "EastTimor", "Estonia", "Cyprus", "Fiji", "TrinidadAndTobago", "Djibouti", "Comoros", "EquatorialGuinea", "Bhutan", "Guyana", "SolomonIslands","Luxembourg", "Suriname", "CapeVerde", "Brunei", "Malta", "Maldives", "Belize", "Iceland", "Bahamas", "Barbados", "Vanuatu", "NewCaledonia", "SaoTomeAndPrincipe", "Samoa", "SaintLucia", "Grenada", "Kiribati", "Tonga", "Micronesia", "SaintVincentAndTheGrenadines", "AntiguaAndBarbuda", "Seychelles", "Andorra", "MarshallIslands", "Dominica", "SaintKittsAndNevis", "FaroeIslands", "Liechtenstein", "SanMarino", "Monaco", "Palau", "Tuvalu", "Nauru", "Vatican", "Mexico", "Wales"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    
    @State private var mistakes = 0
    
    @State private var showingScore = false
    
    @State private var scoreTitle = ""
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Spacer()

                    Text("Choose the flag:")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        
                    
                } .padding(10)
                
                ForEach(0..<3) {number in
                    Button(action: {
                        self.flagTapped(number)
                        self.showingScore = true
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .frame(width: 240, height: 125)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 3)
                            
                    }
                }
                
                VStack {
                    
                    HStack {
                        Spacer()
                    Text("Score: \(score)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    Spacer()
                    
                    Text("Mistakes: \(mistakes)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    Spacer()
                        
                    }
                    
                    Text("\(countries.count) countries")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.black)
                }
                
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Total score: \n\(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
        
        func askQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct Answer!"
            score += 1
        } else {
            scoreTitle = "Wrong Answer! This is flag of \n\(countries[number])"
            mistakes += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
