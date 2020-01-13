//
//  SecondView.swift
//  hw3_32
//
//  Created by User03 on 2020/1/13.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    var poli:Poli
    @State private var mindTime = Date()
    @State private var num: CGFloat = 50
    @State private var name = ""
    @State private var showAlert = false
    @State private var brightnessAmount:Double=0
    let color = UIColor(red: 173/255, green: 222/255, blue: 195/255, alpha: 0.2)
    let dateFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .medium
       return dateFormatter
    }()
    var body: some View {
        
        GeometryReader { geometry
        in
            ZStack{
                
                Color.init(red: 250/255, green: 100/255, blue: 100/255, opacity: 0.3)
            .edgesIgnoringSafeArea(.all)
            VStack{
            Image(self.poli.name)
                .resizable()
                .scaledToFill()
                .frame(width: 100,height: 100)
                .clipped()
                //Slider(value: self.$brightnessAmount, in: 0...1)
                .brightness(self.brightnessAmount)
                Slider(value: self.$brightnessAmount, in: 0...1)
                Text("今天是"+self.dateFormatter.string(from: self.mindTime))
                DatePicker("選擇今天的日期", selection: self.$mindTime,displayedComponents: .date)
                    .frame(width:380)
                TextField("告訴波利你的名字", text: self.$name) {
                    self.showAlert = true
                }
                .frame(width:380,height:60)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.pink, lineWidth: 3))
                .alert(isPresented: self.$showAlert) { () -> Alert in
                        let result: String
                    result = "今天是\(self.dateFormatter.string(from: self.mindTime))\n給\(self.name):\(self.poli.content)"
                                
                        return Alert(title: Text(result))
                }
                .padding()
                Spacer()
        }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(poli: polis[1])
    }
}
