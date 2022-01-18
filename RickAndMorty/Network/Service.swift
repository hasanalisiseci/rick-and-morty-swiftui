//
//  Service.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 16.01.2022.
//

import Foundation

class Service: ObservableObject {

    static let baseURL = "https://rickandmortyapi.com/api/"
    static let shared = Service()

    //MARK: - Charachter Request
    func fetchCharactersRequest(filter: String, endpointType: endpointType, completion: @escaping (Result<CharacterModel<InfoModel>, RickandMortyError>) -> ()) {
        let url = Service.baseURL + endpointType.apiTypeString + "/?status=" + filter

        guard let requestURL = URL(string: url) else {
            completion(.failure(.urlError))
            return
        }

        let task = URLSession.shared.dataTask(with: requestURL) { data, resp, err in

            guard let httpResponse = resp as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(.responseError))
                return
            }

            guard let data = data else {
                completion(.failure(.dataError))
                return
            }

            do {
                let response = try JSONDecoder().decode(CharacterModel<InfoModel>.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))

                }
            }
            catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }

    //MARK: - Only Char Request
    func fetchOnlyCharRequest(url: String, completion: @escaping (Result<Character, RickandMortyError>) -> ()) {
        let url = url

        guard let requestURL = URL(string: url) else {
            completion(.failure(.urlError))
            return
        }

        let task = URLSession.shared.dataTask(with: requestURL) { data, resp, err in

            guard let httpResponse = resp as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(.responseError))
                return
            }

            guard let data = data else {
                completion(.failure(.dataError))
                return
            }

            do {
                let response = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))

                }
            }
            catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }

    //MARK: - Request Episode or Location
    func fetchRequest<T:Decodable>(endpointType: endpointType, completion: @escaping (Result<T, RickandMortyError>) -> ()) {

        let url = Service.baseURL + endpointType.apiTypeString

        guard let requestURL = URL(string: url) else {
            completion(.failure(.urlError))
            return
        }

        let task = URLSession.shared.dataTask(with: requestURL) { data, resp, err in

            guard let httpResponse = resp as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(.responseError))
                return
            }

            guard let data = data else {
                completion(.failure(.dataError))
                return
            }

            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            }
            catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
