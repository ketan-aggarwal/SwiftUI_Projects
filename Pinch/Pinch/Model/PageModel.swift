//
//  PageModel.swift
//  Pinch
//
//  Created by Ketan Aggarwal on 20/03/24.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbNailName: String {
        return "thumb-" + imageName
    }
}
