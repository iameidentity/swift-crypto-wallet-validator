# swift-crypto-wallet-validator
A crypto address validator written in swift for BTC and LTC. Based on the NPM javascript version with extra goodies.

# CryptoAddressValidator

![BackgroundImage](https://image.ibb.co/bQhiZm/validate.png)
![BackgroundImage](https://image.ibb.co/mvvgLR/success.png)
![BackgroundImage](https://image.ibb.co/dqMcum/error.png)

## Getting Started

* Project was built using xcode 9.
* The validator code is under the validator group. Planning to move this out in the future to its own separate project.
* To validate an address, call the Walletvalidator method and pass the address and network type (supports prod and testnet).

```
       do {
            try  WalletValidator.validate(address: address, currencyNameOrSymbol: "btc", networkType: .prod)
       } catch {}
```
## Running the tests

The unit tests are in the CrytoWalletValidatorTests group.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments
* Code was inspired from https://github.com/ryanralph altcoin address validator
* Alertview was taken from https://github.com/vikmeup/SCLAlertView-Swift
* The SHA utils were taken from https://github.com/CityOfZion/neo-swift
* The nice animated textfield is from https://github.com/raulriera/TextFieldEffects

Please let me know if I missed anyone out.
