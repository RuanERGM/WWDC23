//
//  SliderView.swift
//  WWDC23
//
//  Created by Ruan Eleutério  on 03/04/23.
//

import SwiftUI
import Foundation


struct SliderView: View {
    @Binding var value: Double
    var bounds: ClosedRange<Double>
    
    init(value: Binding<Double>, in bounds: ClosedRange<Double>) {
        self.bounds = bounds
        self._value = value
    }
    
    var body: some View {
        
        Slider(value: $value, in: bounds,step: 1.0)
            .accentColor(Color(red: 0, green: 0, blue: 0,opacity: 0))
            
            
            .onAppear{
                if #available(iOS 16.0, *) {
                    let thumbImage = UIImage(named: "capo")
                    UISlider.appearance().setThumbImage(thumbImage, for: .normal)
                    
                    UISlider.appearance().maximumTrackTintColor = .clear
                    UISlider.appearance().minimumTrackTintColor = .clear


                } else {
                    let thumbImage = UIImage(named: "capo")
                    UISlider.appearance().setThumbImage(thumbImage, for: .normal)
                    UISlider.appearance().maximumTrackTintColor = .clear
                    UISlider.appearance().minimumTrackTintColor = .clear
                }

              
            }
    }
    
}
