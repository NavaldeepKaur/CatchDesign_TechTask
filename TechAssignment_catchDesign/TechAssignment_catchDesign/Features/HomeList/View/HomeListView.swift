//
//  ContentView.swift
//  TechAssignment_catchDesign
//
//  Created by Navaldeep Kaur on 19/05/25.
//

import SwiftUI

struct HomeListView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var isRefreshing = false
    
    var body: some View {
        
        NavigationView {
            Group {
                if viewModel.homeList.isEmpty {
                    // no data view
                    EmptyListView()
                } else {
                    List {
                        ForEach(viewModel.homeList) { item in
                            NavigationLink(
                                destination: DetailView(homeDetail: item)) {
                                HomeListRow(data: item)
                            }
                            .padding(.horizontal, 14)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.lightBlue)
                        }
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.loadHomeList()
        }
        
    }
}

//Empty View
struct EmptyListView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 132, height: 60)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
    }
}

//List Row
struct HomeListRow: View {
    let data: HomeModel
    
    var body: some View {
        
        HStack {
            Text(data.capitalizedTitle)
                .font(.custom("Helvetica", size: 18))
                .foregroundColor(Color.titleColor)
                .lineLimit(1)
            
            Spacer()
            
            Text(data.capitalizedSubtitle).font(.subheadline)
                .font(.custom("Helvetica", size: 18))
                .foregroundColor(Color.subTitleColor)
                .lineLimit(1)
            
            
        }
        .frame(height: 75)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
