//
//  SwiftUIView.swift
//  WWDC23
//
//  Created by Ruan Eleutério  on 18/04/23.
//

import SwiftUI
import Foundation

struct HistoryView: View {
    @State private var index = 0
    @State private var dialogo = ["Hi my name is Ruan and i'll talk about how the capo influence in acoustic guitar sounds and how it makes it!","Capo is a tool that give the option of change the acoustic guitar tune by putting it in diferent points on guitar necks.","It's very usefull for who plays because with it, the person can change the music tone for a better tone for his voice.","Now we are going to see this in practice! "]
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            if(index == 4){
                ContentView()
            }
            else{
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
                    
                    Text("Tap on the screen to continue")
                        .fontWeight(.regular)
                        .font(.system(size: 40))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .position(x:700,y:400)
                    
                    
                }
                .foregroundColor(.black)
                .padding()
            }
           
        }
        .navigationBarBackButtonHidden()
        .onTapGesture {
            if(index <= 3){
                index += 1
                
            }
        }
        .onAppear(){
            SoundManager.shared.tutorial = true

        }

    }
        
        
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
