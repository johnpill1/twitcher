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
    var found: Bool
}


class BirdsViewModel:ObservableObject {
    
    @Published var totalScore = 0
    
    @Published var birds:[Bird] = [
        Bird(id: 0, title: "Robin", imageUrl: "bird1", score: 0, found: false),
        Bird(id: 1, title: "Wings", imageUrl: "bird2", score: 0, found: false),
        Bird(id: 2, title: "Eagle", imageUrl: "bird3", score: 0, found: false),
        Bird(id: 3, title: "Black", imageUrl: "bird4", score: 0, found: false),
        Bird(id: 4, title: "Pigeon", imageUrl: "bird5", score: 0, found: false),
        Bird(id: 5, title: "Blue winged", imageUrl: "bird6", score: 0, found: false),
        Bird(id: 6, title: "Colorful", imageUrl: "bird7", score: 0, found: false),
        Bird(id: 7, title: "White", imageUrl: "bird8", score: 0, found: false),
        Bird(id: 8, title: "Longer bird name", imageUrl: "bird1", score: 0, found: false),
        
    ]
    
    
    func increaseScore(id: Int) {
        birds[id].score += 1
        totalScore += 10
    }
    
    func decreaseScore(id: Int) {
        
        if birds[id].score != 0 {
            birds[id].score -= 1
            totalScore -= 10
        }
    }
    
    func toggleFound(id: Int) {
        
        if birds[id].score > 0 {
            birds[id].found = true
        } else {
            birds[id].found = false
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
                                HStack {
                                    
                                    if bird.score > 9 {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                            .font(.system(size: 20))
                                        
                                    }
                                    else if  bird.found == true {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.green)
                                            .font(.system(size: 20))
                                    }
                                    
                                    Text(bird.title)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                    
                                } .padding(.horizontal, 25)
                                
                                Image(bird.imageUrl)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(20)
                                    .shadow(radius: 5)
                                
                                
                                HStack {
                                    Spacer()
                                    
                                    
                                    Button {
                                        viewModel.increaseScore(id: bird.id)
                                        viewModel.toggleFound(id: bird.id)
                                        print("\(bird.title) is \(bird.score)")
                                        
                                    } label: {
                                        Image(systemName: "plus.circle")
                                            .font(.system(size: 28))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Text("  \(bird.score)  ")
                                        .font(.system(size: 24, weight: .medium))
                                        .foregroundColor(.gray)
                                    
                                    Button {
                                        viewModel.decreaseScore(id: bird.id)
                                        viewModel.toggleFound(id: bird.id)
                                        
                                        print("\(bird.title) is \(bird.score)")
                                        
                                    } label: {
                                        Image(systemName: "minus.circle")
                                            .font(.system(size: 28))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                }

                            } .padding(.vertical) // End of bird unit
                        }
                    }
                } // end of scroll view
                
                // Spacer()
                
                HStack {
                    Text("Total Points: ")
                        .font(.system(size: 24, weight: .heavy).italic())
                    Text("\(viewModel.totalScore) Points")
                        .font(.system(size: 24, weight: .medium).italic())
                }
                .edgesIgnoringSafeArea(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: 45)
                //  .background(Gradient(colors: [.indigo, .purple]))
                .background(.green)
                .opacity(0.95)
              //  .cornerRadius(10)
                .foregroundColor(.white)
                
                Divider()
                
            } .navigationTitle("Twitcher 🦜")
        }

        .navigationViewStyle(StackNavigationViewStyle())
       // .padding()
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TwitcherView(viewModel: BirdsViewModel())
    }
}
