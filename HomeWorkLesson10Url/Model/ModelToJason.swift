//
//  ModelToJason.swift
//  HomeWorkLesson10Url
//
//  Created by vladimir gennadievich on 12.10.2020.
//

import Foundation
import UIKit

struct InfoAboutTeamPlayrs:Decodable {
    let shirt_number:Int?
    let image:String?
    let name:String?
    let team:Team?
}
struct Team:Decodable {
    let name:String?
    let location:String?
}

