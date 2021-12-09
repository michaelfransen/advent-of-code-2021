import Foundation

private func main() {
    guard let array = try? String(contentsOfFile: "./input.dat").components(separatedBy: "\n") else { return }

    var gammaBits = ""
    var epsilonBits = ""

    for i in 0..<12 {
        let zeros = array.filter { $0[$0.index($0.startIndex, offsetBy: i)] == "0"}.count
        let ones = array.filter { $0[$0.index($0.startIndex, offsetBy: i)] == "1"}.count

        gammaBits += ones > zeros ? "1" : "0"
        epsilonBits += zeros > ones ? "1" : "0"
    }

    let gammaInt = Int(gammaBits, radix: 2)!
    let epsilonInt = Int(epsilonBits, radix: 2)!

    print(gammaInt * epsilonInt)
}

main()

