import Foundation

// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words
// decode those 50 words into an array of strings
// print the array of words, but with each word reversed
// print the average number of characters per word
struct Words: Decodable{
    let words: [String]
}
let urlString = "https://api.noopschallenge.com/wordbot?count=50"
if let url = URL(string: urlString) {
    let request = URLRequest(url: url)
    let session = URLSession(configuration: .ephemeral)
    let task = session.dataTask(with: request) { (data, response, error) in
        let wordsExtract = try! JSONDecoder().decode(Words.self, from: data!)
        print(wordsExtract.words.count)
        var firstList = [String]()
        for word in wordsExtract.words{
            firstList.append(word)
        }
        print(firstList)
        var flipList = [String]()
        var flipWord = String()
        for word in firstList{
            flipWord = String(word.reversed())
            flipList.append(flipWord)
        }
        print(flipList)
        var sum = 0
        for word in firstList{
            sum += word.count
        }
        print(sum / 50)
    }
    task.resume()
}
