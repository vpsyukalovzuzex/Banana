# PART ONE
1. Modal: The controller is displayed abowe of the parent controller. The parent controller knows about the shown controller and child knows parent. If you close the parent, the presented one is also closed. UINavigationController: A controller that stores a stack of controllers in itself, and displays a new one by adding it to the stack. Usually accompanied with a UINavigationBar (can be hidden), it allows ui navigation out of the box like LIFO (last in, first out). The controllers know about the navigation controller, but they don't know about each other.
2. Would use CoreData, but replace it with Realm. Keychen serves for passwords, saving any small information that should not be lost when the application is uninstalled. In UserDefaults -> any settings. But even for this I would use Realm, because it has a cool observe function
3. Retain cycle. And just in case, I would return the closure in the main-thread, suddenly the closure is returned not to the main-thread and some action with the UI is performed on self.data didSet. The issue of architectural patterns is probably not considered here.
4. POP: I always give an example here. But the bottom line is that the implementation of the method in swift can be described as the default for everyone, and, if necessary, overridden for something specific.
```swift
protocol Walkable {

    fun walk()
}

extension Walkable {

    fun walk() {
          print("I'm walking")
    }
}

class Human: Walkable {
    // Empty.
}

class Animal: Walkable {
    // Empty.
}

Human().walk() // Out: "I'm walking"
Animal().walk() // Out: "I'm walking"
```
