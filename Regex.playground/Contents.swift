import UIKit
/*
 [a-z] -> find lowercase character
 [A-Z] -> find uppercase character
 [0-9] -> 0 to 9
 [a-z]ello -> any character before 'ello' e.g 'hello', 'tello'
 [a-z]{3} -> exactly three digits e.g 'abc'
 [0-9]{1,3} -> one or three digits
 \d -> digit
 \s -> whitespace
 * -> 0 or greater
 + -> 1 or greater
 ? -> 0 or 1
 . -> match any single character except a line break. e.g 'c.t' -> 'cat', 'cbt'
 .* -> match one or more of anything that isn’t a line break. e.g 'a.*t' -> at', 'abct', 'abbbt'
*/

var detailText = "Hardcoded step text -  \n  [Variable reference text] [Variable reference text] {variable-15828929054740019} [Variable Reference Text 2] {variable-15828929054740020} {variable-15828930221020080} abc"

//--- finding word matches

var pattern = #"step"#
var ranges = detailText.range(of: pattern, options: .regularExpression)


//-----
pattern = #"s[a-z].p"#
ranges = detailText.range(of: pattern, options: .regularExpression)

//-----
pattern = #"\[.*\]"#
ranges = detailText.range(of: pattern, options: .regularExpression)
print(detailText[ranges!])

//------
pattern = #"\[[a-zA-Z]* [a-zA-Z]* [a-zA-Z]*\]"#
ranges = detailText.range(of: pattern, options: .regularExpression)

//--------

pattern = #"\{variable\-\d+\}"#
ranges = detailText.range(of: pattern, options: .regularExpression)


