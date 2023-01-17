//
//  WeatherForecastContentView.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 17/01/2023.
//

import SwiftUI

struct WeatherForecastContentView: View {
    @ObservedObject var viewModel: MainWeatherViewModel
    
    var body: some View {
        
        let state = viewModel.state
        
        switch state {
        case .idle:
            Color.clear.onAppear(perform: viewModel.getCurrentWeatherForecast)
        case .loading:
            ProgressView()
        case .success:
            ZStack {
                fullBackground(imageName: AssetNames.Background.splashBackgroundImage)
                fullBackground(imageName: AssetNames.Background.gradientBackgroundImage)
                
                VStack {
                    ZStack{
                        
                        HStack{
                            MediumTextLabel(mediumText: (viewModel.weatherForecast?.location?.localTimeFormatted.orEmpty).orEmpty,
                                            mediumSize: 16)
                        }
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                executeSearch()
                            }) {
                                Image(AssetNames.SearchView.searchIcon)
                                    .renderingMode(.original)
                            }
                            .padding([.trailing])
                        }
                        
                    }.padding(.top, 80)
                    
                    VStack(spacing: 4) {
                        Text((viewModel.weatherForecast?.location?.name.orEmpty).orEmpty)
                            .font(.custom(FontNames.SFPO.SFPOBold, size: 32))
                            .foregroundColor(.white)
                            .frame(alignment: .center)
                        
                        MediumTextLabel(mediumText: (viewModel.weatherForecast?.location?.localDateFormatted).orEmpty,
                                        mediumSize: 16)
                        
                    }
                    .propotionalFrame(width: 1, height: 0.15)
                    
                    VStack (spacing: 18) {
                        
                        ImageWithURLView(urlStringValue: (viewModel.weatherForecast?.current?.condition?.weatherIconFullUrl).orEmpty ,
                                         width: 70,
                                         height: 70)
                        BoldTextLabel(boldText: (viewModel.weatherForecast?.current?.weatherTempF).orEmpty,
                                      boldSize: 56)
                        MediumTextLabel(mediumText: (viewModel.weatherForecast?.current?.condition?.text).orEmpty,
                                        mediumSize: 16)
                        
                        HStack {
                          HStack {

                                ImageWithAssetName(imageName: AssetNames.WeatherView.windIcon,
                                                   width: 20,
                                                   height: 20)
                               
                              MediumTextLabel(mediumText: (viewModel.weatherForecast?.current?.windValue).orEmpty,
                                              mediumSize: 12)
                           }.padding(.trailing, 43)
                           HStack {
//
                                ImageWithAssetName(imageName: AssetNames.WeatherView.humidityIcon,
                                                   width: 20,
                                                   height: 20)
//
                               MediumTextLabel(mediumText: (viewModel.weatherForecast?.current?.humdityValue).orEmpty,
                                               mediumSize: 12)
                           }
                        }
                    }
                    .padding([.horizontal, .vertical])
                    Spacer()
                    
                    HStack(spacing: UIScreen.main.bounds.width/3 - 60) {
                        WeatherOfTheDay(weatherImage: (viewModel.todayWeatherForecast?.day?.condition?.weatherIconFullUrl).orEmpty,
                                        weatherTemp: (viewModel.todayWeatherForecast?.day?.dayTempFRange).orEmpty,
                                        weatherDay: "Today")
                        WeatherOfTheDay(weatherImage: (viewModel.tomorrowweatherForecast?.day?.condition?.weatherIconFullUrl).orEmpty,
                                        weatherTemp: (viewModel.tomorrowweatherForecast?.day?.dayTempFRange).orEmpty,
                                        weatherDay: "Tomorrow")
                        WeatherOfTheDay(weatherImage: (viewModel.fridayWeatherForecast?.day?.condition?.weatherIconFullUrl).orEmpty,
                                        weatherTemp: (viewModel.fridayWeatherForecast?.day?.dayTempFRange).orEmpty,
                                        weatherDay: "Friday")
                    }
                    //.padding([ .bottom], 50)
                    Spacer()
                }
            }
        case .failed(let errorViewModel):
            Color.clear.alert(isPresented: $viewModel.showErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(errorViewModel.message),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    func executeSearch() {
        print("Now search…")
        viewModel.city = "cairo"
        viewModel.getCurrentWeatherForecast()
    }
}

struct WeatherForecastContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastContentView(viewModel: MainWeatherViewModel())
    }
}