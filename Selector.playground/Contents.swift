import Foundation

////  - 1 -
//class MyClass: NSObject {
//    @objc func greeting() {
//        print("Hello")
//    }
//}
//
//let sel1 = #selector(MyClass.greeting)
//let obj = MyClass()
//obj.perform(sel1)


// - 2 -
class MyClass: NSObject {
    @objc func sayHello(who: String) {
        print("Hello \(who)")
    }
    func justDoIt() {
        let sel = #selector(sayHello(who:))
        self.perform(sel, with: "World!")
    }
}
let obj = MyClass()
obj.justDoIt()
