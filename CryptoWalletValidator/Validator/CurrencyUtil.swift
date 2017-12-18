//
//  CurrencyUtil.swift
//  CrytoWalletValidator
//
//  Created by Suryani Chang on 14/12/2017.
//

import Foundation

public struct CurrencyUtil {
    static var supportedCurrencies: [String:String] = ["bitcoin":"btc","litecoin":"ltc"]
    private var currencies:[Currency] = []
    
    init() {
        for currencySymbol in CurrencyUtil.supportedCurrencies {
            let currency:Currency = Currency(name: currencySymbol.key, symbol: currencySymbol.value)
            currencies.append(currency)
        }
    }

    func retrieveCurrencyBySymbol(_ symbolOrName: String) -> Currency? {
        return currencies.filter{ $0.name == symbolOrName || $0.symbol == symbolOrName }.first
    }
}
