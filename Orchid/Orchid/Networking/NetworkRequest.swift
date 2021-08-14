//
//  NetworkRequest.swift
//  Orchid
//
//  Created by Danh Truong on 8/2/21.
//

import Foundation
import UIKit

// MARK: - NetworkRequest
protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _ , _) -> Void in
            guard let data = data, let value = self?.decode(data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            DispatchQueue.main.async { completion(value) }
        }
        task.resume()
    }
}

// MARK: - ImageRequest
class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func execute(withCompletion completion: @escaping (UIImage?) -> Void) {
        load(url, withCompletion: completion)
    }
}

// MARK: - APIRequest
class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.ModelType]? {
        do {
            let decoder = JSONDecoder()
            let wrapper = try decoder.decode(Resource.ModelType.self, from: data)
            return wrapper as! [Resource.ModelType]
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
            return nil
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return nil
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    func execute(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}

// MARK: - APIResource
protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
    var filter: String? { get }
}

extension APIResource {
    var url: URL {
        var components = URLComponents(string: "http://192.168.1.107:1337")!
        components.path = methodPath
//        components.queryItems = [
//            URLQueryItem(name: "site", value: "stackoverflow"),
//            URLQueryItem(name: "order", value: "desc"),
//            URLQueryItem(name: "sort", value: "votes"),
//            URLQueryItem(name: "tagged", value: "swiftui"),
//            URLQueryItem(name: "pagesize", value: "10")
//        ]
        if let filter = filter {
            components.queryItems?.append(URLQueryItem(name: "filter", value: filter))
        }
        return components.url!
    }
}


