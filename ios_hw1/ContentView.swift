//
//  ContentView.swift
//  test
//
//  Created by User03 on 2020/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var position_x : CGFloat=10.0
    @State private var position_y : CGFloat=10.0
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            Text("Lots o hugging bear")
                .font(.system(size: 20))
                .fontWeight(.black)
                .multilineTextAlignment(.center)
                .position(x:150,y:70)
            Bear().offset(x: position_x,y: position_y)
            VStack{
                Spacer()
                HStack {
                            Text("左右")
                            Slider(value: $position_x, in: 0...80) {
                               Text("")
                            }
                        }
                HStack {
                            Text("上下")
                            Slider(value: $position_y, in: 90...200) {
                               Text("")
                            }
                        }
            }
            .padding()
        }

        
    }
}
struct BearBody: Shape{
    func path(in rect: CGRect) -> Path {
            Path{ (path) in
                path.move(to: CGPoint(x: 18, y:50))
                path.addQuadCurve(to: CGPoint(x:4, y:26), control: CGPoint(x:3, y:44))
                path.addQuadCurve(to: CGPoint(x:32, y:2), control: CGPoint(x:14, y:1))
                path.addQuadCurve(to: CGPoint(x:60, y:25), control: CGPoint(x:50, y:1))
                path.addQuadCurve(to: CGPoint(x:175, y:30), control: CGPoint(x:111, y:10))
                path.addQuadCurve(to: CGPoint(x:212, y:10), control: CGPoint(x:183, y:8))
                path.addQuadCurve(to: CGPoint(x:229, y:34), control: CGPoint(x:226, y:17))
                path.addQuadCurve(to: CGPoint(x:216, y:64), control: CGPoint(x:227, y:47))
                path.addQuadCurve(to: CGPoint(x:203, y:191), control: CGPoint(x:260, y:116))
                path.addQuadCurve(to: CGPoint(x:194, y:210), control: CGPoint(x:215, y:208))
                path.addQuadCurve(to: CGPoint(x:168, y:207), control: CGPoint(x:186, y:213))
                path.addQuadCurve(to: CGPoint(x:64, y:206), control: CGPoint(x:113, y:220))
                path.addQuadCurve(to: CGPoint(x:30, y:209), control: CGPoint(x:31, y:230))
                path.addQuadCurve(to: CGPoint(x:32, y:189), control: CGPoint(x:30, y:203))
                path.addQuadCurve(to: CGPoint(x:18, y:48), control: CGPoint(x:-30, y:137))
            
            }
        }
}



struct EyeBrowLeft: Shape{
    func path(in rect: CGRect) -> Path {
            Path{ (path) in
                path.move(to: CGPoint(x: 68, y:50))
                path.addQuadCurve(to: CGPoint(x:107, y:51), control: CGPoint(x:87, y:40))
            }
        }
}

struct EyeBrowRight: Shape{
    func path(in rect: CGRect) -> Path {
            Path{ (path) in
                path.move(to: CGPoint(x: 125, y:43))
                path.addQuadCurve(to: CGPoint(x:160, y:44), control: CGPoint(x:145, y:33))
            }
        }
}

struct Nose: Shape{
    func path(in rect: CGRect) -> Path{
        Path{ (path) in
            path.move(to: CGPoint(x: 66, y:142))
            path.addQuadCurve(to: CGPoint(x:91, y:102), control: CGPoint(x:57, y:109))
            path.addQuadCurve(to: CGPoint(x:144, y:104), control: CGPoint(x:108, y:95))
            path.addQuadCurve(to: CGPoint(x:153, y:154), control: CGPoint(x:176, y:113))
            path.addQuadCurve(to: CGPoint(x:75, y:156), control: CGPoint(x:133, y:188))
            
        }
    }
}

struct Ear: Shape{
    func path(in rect: CGRect) -> Path{
        Path{ (path) in
            path.move(to: CGPoint(x: 32, y: 56))
            path.addQuadCurve(to: CGPoint(x:51,y: 39), control: CGPoint(x:14,y:7))
        }
    }
}

struct Bear:View{
    var body: some View{
        ZStack{
            Group{
                BearBody()
                    .fill(Color(red: 225/255, green: 94/255, blue: 130/255))
                BearBody().stroke(lineWidth: 5)
                EyeBrowLeft()
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .fill(Color(red:153/255, green: 14/255, blue: 79/255))
                EyeBrowRight()
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .fill(Color(red:153/255, green: 14/255, blue: 79/255))
                //left eye
                Circle()
                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.black)
                    .offset(x:-70, y:-200)
                //right eye
                Circle()
                    .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(red: 0/255, green: 0/255, blue: 0/255))
                    .offset(x:-15, y:-200)
                //button Nose(light brown)
                Path(ellipseIn: CGRect(x:130, y:290, width: 140, height: 95))
                    .fill(Color(red:255/255,green: 212/255, blue: 166/255))
                    .offset(x:-80, y: -200)
                //Nose(dark pink)
                Nose()
                    .fill(Color(red:153/255, green: 14/255, blue: 79/255))
                    .offset(x:5, y:0)
                Ear()
                    .fill(Color(red:255/255,green: 212/255, blue: 166/255))
                    .offset(x:-2,y:-12)
                Ear()
                    .fill(Color(red:255/255,green: 212/255, blue: 166/255))
                    .rotationEffect(.degrees(80))
                    .offset(x:-165,y:-80)
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
