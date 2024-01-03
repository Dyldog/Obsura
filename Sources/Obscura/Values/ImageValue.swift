//
//  File.swift
//  
//
//  Created by Dylan Elliott on 3/1/2024.
//

import SwiftUI
import Armstrong
import DylKit

public final class ImageValue: EditableVariableValue {
    
    public static let categories: [ValueCategory] = [.visual]
    public static var type: VariableType { .image }
    
    public var protoString: String { "{ IMAGE }" }
    public var valueString: String { "{ IMAGE }"}
    
    public var value: CodableImage
    public var size: IntValue
    
    public var imageValue: UIImage {
        get { value.image }
        set { value = .init(image: newValue) }
    }
    
    public init(value: CodableImage, size: IntValue) {
        self.value = value
        self.size = size
    }
    
    public init(value: UIImage, size: Int? = nil) {
        self.value = .init(image: value)
        self.size = size.map { .int($0) } ?? Self.makeDefault().size
    }
    
    public static func makeDefault() -> ImageValue {
        .init(
            value: .init(image: UIImage(systemName: "star")!),
            size: .int(24)
        )
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.image, "add")
    }
    
    public func editView(scope: Scope, title: String, onUpdate: @escaping (ImageValue) -> Void) -> AnyView {
        Image(uiImage: imageValue).any
    }
    
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        self
    }
}

extension ImageValue: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}

