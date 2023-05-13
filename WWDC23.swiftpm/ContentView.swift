import SwiftUI
import Foundation

struct ContentView : View {
    @State private var value : Double = 0.0
    @State private var capo:Bool = false
    @State private var selection: Int? = nil
    @State private var offset: CGFloat = 0
    @ObservedObject var harmonics = Harmonics()
    let achordButton = ["C","D","E","F","G","A","B"]
    @State var sound = ""
    @State private var selectedButton: Int = 0
    @State private var instruction = ["Here you can select the chord that you will play.","The square indicates the area that you will swipe to play.","This is the area tha you can slide the capo when you enable it by clicking on 'Add capo'"]
    @State var x = 0
    @State var y = 0.0001
    @State var noteIndex = 0
    @State var tutorial = SoundManager.shared.tutorial
    let columns = [GridItem(.fixed(150)),GridItem(.fixed(150))]
    
    var body: some View {
        
        NavigationView(){
            ZStack(){
                
                ZStack{
                    Image("background")
                        .resizable()
                    if(x<=2 && tutorial){
                        Image("personagem")
                            .scaleEffect(1.2)
                            .position(x:335,y:690)
                        
                        
                        ZStack{
                            
                            
                            Image("Balao")
                                .scaleEffect(1.2)
                            Text(instruction[x])
                                .fontWeight(.regular)
                                .font(.system(size: 30))
                                .multilineTextAlignment(.leading)
                                .frame(width: 300,height: 300)
                            
                            
                        }
                        .position(x:585,y: 330)
                    }
                    
                    
                }
                
                
                
                VStack{
                    
                    ZStack{
                        
                        Image("violao")
                            .frame(height: 573)
                            .padding(.bottom,105)
                        if(x == 2){
                            Path { path in
                                path.move(to: CGPoint(x: 680, y: 350))
                                path.addLine(to: CGPoint(x: 1140, y: 350))
                            }
                            .stroke(Color.white, lineWidth: 4)
                        }
                        
                        Rectangle()
                            .fill(Color.gray.opacity(y))
                            .frame(width: 230,height: 200)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        let y = gesture.translation.height
                                        
                                        if(y >= -213 && y <= 10){
                                            offset = gesture.translation.height
                                            
                                        }
                                    }
                                    .onEnded { _ in
                                        if offset >= 0 {
                                            SoundManager.shared.playSound(sound: sound, type: ".mp3")
                                            print("baixo")
                                            print(offset)
                                        } else {
                                            SoundManager.shared.playSound(sound: sound, type: ".mp3")
                                            print("cima")
                                            offset = 0
                                        }
                                    }
                            )
                            .position(x:370,y:300)
                        
                        if(capo){
                            
                            SliderView(value: $value, in: -12.0 ... -1)
                                .frame(width: 455,height: 400)
                                .padding(.leading,450)
                                .padding(.bottom,87)
                                .ignoresSafeArea()
                        }
                        
                    }
                    
                    
                }
                .padding(.top,700)
                
                ZStack{
                    if x == 0 && tutorial{
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 350, height: 450)
                            .border(.white, width: 5)
                            .position(x:680,y:635)
                    }
                    
                    LazyVGrid(columns: columns,spacing: 5){
                        
                        ForEach(0..<achordButton.count,id: \.self){ note in
                            
                            Button(action: {
                                
                                self.selectedButton = note
                                if(value == -12){
                                    sound = achordButton[note]
                                    noteIndex = note
                                    print(note)
                                }
                                
                                if(value <= -1 && value >= -11){
                                    sound = harmonics.chords[note][-Int(value)]
                                    noteIndex = note
                                    print(harmonics.chords[note][-Int(value)])
                                }
                                if(value == 0){
                                    noteIndex = note
                                    sound = harmonics.chords[note][0]
                                }
                                
                            }, label: {
                                ZStack{
                                    HStack{
                                        Text("\(achordButton[note])")
                                            .font(.largeTitle)
                                            .foregroundColor(.white)
                                            .bold()
                                            .frame(width: 130,height: 100)
                                        
                                    }
                                }
                            })
                            .buttonStyle(.automatic)
                            .background(selectedButton == note ? Color.red : Color("button"))
                            .cornerRadius(10)
                            
                        }
                        
                        Button(action: {
                            if(capo){
                                value = 0
                            }
                            else{
                                value = -1
                            }
                            capo.toggle()
                            
                        }, label: {
                            Text( capo ? "remove":"Add capo")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 130,height: 100)
                        })
                        .buttonStyle(.automatic)
                        .background(capo ? Color.red : Color("button"))
                        .cornerRadius(10)
                        
                        NavigationLink(destination: FinishView(),tag: 1, selection: $selection) {
                            Button(action: {
                                self.selection = 1
                            }, label: {
                                
                                Text("Finish")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 300,height: 100)
                                
                            })
                            .buttonStyle(.automatic)
                            .background(Color("button"))
                            .cornerRadius(10)
                            .position(x:155,y:80)
                            
                        }
                        .isDetailLink(false)
                    }
                    
                }.position(.init(x: 1150, y: 500))
            }
            
            .onTapGesture {
                
                if(x <= 3 && tutorial){
                    x += 1
                    if(x == 1){
                        y = 0.5
                    }
                    else{
                        y = 0.0001
                    }
                }
                
            }
            .onChange(of: value){newValue in
                
                sound = harmonics.chords[noteIndex][-Int(value)]
                
            }
            .onDisappear(){
                SoundManager.shared.tutorial = false
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
        
        
    }
}

struct preview: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
