//
//  WalletValidator.swift
//  CrytoWalletValidator
//
//  Created by Suryani Chang on 14/12/2017.
//

import Foundation

struct WalletValidator {
    enum ValidationError: String, Error {
        case invalidAddress  = "Invalid address"
        case invalidCurrency = "Currency supported"
        case invalidNetwork  = "Network supported"
    }
    
    enum NetworkType: String {
        case prod    = "prod"
        case testNet = "testnet"
        static let allValues = ["prod","testNet"]
    }
    
    private static func getAddressType(_ address: String) -> String? {
        
        if let decoded = address.base58CheckDecodedData {
            if decoded.count != 21 {
                return nil
            }
            
            return Data(bytes:decoded.bytes[0..<1]).fullHexString
        }
        
        return nil
    }
    
    static func validate(address: String, currencyNameOrSymbol: String, networkType: NetworkType) throws {
        
        guard let currency = CurrencyUtil().retrieveCurrencyBySymbol(currencyNameOrSymbol) else {
            throw ValidationError.invalidCurrency
        }
            
        let addressType = getAddressType(address)
        
        if networkType == .prod || networkType == .testNet, let addressTypes = currency.addressTypes[networkType.rawValue] {
            let result = addressTypes.filter { $0 == addressType }
            if result.count == 0 {
                throw ValidationError.invalidAddress
            }
        }else{
             throw ValidationError.invalidNetwork
        }
        
    }
}
