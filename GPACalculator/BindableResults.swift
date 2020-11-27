//
//  BindableResults.swift
//  GPACalculator
//
//  Created by Junead Khan on 03/10/2020.
//  Copyright © 2020 Junead Khan. All rights reserved.
//

import Foundation
import RealmSwift

class BindableResults<Element>: ObservableObject where Element: RealmSwift.RealmCollectionValue {

    var results: Results<Element>
    private var token: NotificationToken!

    init(results: Results<Element>) {
        self.results = results
        lateInit()
    }

    func lateInit() {
        token = results.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    deinit {
        token.invalidate()
    }
}
