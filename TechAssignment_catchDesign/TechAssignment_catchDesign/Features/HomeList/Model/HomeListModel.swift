//
//  HomeListModel.swift
//  TechAssignment_catchDesign
//
//  Created by Navaldeep Kaur on 19/05/25.
//

import Foundation

struct HomeModel: Identifiable, Codable {
    let id: Int
    let title: String
    let subtitle: String
    let content: String
    
    var capitalizedTitle: String {
            title.prefix(1).uppercased() + title.dropFirst()
        }

        var capitalizedSubtitle: String {
            subtitle.prefix(1).uppercased() + subtitle.dropFirst()
        }

        var capitalizedContent: String {
            content.prefix(1).uppercased() + content.dropFirst()
        }
}
