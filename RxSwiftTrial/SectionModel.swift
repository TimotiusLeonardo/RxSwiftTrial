//
//  SectionModel.swift
//  RxSwiftTrial
//
//  Created by Timotius Leonardo Lianoto on 28/06/21.
//

import Foundation
import RxDataSources

struct SectionModel {
    var header: String
    var items: [Product]
}

extension SectionModel: SectionModelType {
    init(original: SectionModel, items: [Product]) {
        self = original
        self.items = items
    }
}
