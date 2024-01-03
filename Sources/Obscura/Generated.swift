// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI
import DylKit



extension MakeableImageView {
    public func make(isRunning: Bool, showEditControls: Bool, scope: Scope, onContentUpdate: @escaping (any MakeableView) -> Void, onRuntimeUpdate: @escaping (@escaping Block) -> Void, error: Binding<VariableValueError?>) -> AnyView {
        MakeableImageViewView(isRunning: isRunning, showEditControls: showEditControls, scope: scope, imageView: self, onContentUpdate: onContentUpdate, onRuntimeUpdate: onRuntimeUpdate, error: error).any
    }
}











// GetSystemImageStep

extension GetSystemImageStep: Copying {
    public func copy() -> GetSystemImageStep {
        return GetSystemImageStep(
                    image: image.copy()
        )
    }
}

extension GetSystemImageStep {
     public enum Properties: String, ViewProperty, CaseIterable {
        case image
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .image: return GetSystemImageStep.defaultValue(for: .image)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            image: factory(.image) as! SystemImageValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            image: Properties.image.defaultValue as! SystemImageValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .image: return image
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .image: self.image = value as! SystemImageValue
        }
    }
}

extension VariableType {
    public static var getSystemImageStep: VariableType { .init(title: "GetSystemImageStep") } // GetSystemImageStep
}

extension GetSystemImageStep {
    enum CodingKeys: String, CodingKey {
        case image
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            image: (try? valueContainer.decode(SystemImageValue.self, forKey: .image)) ?? Properties.image.defaultValue as! SystemImageValue
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(image, forKey: .image)
    }
}

// ImageValue

extension ImageValue: Copying {
    public func copy() -> ImageValue {
        return ImageValue(
                    value: value,
                    size: size
        )
    }
}


extension VariableType {
    public static var image: VariableType { .init(title: "Image") } // ImageValue
}

extension ImageValue {
    enum CodingKeys: String, CodingKey {
        case value
        case size
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(CodableImage.self, forKey: .value)) ?? Self.makeDefault().value,
            size: (try? valueContainer.decode(IntValue.self, forKey: .size)) ?? Self.makeDefault().size
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(size, forKey: .size)
    }
}

// MakeableImageView

extension MakeableImageView: Copying {
    public func copy() -> MakeableImageView {
        return MakeableImageView(
                    id: id,
                    base: base,
                    image: image,
                    tint: tint
        )
    }
}

extension MakeableImageView {
     public enum Properties: String, ViewProperty, CaseIterable {
        case base
        case image
        case tint
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .base: return MakeableImageView.defaultValue(for: .base)
            case .image: return MakeableImageView.defaultValue(for: .image)
            case .tint: return MakeableImageView.defaultValue(for: .tint)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            id: UUID(),
            base: factory(.base) as! MakeableBase,
            image: factory(.image) as! TypedValue<ImageValue>,
            tint: factory(.tint) as! TypedValue<ColorValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            id: UUID(),
            base: Properties.base.defaultValue as! MakeableBase,
            image: Properties.image.defaultValue as! TypedValue<ImageValue>,
            tint: Properties.tint.defaultValue as! TypedValue<ColorValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .base: return base
            case .image: return image
            case .tint: return tint
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .base: self.base = value as! MakeableBase
            case .image: self.image = value as! TypedValue<ImageValue>
            case .tint: self.tint = value as! TypedValue<ColorValue>
        }
    }
}

extension VariableType {
    public static var imageView: VariableType { .init(title: "ImageView") } // MakeableImageView
}

extension MakeableImageView {
    enum CodingKeys: String, CodingKey {
        case id
        case base
        case image
        case tint
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: (try? valueContainer.decode(UUID.self, forKey: .id)) ?? UUID(),
            base: (try? valueContainer.decode(MakeableBase.self, forKey: .base)) ?? Properties.base.defaultValue as! MakeableBase,
            image: (try? valueContainer.decode(TypedValue<ImageValue>.self, forKey: .image)) ?? Properties.image.defaultValue as! TypedValue<ImageValue>,
            tint: (try? valueContainer.decode(TypedValue<ColorValue>.self, forKey: .tint)) ?? Properties.tint.defaultValue as! TypedValue<ColorValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(base, forKey: .base)
        try container.encode(image, forKey: .image)
        try container.encode(tint, forKey: .tint)
    }
}

// SystemImageValue

extension SystemImageValue: Copying {
    public func copy() -> SystemImageValue {
        return SystemImageValue(
                    name: name,
                    size: size
        )
    }
}

extension SystemImageValue {
     public enum Properties: String, ViewProperty, CaseIterable {
        case name
        case size
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .name: return SystemImageValue.defaultValue(for: .name)
            case .size: return SystemImageValue.defaultValue(for: .size)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            name: factory(.name) as! StringValue,
            size: factory(.size) as! IntValue
        )
    }

    public static func makeDefault() -> Self {
        .init(
            name: Properties.name.defaultValue as! StringValue,
            size: Properties.size.defaultValue as! IntValue
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .name: return name
            case .size: return size
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .name: self.name = value as! StringValue
            case .size: self.size = value as! IntValue
        }
    }
}

extension VariableType {
    public static var systemImage: VariableType { .init(title: "SystemImage") } // SystemImageValue
}

extension SystemImageValue {
    enum CodingKeys: String, CodingKey {
        case name
        case size
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            name: (try? valueContainer.decode(StringValue.self, forKey: .name)) ?? Properties.name.defaultValue as! StringValue,
            size: (try? valueContainer.decode(IntValue.self, forKey: .size)) ?? Properties.size.defaultValue as! IntValue
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(size, forKey: .size)
    }
}














import Armstrong
import DylKit



public class Obscura: AAProvider {
    public static var steps: [any StepType.Type] {
    [
        GetSystemImageStep.self
    ]
    }
    public static var values: [any EditableVariableValue.Type] {
    [
    GetSystemImageStep.self,
    ImageValue.self,
    MakeableImageView.self,
    SystemImageValue.self,
    ]
    }
    public static var views: [any MakeableView.Type] {
    [
    MakeableImageView.self
    ]
    }
}



