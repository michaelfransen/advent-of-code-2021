import Foundation

enum Move {
    case forward(Int)
    case up(Int)
    case down(Int)
}

private func main() {
    guard let array = try? String(contentsOfFile: "./input.dat").components(separatedBy: "\n") else { return }

    let moves: [Move] = array.compactMap { stringValue in
        let parts = stringValue.components(separatedBy: " ")
        let amount = Int(parts[1])!

        switch parts[0] {
        case "forward":
            return Move.forward(amount)
        case "up":
            return Move.up(amount)
        case "down":
            return Move.down(amount)
        default:
            return nil
        }
    }

    var depth = 0
    var distance = 0
    var aim = 0

    for move in moves {
        switch move {
        case .up(let amount):
            aim -= amount
        case .down(let amount):
            aim += amount
        case .forward(let amount):
            distance += amount
            depth += aim * amount
        }
    }

    print(depth * distance)
}

main()

