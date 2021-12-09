import Foundation

enum SearchType {
    case mostCommon
    case leastCommon
}

private func value(type: SearchType, position: Int, data: [String]) -> Int {
    if data.count == 1 {
        return Int(data[0], radix: 2)!
    }

    let zeros = data.filter { $0[$0.index($0.startIndex, offsetBy: position)] == "0"}
    let ones = data.filter { $0[$0.index($0.startIndex, offsetBy: position)] == "1"}

    switch type {
    case .mostCommon:
        if ones.count >= zeros.count {
            return value(type: type, position: position + 1, data: ones)
        } else {
            return value(type: type, position: position + 1, data: zeros)
        }
    case .leastCommon:
        if zeros.count <= ones.count {
            return value(type: type, position: position + 1, data: zeros)
        } else {
            return value(type: type, position: position + 1, data: ones)
        }
    }

}

private func main() {
    guard let array = try? String(contentsOfFile: "./input.dat").components(separatedBy: "\n") else { return }

    let oxygen = value(type: .mostCommon, position: 0, data: array)
    let carbon = value(type: .leastCommon, position: 0, data: array)

    print(oxygen * carbon)
}

main()

