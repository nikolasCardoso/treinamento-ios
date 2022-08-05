//
//  API.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 02/08/22.
//

typealias SuccessResult<T: Decodable> = (T) -> Void
typealias FailureResult = (APIError) -> Void

import Foundation

class API {
    
    let baseUrl = Strings.freeToGameBaseUrl()
    
    func request<T: Decodable>(
        endpoint: Endpoint,
        method: HTTPMethod = .get,
        success: @escaping SuccessResult<T>,
        failure: @escaping FailureResult
    ) {
        guard var url = URL(string: baseUrl) else {
            failure(.badUrl(string: baseUrl))
            return
        }
        
        url.appendPathComponent(endpoint.url)
        
        switch endpoint {
        case .game(_):
            guard var urlComponents = URLComponents(string: url.absoluteString) else { return }
            urlComponents.queryItems = [URLQueryItem(name: "id", value: endpoint.gameId)]
            guard let newUrl = urlComponents.url else {
                return
            }
            url = newUrl
            break
        default:
            break
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(.requestFailed(error: error))
                return
            }
            
            guard let data = data else {
                failure(.invalidData)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                success(decodedData)
                print(decodedData)
            } catch {
                failure(.decodeFailed(
                    error: error,
                    textData: String(data: data, encoding: .utf8)
                ))
            }
        }.resume()
    }
}
