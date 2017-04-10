//
//  String.swift
//  NetworkingKit
//
//  Created by Chrisna Aing on 6/18/16.
//  Copyright © 2016 Chrisna. All rights reserved.
//

import Foundation

extension String {
    init?(JSONObject: Any) {
        do {
            let data = try JSONSerialization.data(withJSONObject: JSONObject, options: [])
            self.init(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
