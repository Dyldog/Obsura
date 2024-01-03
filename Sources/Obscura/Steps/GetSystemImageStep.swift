//
//  File.swift
//  
//
//  Created by Dylan Elliott on 3/1/2024.
//

import SwiftUI
import Armstrong

public final class GetSystemImageStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.visualSteps]
    public static var type: VariableType { .getSystemImageStep }
    public static var title: String { "Get system image" }
    public var image: SystemImageValue
    
    public var protoString: String { "$IMAGE(named: \(image.protoString))" }
    public var valueString: String { "$IMAGE(named: \(image.valueString))" }
    
    public init(image: SystemImageValue) {
        self.image = image
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .image: return SystemImageValue.makeDefault()
        }
    }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let name = try image.name.value(with: variables, and: scope)
        let size: IntValue = try image.size.value(with: variables, and: scope)
        guard
            let image = UIImage(
                systemName: name.valueString,
                withConfiguration: UIImage.SymbolConfiguration(pointSize: CGFloat(size.value))
            )
        else { throw VariableValueError.wrongTypeForOperation }
        
        return ImageValue(
            value: .init(image: image),
            size: try self.image.size.value(with: variables, and: scope)
        )
    }
}

extension GetSystemImageStep: CodeRepresentable {
    public var codeRepresentation: String {
        "UIImage(systemName: \(image.codeRepresentation))"
    }
}
