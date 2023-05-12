//
//  FinishView.swift
//  SomeTune
//
//  Created by Ruan Eleutério  on 19/04/23.
//

import SwiftUI
import Foundation

struct FinishView: View {
    @State private var selection: Int? = nil
    @State private var index = 0
    @State private var dialogo = ["I hope you had fun and learned about how important the capo is.","Now you can choose back to the start and go through the tutorial again or continue playing guitar as you like"]
    
    var body: some View {
        NavigationView(){
            ZStack{
                Color.black.ignoresSafeArea()
                Image("personagem")
                    .position(x:300,y:600)
                
                
                VStack{
                    ZStack{
                        Image("Balao")
                            .scaleEffect(1.2)
                        Text(dialogo[index])
                            .fontWeight(.regular)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.leading)
                            .frame(width: 200,height: 300)
                        
                        
                    }
                    .position(x:530,y:200)
                    
                    HStack{
                        NavigationLink(destination: HistoryView(),tag: 1, selection: $selection) {
                            Button(action: {
                                self.selection = 1
                            }, label: {
                                
                                Text("Restart")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 200,height: 100)
                                
                            })
                            .buttonStyle(.automatic)
                            .background(Color("button"))
                            .cornerRadius(10)
                            .padding(40)
                            
                            
                            
                        }
                        
                        NavigationLink(destination: ContentView(),tag: 2, selection: $selection) {
                            Button(action: {
                                self.selection = 2
                            }, label: {
                                
                                Text("Back to the Guitar")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 200,height: 100)
                                
                            })
                            .buttonStyle(.automatic)
                            .background(Color("button"))
                            .cornerRadius(10)
                            .padding(40)
                        }
                    }
                   
                    
                }
                .foregroundColor(.black)
                .padding()

            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
        .onTapGesture {
            if(index < 1){
                index += 1
                
            }
        }
    }
    
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
