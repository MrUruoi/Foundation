// class func scheduledTimer(timeInterval ti: TimeInterval, target aTarget: Any, selector aSelector: Selector, userInfo: Any?, repeats yesOrNo: Bool) -> Timer
// func invalidate()

// class func scheduledTimer(withTimeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) -> Timer
// func fire(): 바로 동작


import Foundation

class Alarm: NSObject {
    @objc func ring(timer: Timer) {
        print("Ring...")
    }
}

let alarm = Alarm()
var timer1 = Timer.scheduledTimer(timeInterval: 3, target: alarm, selector: #selector(Alarm.ring(timer:)), userInfo: nil, repeats: false)

var timer2 = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
    print("> _<")
}
// timer2.fire()
