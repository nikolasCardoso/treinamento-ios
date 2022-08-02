//
//  RepositoryData.swift
//  GitRepositories
//
//  Created by Nikolas Cardoso de Oliveira on 01/08/22.
//

import Foundation

struct RepositoryData: Decodable {
    let repositories: [Repository]

    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}
