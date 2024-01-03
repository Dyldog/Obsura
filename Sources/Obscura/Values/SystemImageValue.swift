//
//  File.swift
//  
//
//  Created by Dylan Elliott on 3/1/2024.
//

import UIKit
import Armstrong
import SwiftUI
import SFBrowser
import DylKit

public final class SystemImageValue: CompositeEditableVariableValue {
    
    public static let categories: [ValueCategory] = []
    public static var type: VariableType { .systemImage }
    
    
    public var name: StringValue
    public var size: IntValue
    
    public init(name: StringValue, size: IntValue) {
        self.name = name
        self.size = size
    }
    
    public static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .name: return StringValue(value: "star")
        case .size: return IntValue(value: 24)
        }
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    
    public var protoString: String { "\(name.protoString)" }
    public var valueString: String { "\(name.valueString)" }
    
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        self
    }
}

extension SystemImageValue: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}

extension SystemImageValue {
    public func editView(scope: Scope, title: String, onUpdate: @escaping (SystemImageValue) -> Void) -> AnyView {
        return VStack {
            HStack {
                Text(title.capitalized).bold().scope(scope)
                Spacer()
                SystemImagePickerButton(value: self, onSelect: {
                    self.name = $0.name
                    onUpdate(self)
                }).scope(scope)
            }
            
            size.editView(scope: scope, title: "Size") { [weak self] in
                guard let self else { return }
                self.size = $0
                onUpdate(self)
            }
        }
        .any
    }
}

struct SystemImagePickerButton: View {
    @State var showView: Bool = false
    let value: SystemImageValue
    let onSelect: (SystemImageValue) -> Void
    
    var body: some View {
        SheetButton(showSheet: $showView) {
            VStack(spacing: 0) {
                if let image = UIImage(systemName: value.name.value) {
                    Image(uiImage: image).renderingMode(.template)
                }
                Text(value.name.value)
            }
        } content: {
            SymbolList {
                onSelect(.init(name: .init(value: $0.name), size: value.size))
                showView = false
            }
        }

    }
}
