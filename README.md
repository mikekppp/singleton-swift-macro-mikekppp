# ⚙️ Singleton Macro for Swift classes

This repository contains a simple implementation of a swift macro that allows you to create singletons in a more concise way.

## Usage:

1. Add a package dependecy to your project
2. Insert the `@Singleton` annotation before the class you wish to define as a singleton:

```swift
import Singleton

@Singleton
class MyClass {
    // class contents...
}
```

3. The macro will expand the class definition to a singleton implementation like this:

```swift
import Singleton


class MyClass {

    static let shared = MyClass()

    private init() {
    }
}
```

4. Now you may call `MyClass.shared` without having to add boilerplate to your singleton classes.
5. The macro can also be applied to Structs:

```swift
import Singleton

@Singleton
struct MyStruct {
    // struct contents...
}
```
6. Which will expand to this:

```swift
import Singleton

struct MyStruct {

    static let shared = MyStruct()

    private init() {
    }
}
```

