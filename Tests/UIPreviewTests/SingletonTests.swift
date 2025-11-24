import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(SingletonMacros)
import SingletonMacros


let testMacros: [String: Macro.Type] = [
    "Singleton": SingletonMacro.self
]


final class SingletonTests: XCTestCase {

	func testFinalSingletonClass() throws {
        assertMacroExpansion(
            """
            @Singleton
            final class MyClass {
            }
            """,
            expandedSource:
            """

            final class MyClass {

                static let shared = MyClass()

                private init() {
                }
            }
            """,
            macros: testMacros
        )
    }


	func testSingletonClass() throws {
		assertMacroExpansion(
			"""
			@Singleton
			class MyClass {
			}
			""",
			expandedSource:
            """

            class MyClass {

                static let shared = MyClass()

                private init() {
                }
            }
            """,
			macros: testMacros
		)
	}

	
	func testPublicSingletonClass() throws {
		assertMacroExpansion(
			"""
			@Singleton
			public class MyClass {
			}
			""",
			expandedSource:
            """

            public class MyClass {

                static let shared = MyClass()

                private init() {
                }
            }
            """,
			macros: testMacros
		)
	}


	func testPublicFinalSingletonClass() throws {
		assertMacroExpansion(
			"""
			@Singleton
			public final class MyClass {
			}
			""",
			expandedSource:
            """

            public final class MyClass {

                static let shared = MyClass()

                private init() {
                }
            }
            """,
			macros: testMacros
		)
	}


	func testSingletonStruct() throws {
		assertMacroExpansion(
			"""
			@Singleton
			struct MyStruct {
			}
			""",
			expandedSource:
            """

            struct MyStruct {

                static let shared = MyStruct()

                private init() {
                }
            }
            """,
			macros: testMacros
		)
	}


	func testPublicSingletonStruct() throws {
		assertMacroExpansion(
			"""
			@Singleton
			public struct MyStruct {
			}
			""",
			expandedSource:
            """

            public struct MyStruct {

                static let shared = MyStruct()

                private init() {
                }
            }
            """,
			macros: testMacros
		)
	}


	func testFinalSingletonActor() throws {
		assertMacroExpansion(
			"""
			@Singleton
			final actor MyActor {
			}
			""",
			expandedSource:
			"""

            final actor MyActor {

                static let shared = MyActor()

                private init() {
                }
            }
            """,
			macros: testMacros
		)
	}


	func testSingletonActor() throws {
		assertMacroExpansion(
			"""
			@Singleton
			actor MyActor {
			}
			""",
			expandedSource:
            """

            actor MyActor {

                static let shared = MyActor()

                private init() {
                }
            }
            """,
			macros: testMacros
		)
	}

	
	func testPublicFinalSingletonActor() throws {
		assertMacroExpansion(
			"""
			@Singleton
			public final actor MyActor {
			}
			""",
			expandedSource:
            """

            public final actor MyActor {

                static let shared = MyActor()

                private init() {
                }
            }
            """,
			macros: testMacros
		)
	}
	
	func testPublicSingletonActor() throws {
		assertMacroExpansion(
			"""
			@Singleton
			public actor MyActor {
			}
			""",
			expandedSource:
            """

            public actor MyActor {

                static let shared = MyActor()

                private init() {
                }
            }
            """,
			macros: testMacros
		)
	}


	func testClassFunction() throws {
		
	}
}

#endif
