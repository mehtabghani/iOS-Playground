import Foundation

func dateFromStringISOFormat(dateString: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let date = formatter.date(from: dateString)
    return date
}

// creating date object
let startDateStr = "2021-08-02T07:30:35.030Z"
let startDate = dateFromStringISOFormat(dateString: startDateStr)!

//formatting
let relativeDateFormatter = DateFormatter()
relativeDateFormatter.timeStyle = .short
relativeDateFormatter.dateStyle = .medium
relativeDateFormatter.locale = Locale(identifier: "en_US_POSIX")
//relativeDateFormatter.locale = Locale(identifier: "en_GB")
//relativeDateFormatter.pmSymbol = "PP"

//relativeDateFormatter.doesRelativeDateFormatting = true


var formattedDate = relativeDateFormatter.string(from: startDate)
print(formattedDate)

//relativeDateFormatter.setLocalizedDateFormatFromTemplate("EEEE | HH:mm a")
relativeDateFormatter.dateFormat = "EEEE | HH:mma"
formattedDate = relativeDateFormatter.string(from: startDate)
print(formattedDate)


let components = Calendar.current.dateComponents([.weekday, .weekdayOrdinal], from: Date())
print(components.weekdayOrdinal)
print(DateFormatter().weekdaySymbols)



/**
 Time Style
 */

//formatter.timeStyle = .none   -> "will remove time"
//formatter.timeStyle = .short  -> 12:30 PM
//formatter.timeStyle = .medium -> 12:30:35 PM
//formatter.timeStyle = .full   -> 12:30:35 PM Pakistan Standard Time
//formatter.timeStyle = .long   -> 12:30:35 PM GMT+5

/**
 Date Style
 */

//formatter.dateStyle = .none   -> "will remove time"
//formatter.dateStyle = .short  -> 8/2/21
//formatter.dateStyle = .medium -> Aug 2, 2021
//formatter.dateStyle = .full   -> Monday, August 2, 2021
//formatter.dateStyle = .long   -> August 2, 2021


/**
 doesRelativeDateFormatting = true
 
 Will convert:
    Aug 2, 2021 at 12:30 PM
 
 to:
    Today at 12:30 PM
 
 example:
    Today/Yesterday/Tomorrow
 */


/**
 Locle
 
 en_GB:
 * Today at 12:30
 * 2 Aug 2021 at 12:30
 
 en_US
 * Today at 12:30 PM
 * Aug 2, 2021 at 12:30 PM

 */
