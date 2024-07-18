//
//  IsCepHomeView.swift
//  IsCepHomeView
//
//  Created by qwerty on 18.07.2024.
//

import SwiftUI

struct IsCepHomeView: View {
    var body: some View {
        VStack{//face.smiling, //bubble.left.fill, //bell.fill
            VStack{
                HeaderView()//üst alan
                Spacer()
                middleView()//orta alan
                Spacer()
                subregion()//alt alan
            }
        }.padding(.horizontal,20)
            .background(Color(hex: 0x14121B))
        
    }
    
    @ViewBuilder
    func HeaderView()->some View{
        HStack {
            Button {
                print("dil")
            } label: {
                Image(systemName: "bubble.left.fill")
            }.overlay{
                Text("EN")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .offset(y: -3)
            }
            Spacer()
            Button {
                print("bildirim")
            } label: {
                Image(systemName: "smiley")
            }
            
            Button {
                print("yüz")
            } label: {
                Image(systemName: "bell.fill")
            }
        }.font(.system(size: 25))
        
            .overlay{
                Text("İşCep")
                    .font(.system(size: 25,weight: .regular,design: .rounded))
            }.foregroundColor(.white)
    }
    
    @ViewBuilder
    func middleView()->some View{
        VStack(spacing: 0) {
            Circle()
                .frame(width: 100,height: 100)
                .foregroundColor(Color(hex: 0x292B36))
                .overlay{
                    Image(systemName: "person.fill")
                        .font(.system(size: 45))
                        .foregroundColor(.white)
                }
                .padding(.bottom,9)
            Text("Doğukan Güner")
                .fontWeight(.bold)
            Text("Bireysel")
                .foregroundColor(.gray)
                .padding(.bottom,20)
            HStack {
                Text("●")
                Text("●").foregroundColor(.gray)
                
            }.font(.system(size: 9))
                .padding(.bottom,20)
            Button {
                print("Giriş")
            } label: {
                Text("Giriş")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(15)
                    .frame(maxWidth: .infinity) // Bu frame burada olmalı
                    .background(Color.blue)
                    .cornerRadius(12)
                    .contentShape(Rectangle()) // Etkileşim alanını genişletir
                    .padding(.horizontal,40)
            }.padding(.bottom,20)
            
            Button(action: {}, label: {
                Text("YENİ ŞİFRE AL")
                    .foregroundColor(.white.opacity(0.8))
                    .font(.system(size: 15))
            })
        }.foregroundColor(.white)
    }
    
    @ViewBuilder
    func subregion()->some View{
        
            VStack(alignment:.center){
                HStack {
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "chart.bar.xaxis")
                                .foregroundColor(.blue)
                            Text("Mobil Borsa")
                        }
                    })
                    Capsule().frame(width: 35 ,height: 1)
                        .rotationEffect(.init(degrees: 90))
                        .padding()
                        .foregroundColor(.gray)
                    
                    
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "megaphone")
                                .foregroundColor(.blue)
                            Text("Button")
                        }
                    })
                }.foregroundColor(.white)
                    .padding(.horizontal,30)
                    .padding(.top,15)
                Capsule().frame(maxWidth: .infinity,maxHeight: 1)
                    .foregroundColor(.gray)
                    .padding(.bottom,20)
                HStack(spacing:30){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack {
                            Text("Fast")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                                .padding(.bottom,10)
                            Text("Fast")
                            Text("İşlemler")
                        }
                        
                    })
                    Button(action: {}, label: {
                        VStack {
                            Image(systemName: "chart.bar.doc.horizontal")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                                .padding(.bottom,10)
                            Text("Fiyat ve")
                            Text("Oranlar")
                        }
                    })
                    Button(action: {}, label: {
                        VStack {
                            Image(systemName: "qrcode")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                                .padding(.bottom,10)
                            Text("Fiyat ve")
                            Text("Oranlar")
                        }
                    })
                    Button(action: {}, label: {
                        VStack {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                                .padding(.bottom,10)
                            Text("Fiyat ve")
                            Text("Oranlar")
                        }
                    })
                }
                .padding(.bottom,40)
                .foregroundColor(.white)
            }
            .background(Color(hex: 0x292B36))
            .frame(maxWidth: .infinity)
            .cornerRadius(17)
            .offset(y:40)
            .padding(.horizontal,-20)

        
        
    }
}


#Preview {
    IsCepHomeView()
        .preferredColorScheme(.dark)
}

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
