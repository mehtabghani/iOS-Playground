
import Foundation

func longestWord(_ sen: String) -> String {

    var maxLength = 0
    var maxWord: String = ""
    var word = ""

      for (i,s) in sen.enumerated() {

        if s.isLetter {
          word += String(s)
        }

        if s == " " || i == sen.count-1, word.count > maxLength {
            maxLength = word.count
            maxWord = word
            word = ""
            continue
        }
        
        if s == " " {
            word = ""
        }
      }

    return maxWord
}

longestWord("hello world")
longestWord("this??? is funny")
longestWord("i love... fun")

