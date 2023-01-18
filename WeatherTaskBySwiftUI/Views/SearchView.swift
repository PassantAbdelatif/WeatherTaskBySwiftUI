//
//  SearchView.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 17/01/2023.
//

import SwiftUI


struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchViewState: SearchViewState
    @State var searchKeyWord: String = ""
    @State var selectedWeather: WeatherAutoCompleteSearchResponse?
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    closeSearchView()
                }) {
                    Image(AssetNames.Arrow.arrowLeft)
                        .renderingMode(.original)
                }
                .padding(.leading, 25)
                .padding(.trailing, 10)
                
                TextField("search city",
                          text: $searchKeyWord.onChange({ (seachValue) in
                    viewModel.getWeatherForecastSearchResults(searchKeyWord: seachValue)
                    
                }))
                .modifier(ClearButton(text: $searchKeyWord))
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 15.0).strokeBorder(.gray,
                                                                           style: StrokeStyle(lineWidth: 1.0)))
                .padding()
                
            }.padding(.top, UIDevice.current.hasNotch ? 40 : 25)
            List(viewModel.weatherForecastSearchResults ?? [],
                 id: \.self,
                 selection: $selectedWeather) { dataType in
                AutoCompleteSearchCell(weatherAutoComplete: dataType)
                    .listRowSeparator(.hidden)
                
            }
                 .hidden(!viewModel.showAutoCompleteView)
                 .listStyle(.grouped)
                 .background(.white)
                 .onAppear {
                     let tableHeaderView = UIView(frame: .zero)
                     tableHeaderView.frame.size.height = 1
                     UITableView.appearance().tableHeaderView = tableHeaderView
                 }

        }
        .frame(maxWidth: .infinity,
               maxHeight: viewModel.showAutoCompleteView ? 300 :  UIDevice.current.hasNotch ? 120 : 104)
        .background(.white)
        .cornerRadius(30, corners: [.bottomLeft, .bottomRight]) //
    }
    func closeSearchView() {
        searchViewState = .isClosed
    }
}

public struct ClearButton: ViewModifier {
    @Binding var text: String
    
    public init(text: Binding<String>) {
        self._text = text
    }
    
    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            Image(systemName: "xmark")
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 1)
                .onTapGesture { self.text = "" } // onTapGesture or plainStyle button
        }
    }
}

struct AutoCompleteSearchCell: View {
    var weatherAutoComplete: WeatherAutoCompleteSearchResponse
    
    var body: some View {
        HStack {
            BoldTextLabel(boldText: weatherAutoComplete.name.orEmpty,
                          boldSize: 16,
                          textColor: CustomColor.textDarkColor)
            Text("-")
            MediumTextLabel(mediumText: weatherAutoComplete.region.orEmpty,
                            mediumSize: 16,
                            textColor: CustomColor.textDarkColor)
        }.padding(.leading, 32)
    }
}

