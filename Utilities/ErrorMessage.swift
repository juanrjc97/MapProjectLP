//
//  ErrorMessage.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/13/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import Foundation

enum ErrorMessage: String {
    case invalidUsername = "The username created an invalid request. Please try again. or login before sign in"
    case unableToComple = "Unable to complete your request. Please check your internet conection"
    case InvalidResponse = "Invalid resopnse from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    
}