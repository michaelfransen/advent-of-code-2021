import Foundation

struct Board {
    struct Spot {
        let number: Int
        var isMarked = false
    }

    var rows: [[Spot]] = [[]]

    init(values: [[Int]]) {
        rows = values.map { $0.map { Spot(number: $0) }}
    }

    mutating func mark(number: Int) {
        for r in 0..<5 {
            for c in 0..<5 {
                if rows[r][c].number == number {
                    rows[r][c].isMarked = true
                    break
                }
            }
        }
    }

    func isWinner() -> Bool {
        // Row winner
        for row in rows {
            if row[0].isMarked && row[1].isMarked && row[2].isMarked && row[3].isMarked && row[4].isMarked {
                return true
            }
        }

        // Column winner
        for c in 0..<5 {
            if rows[0][c].isMarked && rows[1][c].isMarked && rows[2][c].isMarked && rows[3][c].isMarked && rows[4][c].isMarked {
                return true
            }
        }

        return false
    }

    func sumOfUnmarked() -> Int {
        var sum = 0
        for r in 0..<5 {
            for c in 0..<5 {
                if !rows[r][c].isMarked {
                    sum += rows[r][c].number
                }
            }
        }

        return sum
    }
}

private func main() {
    guard let array = try? String(contentsOfFile: "./input.dat").components(separatedBy: "\n") else { return }

   let callNumbers = array.first!.components(separatedBy: ",").compactMap(Int.init)

    var boards = array
        .dropFirst()
        .dropFirst()
        .split(separator: "")
        .map { $0.map { $0 .split(separator: " ").filter { !$0.isEmpty }.map { Int($0)! }}}
        .map(Board.init(values:))

    for number in callNumbers {
        for i in 0..<boards.count {
            boards[i].mark(number: number)
            if boards[i].isWinner() {
                print(boards[i].sumOfUnmarked() * number)
                exit(0)
            }
        }
    }
}

main()
