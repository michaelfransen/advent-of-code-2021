import Foundation

private func main() {
    guard let array = try? String(contentsOfFile: "./input.dat").components(separatedBy: "\n") else { return }
    let values = array.compactMap(Int.init)
    var sum = 0
    for i in 0..<values.count {
        guard i != 0 else { continue }
        sum += values[i] > values[i - 1] ? 1 : 0
    }

    print(sum)
}

main()
