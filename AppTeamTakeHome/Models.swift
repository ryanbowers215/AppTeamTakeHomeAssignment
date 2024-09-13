//
//  Models.swift
//  AppTeamTakeHome
//
//  Created by Ryan Bowers on 9/11/24.
//

import Foundation
import Combine

struct Response: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand: String
    let sku: String
    let weight: Double
    let dimensions: Dimensions
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let thumbnail: String
    let images: [String]
}

struct SimpleResponse: Codable {
    let products: [SimpleProduct]
    let total: Int
    let skip: Int
    let limit: Int
}

struct SimpleProduct: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let reviews: [Review]
    let thumbnail: String
    let images: [String]
}

class SimpleProductWrapper: Identifiable {
    var id: Int
    var prod: SimpleProduct
    var isLiked: Bool = false
    
    init(prod: SimpleProduct) {
        self.prod = prod
        self.id = prod.id
        self.isLiked = false
    }
}

func simpToWrap(prods: [SimpleProduct]) -> [SimpleProductWrapper] {
    var res: [SimpleProductWrapper] = []
    for prod in prods {
        let foo = SimpleProductWrapper(prod: prod)
        res.append(foo)
    }
    
    return res
}

struct Dimensions: Codable {
    let width: Double
    let height: Double
    let depth: Double
}


struct Meta: Codable {
    let createdAt: String
    let updatedAt: String
    let barcode: String
    let qrCode: String
}

struct Review: Codable, Identifiable {
    let id = UUID()
    let rating: Double
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String
}



class ProductViewModel: ObservableObject {
    
    @Published var products: [SimpleProductWrapper] = []
    @Published var total: Int = 0
    @Published var searchQuery: String = ""
    
    func loadProducts() async {
        do {
            products = try await fetchProducts()
        } catch {
            print("Failed to load products: \(error.localizedDescription)")
        }
    }
    
    func search() async {
        do {
            products = try await searchProducts()
        } catch {
            print("Failed to load products: \(error.localizedDescription)")
        }
    }
    
    
    func fetchProducts() async throws -> [SimpleProductWrapper] {
        let url = URL(string: "https://dummyjson.com/products?limit=100&skip=0")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(SimpleResponse.self, from: data)
        total = response.total
        return simpToWrap(prods: response.products)
    }
    
    func searchProducts() async throws -> [SimpleProductWrapper] {
        let url = URL(string: "https://dummyjson.com/products/search?q=\(searchQuery)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(SimpleResponse.self, from: data)
        total = response.total
        return simpToWrap(prods: response.products)
    }
    
    }

class Cart: ObservableObject {
    var products: [SimpleProductWrapper] = []
    var subtotal: Double = 0.0
    var savings: Double = 0.0
    var total: Double = 0.0
    
    func addToCart(prod: SimpleProductWrapper){
        products.append(prod)
        subtotal += (prod.prod.price)
        savings += (prod.prod.discountPercentage / 100) * (prod.prod.price)
        total += ((100 - prod.prod.discountPercentage) / 100) * (prod.prod.price) * 1.07
        print("\(prod.prod.title) to cart")
    }
}

class Favorites: ObservableObject {
    var products: [SimpleProductWrapper] = []
    
    func addToFavorites(prod: SimpleProductWrapper){
        if prod.isLiked == false {
            products.append(prod)
            prod.isLiked = true
            print("\(prod.prod.title) to favorites")
        } else {
            prod.isLiked = false
                    products.removeAll { $0.prod.id == prod.prod.id }
                    print("\(prod.prod.title) removed from favorites")
        }
    }
}

