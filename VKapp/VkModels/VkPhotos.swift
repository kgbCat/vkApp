//
//  VkPhotos.swift
//  VKapp
//
//  Created by Anna Delova on 7/6/21.
//

import Foundation
import SwiftyJSON

struct VkPhotoSize: Codable {
//    var height: Int
    var url: String
    var type: String
//    var width: Int
}


extension VkPhotoSize {
    init(_ json: JSON) {
        self.url = json["url"].stringValue
        self.type = json["type"].stringValue
    }
}

struct VkPhoto: Codable {
    var sizes: [VkPhotoSize]
//    var likes: VkPhotoLikes
    var owner_id: Int
}
extension VkPhoto {
    init(_ json: JSON) {
        self.owner_id = json["owner_id"].intValue
        let sizes = json["sizes"].arrayValue
        self.sizes = sizes.map { VkPhotoSize($0) }
    }
}
//struct PhotoResponse<T:Codable>: Codable {
//    var count: Int
//    var items: [T]
//}
//struct Photos1Response<T:Codable>: Codable {
//    let response: T
//}