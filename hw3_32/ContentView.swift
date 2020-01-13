//
//  ContentView.swift
//  hw3_32
//
//  Created by User03 on 2020/1/13.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isdisplay = true
    @State private var select = 0
    @State private var nextPage = false
    var poli:Poli
    var poli1 = ["波利","天使波利","惡魔波利","幽靈波利"]
    var body: some View {
        ZStack{
            
            Color.init(red: 250/255, green: 100/255, blue: 100/255, opacity: 0.3)
        .edgesIgnoringSafeArea(.all)
        VStack{
            
            if isdisplay{
                Image(poli1[select])
                .resizable()
                    .frame(width:100,height: 100)
                Text("\n選擇適合今天的波利吧\n")
                .font(.system(size: 21))
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
            }
            else{
                Text("\n現在顯示的是真。幽靈波利\n")
                .font(.system(size: 21))
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
            }
            Button("看看波利怎麼說\n"){
                self.nextPage = true
            }
            .sheet(isPresented: self.$nextPage)
            {SecondView(poli: polis[self.select])}
            .font(.system(size: 21))
            .foregroundColor(.purple)
            
            Toggle("顯示圖片", isOn: $isdisplay)
            .frame(width:350)
            
            Picker(selection: $select, label: Text("可選擇的波利")) {
                          Text(self.poli1[0]).tag(0)
                          Text(self.poli1[1]).tag(1)
                          Text(self.poli1[2]).tag(2)
                          Text(self.poli1[3]).tag(3)
            }
                .frame(width:380)
            .foregroundColor(Color.init(red: 1, green: 1, blue: 1))
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(poli: polis[0])
    }
}
