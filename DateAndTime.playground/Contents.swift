// Date
// DateFomatter
// Calendar
// DataComponent

import Foundation


// Date
// Time interval 이용
// 1970.01.01 기준
let now = Date()
let yesterday = Date(timeIntervalSinceNow: -(60*60*24))
let tomorrow = now.addingTimeInterval(60*60*24)


// compare
now.compare(yesterday).rawValue
now.compare(now).rawValue
now.compare(tomorrow).rawValue


// DateFormatter
// 년/월/일: y, M, d
// 시/분/초: h, m, s
let formatter = DateFormatter()
formatter.timeStyle = .short
let timeStr = formatter.string(from: now)

let customFormatter = DateFormatter()
customFormatter.dateFormat = "yyyy/MM/dd"
let dateStr = customFormatter.string(from: tomorrow)

let date = customFormatter.date(from: "1989/01/07")


// Calendar
let calendar = Calendar.current
let weekOfYear = calendar.component(.weekOfYear, from: now)
let weekOfMonth = calendar.component(.weekOfMonth, from: now)


// DateComponents
var dateComponent = DateComponents()
dateComponent.year = 1989
dateComponent.weekday = 1

if let date = calendar.date(from: dateComponent) {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd"
    formatter.string(from: date)
}
