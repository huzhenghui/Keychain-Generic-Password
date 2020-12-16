import Foundation

var service: String = "{{ cookiecutter.service }}"
var account: String = "{{ cookiecutter.account }}"

var pwLength: UInt32 = 0
var pwData: UnsafeMutableRawPointer?
var item: SecKeychainItem?

var status: OSStatus = SecKeychainFindGenericPassword(
    nil,
    UInt32(service.lengthOfBytes(using: String.Encoding.utf8)),
    service.cString(using: String.Encoding.utf8),
    UInt32(account.lengthOfBytes(using: String.Encoding.utf8)),
    account.cString(using: String.Encoding.utf8),
    &pwLength,
    &pwData,
    &item)
if status == errSecSuccess {
    if let myData = pwData {
        let password: String? = String(bytesNoCopy: myData, length: Int(pwLength), encoding: String.Encoding.utf8, freeWhenDone: true)
        if let myPassword = password {
            print(myPassword)
        }
    }
}