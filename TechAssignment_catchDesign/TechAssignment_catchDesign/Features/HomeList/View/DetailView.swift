//
//  DetailView.swift
//  TechAssignment_catchDesign
//
//  Created by Navaldeep Kaur on 19/05/25.
//

import SwiftUI

struct DetailView: View {
    let homeDetail: HomeModel
    
    var body: some View {
        ZStack {
            Color.detailbackground
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text(homeDetail.capitalizedContent)
                        .font(.custom("Helvetica", size: 18))
                    Spacer()
                }
                .padding(24)
                .navigationBarTitle(homeDetail.capitalizedTitle, displayMode: .inline)
                .navigationBarBackButtonHidden(false)
                
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let detail = HomeModel(id: 1, title: "Lorem ipsum", subtitle: "subtitle", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        DetailView(homeDetail: detail)
    }
}
