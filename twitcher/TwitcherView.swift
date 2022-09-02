//
//  ContentView.swift
//  twitcher
//
//  Created by John Pill on 02/09/2022.
//

import SwiftUI

struct Bird {
    var id: Int
    let title: String
    let imageUrl: String
    var score: Int
}


class BirdsViewModel:ObservableObject {
    
    @Published var totalScore = 0
    
    @Published var birds:[Bird] = [
        Bird(id: 0, title: "Robin", imageUrl: "bird1", score: 0),
        Bird(id: 1, title: "Wings", imageUrl: "bird2", score: 0),
        Bird(id: 2, title: "Eagle", imageUrl: "bird3", score: 0),
        Bird(id: 3, title: "Robin", imageUrl: "bird1", score: 0),
        Bird(id: 4, title: "Wings", imageUrl: "bird2", score: 0),
        Bird(id: 5, title: "Eagle", imageUrl: "bird3", score: 0),
        Bird(id: 6, title: "Eagle", imageUrl: "bird3", score: 0),
        Bird(id: 7, title: "Robin", imageUrl: "bird1", score: 0),
        Bird(id: 8, title: "Wings", imageUrl: "bird2", score: 0),
        Bird(id: 9, title: "Eagle", imageUrl: "bird3", score: 0),
    ]
    
    
    func increaseScore(id: Int) {
        birds[id].score += 1
        totalScore += 1
    }
    
    func decreaseScore(id: Int) {
        
        if birds[id].score != 0 {
            birds[id].score -= 1
            totalScore -= 1
        }
    }
}




struct TwitcherView: View {
    
    @ObservedObject var viewModel: BirdsViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
                        ForEach(viewModel.birds, id: \.id) { bird in
                            VStack {
                                Text(bird.title)
                                    .font(.system(size: 24, weight: .bold))
                                
                                Image(bird.imageUrl)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(12)
                                    .shadow(radius: 5)
                                
                                HStack {
                                    Spacer()
                                    
                                    
                                    Button {
                                        viewModel.increaseScore(id: bird.id)
                                        print("\(bird.title) is \(bird.score)")
                                        
                                    } label: {
                                        Image(systemName: "plus.circle")
                                            .font(.system(size: 28))
                                    }
                                    
                                    Text("\(bird.score)")
                                        .font(.system(size: 24))
                                    
                                    Button {
                                        viewModel.decreaseScore(id: bird.id)
                                        print("\(bird.title) is \(bird.score)")
                                        
                                    } label: {
                                        Image(systemName: "minus.circle")
                                            .font(.system(size: 28))
                                    }
                                    
                                    Spacer()
                                }
                            }.foregroundColor(.indigo)
                        }.padding(.bottom)
                        
                    }
                }
                .padding()
                
                
                Spacer()
                
                HStack {
                    Text("TOTAL POINTS: ")
                        .font(.system(size: 24, weight: .heavy))
                    Text("\(viewModel.totalScore) Points")
                        .font(.system(size: 24, weight: .medium))
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 75)
                .background(Gradient(colors: [.indigo, .purple]))
                .cornerRadius(20)
                .foregroundColor(.white)
                
            } .navigationTitle("Twitcher 🦜")
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .padding()
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TwitcherView(viewModel: BirdsViewModel())
    }
}
