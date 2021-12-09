import Foundation

private func main() {
    guard let array = try? String(contentsOfFile: "./input.dat").components(separatedBy: "\n") else { return }
    let values = array.compactMap(Int.init)
    var sum = 0
    for i in 3..<values.count {
        let currentValue = values[i] + values[i-1] + values[i-2]
        let previousValue = values[i-1] + values[i-2] + values[i-3]
        sum += currentValue > previousValue ? 1 : 0
    }

    print(sum)
}

main()
