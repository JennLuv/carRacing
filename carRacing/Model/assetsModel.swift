//
//  assetsModel.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 30/04/24.
//

import Foundation

struct assetsModel: Identifiable, Hashable {
    var id: Int
    var name: String
    var scnName: String
    
    static func getAssetsData() -> [assetsModel] {
        return [
            assetsModel(id: 1, name: "carType1", scnName: "carType1scn"),
            assetsModel(id: 2, name: "carType2", scnName: "carTyp2scn"),
            assetsModel(id: 3, name: "carType3", scnName: "carType3scn")
        ]
    }
}
