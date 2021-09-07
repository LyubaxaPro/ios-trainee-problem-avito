//
//  Errors.swift
//  Avito_trainee
//
//  Created by LyubaxaPro on 06.09.2021.
//

import Foundation

enum Errors: String, Error {
    case urlError = "Wrong url"
    case dataTaskError = "dataTaskError"
    case dataError = "Data is empty"
    case decoderError = "Decoder error"
}
