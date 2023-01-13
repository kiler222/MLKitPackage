

public struct MLKitPackage {
    public private(set) var text = "Hello, World!"

    public init(name: String) {
        print("print \(name) from the package")
    }
}
