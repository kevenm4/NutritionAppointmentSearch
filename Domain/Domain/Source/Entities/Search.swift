public struct Search: Decodable {
    public var professionals: [Professional]

    public init(
        professionals: [Professional]
    ) {
        self.professionals = professionals
    }
}
