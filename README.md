# ⚙️ Singleton Macro for Swift classes

The [singleton-swift-macro-mikekppp](https://github.com/mikekppp/singleton-swift-macro-mikekppp) Swift Macro provides an easy way to create Singletons in a Swift package or Xcode project.  Placing a `@Singleton` attribute on your Class, Struct, or Actor will imbue the characteristics of a classic Singleton on that object.  In addition, your Class, Struct, or Actor may need additional initialization when first instantiated.  For that reason, this macro also makes a call to a `privateInit()` method from within the "standard Swift Singleton" `private init()` template to allow for one time initialization of your Singleton.  See below for details on how this macro expands.

## Usage:

1. Add a package dependecy on [singleton-swift-macro-mikekppp](https://github.com/mikekppp/singleton-swift-macro-mikekppp) to your project
2. Insert the `@Singleton` annotation before the Class you wish to define as a singleton:

```swift
import Singleton

@Singleton
class YourClass {
    // class contents...
}
```

3. The macro will expand the Class definition to a singleton implementation like this:

```swift
import Singleton

class YourClass {
    static let shared = YourClass()

    private init() {
    	privateInit()
    }
}
```

4. You will need to supply a `privateInit()` method.  The method should be used to implement any first time/one time only initialization for your Class.  Optionally this method may remain empty to satisfy the requirements of this macro.
5. Now you may call `YourClass.shared` without having to add boilerplate to your singleton classes.



### The macro can also be applied to Structs:

```swift
import Singleton

@Singleton
struct YourStruct {
    // struct contents...
}
```
#### Which will expand to this:

```swift
import Singleton

struct YourStruct {
    static let shared = YourStruct()

    private init() {
    	privateInit()
    }
}
```



### The macro can also be applied to Actors:

```swift
import Singleton

@Singleton
actor YourActor {
    // actor contents...
}
```
#### Which will expand to this:

```swift
import Singleton

actor YourActor {
    static let shared = YourActor()

    private init() {
    	privateInit()
    }
}
```