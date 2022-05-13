//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Merve Nurgül BAĞCI on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
          
            VStack{
                CityTextView(cityName: "Antalya, TR")
            
                MainWeatherStatusView(imageName: "sun.max.fill", temperature: 25)
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 25)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 22)
                    WeatherDayView(dayOfWeek: "TRU", imageName: "cloud.fill", temperature: 18)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.rain.fill", temperature: 15)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 25)
                }
                Spacer()
                Button{
                    print("tapped")
                }label: {
                    WeatherButton(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    var imageName: String
    var temperature: Int
    var body: some View{
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
    }
}

