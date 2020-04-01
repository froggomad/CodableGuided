import Foundation





struct Car: Decodable {
    var id: Int
    var make: String
    var model: String
    var body: String
    var engine: String
    var wheels: Int
}

let mockJSONString =
"""
[{
  "id": 1,
  "make": "Ford",
  "model": "Fusion",
  "body": "Plexiglass",
  "engine": "V-6",
  "wheels": 4
}]
""".data(using: .utf8)!

var cars: [Car] = []

do {
    let jsonDecoder = JSONDecoder()
    let decodedCars = try jsonDecoder.decode([Car].self, from: mockJSONString)
    cars = decodedCars
} catch let decodeError {
    print("Error Decoding JSON: \(decodeError)")
}

print(cars)

extension Car: Encodable {

}

do {
    let jsonEncoder = JSONEncoder()
    let encodedCars = try jsonEncoder.encode(cars)
    //prints bytes
    print(encodedCars)
    //prints JSON
    print(String(data: encodedCars, encoding: .utf8))
} catch let encodeError {
    print("Error Encoding JSON: \(encodeError)")
}
