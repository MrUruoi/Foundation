import Foundation

// NSObject와 멀티쓰레드
// func performSelector(inBackground aSelector: Selector, with arg: Any?)
// func performSelector(onMainThread aSelector: Selector, with arg: Any?, waitUntilDone wait: Bool)
print(" - 1 - ")
class SomeClass: NSObject {
    @objc func count() {
        for i in 1...10 {
            print(i)
        }
    }
}
let someClass = SomeClass()
someClass.performSelector(inBackground: #selector(SomeClass.count), with: nil)
someClass.performSelector(inBackground: #selector(SomeClass.count), with: nil)


// Thread1
// class func detachNewThreadSelector(_ selector: Selector, toTarget target: Any, with argument: Any?)
// class func detachNewThread(_ block: @escaping () -> Void)
print(" - 2 - ")
class SomeClass2: NSObject {
    @objc func count() {
        for i in 1...10 {
            print("\(i)")
        }
    }
}
let someClass2 = SomeClass2()
Thread.detachNewThreadSelector(#selector(SomeClass2.count), toTarget: someClass2, with: nil)
Thread.detachNewThread {
    for i in 1...10 {
        print("\(i)")
    }
}


// Thread2
// override class var current: Thread
// override var isExecuting: Bool
// override var isFinished: Bool
// override class func isMultiThreaded() -> Bool
// override class func sleep(until date: Date)
// class func sleep(forTimeInterval ti: TimeInterval)

print(" - 3 -")
class SomeThread: Thread {
    override func main() {
        for i in 1...10 {
            print("\(i)")
        }
    }
}
var thread1 = SomeThread()
var thread2 = SomeThread()
thread1.start()
thread2.start()



// OperationQueue, Operation
print(" - 4 -")
class SomeOperation: Operation {
    override func main() {
        for i in 1...10 {
            print("\(i)")
            Thread.sleep(forTimeInterval: 0.01)
        }
    }
}

let queue = OperationQueue()
queue.maxConcurrentOperationCount = 3

let operation1 = SomeOperation()
let operation2 = SomeOperation()
let operation3 = SomeOperation()
let operation4 = SomeOperation()
let operation5 = SomeOperation()

queue.addOperation(operation1)
queue.addOperation(operation2)
queue.addOperation(operation3)
queue.addOperation(operation4)
queue.addOperation(operation5)

queue.waitUntilAllOperationsAreFinished()
