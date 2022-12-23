import UIKit

// MARK: - Protocols Declaration
protocol CalendarDataSource {
    func calendar(_ calendar: Calendar, eventsFor date: Date) ->
        [String]
    
    func calendar(_ calendar: Calendar, add event: String, to
        date: Date)
}

protocol CalendarDelegate: class {
    func calendar(_ calendar: Calendar, willDisplay year: Int)
    func calendar(_ calendar: Calendar, didSelect date: Date)
    func calendarShouldChangeYear(_ calendar: Calendar) -> Bool
}

// MARK: - Calender

class Calendar {
    var dataSource: CalendarDataSource?
    weak var delegate: CalendarDelegate?
    var selectedDate: Date = Date()
    var currentYear: Int = 2018
    
    func changeDate(to date: Date) {
        selectedDate = date
        delegate?.calendar(self, didSelect: date)
        
        if let items = dataSource?.calendar(self, eventsFor: date) {
            print("Today's events are...")
            items.forEach { print($0) }
        } else {
            print("You have no events today.")
        }
    }
    
    func changeYear(to year: Int) {
        if delegate?.calendarShouldChangeYear(self) ?? true {
            delegate?.calendar(self, willDisplay: year)
            currentYear = year
        }
    }
    
    func add(event: String) {
        dataSource?.calendar(self, add: event, to: selectedDate)
    }
}

// MARK: -

protocol ReminderPresenting {
    func yearChanged(to year: Int)
}

class Reminders: ReminderPresenting {
   
    var title: String?
    var calendar = Calendar()
    let reminderDelegate = RemindersCalendarDelegate()
    
    init() {
        self.setup()
    }
    
    private func setup() {
        calendar.delegate = reminderDelegate
        calendar.dataSource = RemindersCalendarDataSource()
        reminderDelegate.setReminder(reminder: self)
    }
    
    func yearChanged(to year: Int) {
        title = "Year: \(year)"
    }
}

class RemindersCalendarDelegate: CalendarDelegate {
   
    var reminder: ReminderPresenting?
    
    func setReminder(reminder: ReminderPresenting) {
        self.reminder = reminder
    }
    
   func calendarShouldChangeYear(_ calendar: Calendar) -> Bool {
        return true
   }
   func calendar(_ calendar: Calendar, willDisplay year: Int) {
        reminder?.yearChanged(to: year)
   }
   func calendar(_ calendar: Calendar, didSelect date: Date) {
        print("You selected \(date)")
   }
}

class RemindersCalendarDataSource: CalendarDataSource {
    func calendar(_ calendar: Calendar, eventsFor date: Date) -> [String] {
        return ["Organize sock drawer", "Take over the world"]
    }
    
    func calendar(_ calendar: Calendar, add event: String, to date: Date) {
        print("You're going to \(event) on \(date).")
    }
    
}
