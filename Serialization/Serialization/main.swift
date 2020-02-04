//Deprecated.... 다시 정리하자

// 바이너리 데이터: Data
// Serialization/Deserialization
//

// NSCoding

// NSKeyedArchiver


import Foundation

//let num = 1989
//do {
//    let data =  try NSKeyedArchiver.archivedData(withRootObject: num, requiringSecureCoding: true)
//    print(data)
//
//
//} catch {
//    print("Error")
//}

class Person: NSObject, NSCoding {
    var name: String
    var birthYear: Int
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "Name")
        coder.encode(birthYear, forKey: "Year")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "Name") as! String
        birthYear = coder.decodeInteger(forKey: "Year")
    }
    
}

