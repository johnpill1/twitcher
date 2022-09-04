//
//  AchievementsView.swift
//  twitcher
//
//  Created by John Pill on 04/09/2022.
//

import SwiftUI

struct AchievementsView: View {
    
    @ObservedObject var viewModel: BirdsViewModel
    
    var body: some View {
        
       
            switch viewModel.totalScore {
                
            case 100...199:
                
                HStack {
                    Image(systemName: "star.fill")
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("100 Points")
                        .font(.system(size: 30, weight: .bold))
                }.foregroundColor(.green)
                
            case 200...299:
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("100 Points")
                            .font(.system(size: 30, weight: .bold))
                    } .padding()
                    
                    
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("200 Points")
                            .font(.system(size: 30, weight: .bold))
                    }.padding()
                    
                }.foregroundColor(.green)
            case 300...10000:
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("100 Points")
                            .font(.system(size: 30, weight: .bold))
                    }.padding()
             
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("200 Points")
                            .font(.system(size: 30, weight: .bold))
                    }.padding()
                
                
                
                    HStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("300 Points")
                            .font(.system(size: 30, weight: .bold))
                        
                    }.padding()
                
                
                }.foregroundColor(.green)
            default:
               Text("")
            
        }
        
        
    }
}

struct AchievementsView_Previews: PreviewProvider {
    
    static var previews: some View {
        AchievementsView(viewModel: BirdsViewModel())
    }
}
