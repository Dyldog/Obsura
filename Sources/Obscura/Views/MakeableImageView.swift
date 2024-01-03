//
//  File.swift
//  
//
//  Created by Dylan Elliott on 3/1/2024.
//

import Armstrong
import Foundation
import DylKit
import SwiftUI

public final class MakeableImageView: MakeableView, Codable {
    public static let categories: [ValueCategory] = [.views]
    public static var type: VariableType { .imageView }
    
    public let id: UUID
    
    @Published public var base: MakeableBase
    @Published public var image: TypedValue<ImageValue>
    @Published public var tint: TypedValue<ColorValue>
    
    public var protoString: String { "IMAGE(\(image.protoString))" }
    public var valueString: String { image.valueString }
    
    public init(id: UUID, base: MakeableBase = .makeDefault(), image: TypedValue<ImageValue>, tint: TypedValue<ColorValue> = .value(.init(value: .black))) {
        self.id = id
        self.base = base
        self.image = image
        self.tint = tint
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        try MakeableImageView(
            id: id,
            base: base.value(with: variables, and: scope),
            image: image.value(with: variables, and: scope),
            tint: tint.value(with: variables, and: scope)
        )
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .base: return MakeableBase.makeDefault()
        case .image: return ImageValue.makeDefault().typed
        case .tint: return ColorValue(value: .black).typed
        }
    }
    
    public func insertValues(into variables: Variables, with scope: Scope) throws {
        //
    }
}

extension MakeableImageView: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
//        """
//        Button {
//            \(action.body.map { "\t" + $0.codeRepresentation }.joined(separator: "\n"))
//        } label: {
//            \(title.codeRepresentation)
//        }
//        .buttonStyle(\(style.codeRepresentation))
//        """
    }
}

struct MakeableImageViewView: View {
    let isRunning: Bool
    let showEditControls: Bool
    let scope: Scope
    let imageView: MakeableImageView
    let onContentUpdate: (MakeableImageView) -> Void
    let onRuntimeUpdate: (@escaping Block) -> Void
    @EnvironmentObject var variables: Variables
    @Binding var error: VariableValueError?
    @State var text: String = "LOADING"
    
    private var content: some View {
        
        do {
            let variables = variables.copy()
            let image: ImageValue = try imageView.image.value(with: variables, and: scope)
            let color: ColorValue = try imageView.tint.value(with: variables, and: scope)
            let size: IntValue = try image.size.value(with: variables, and: scope)
            return Image(uiImage: image.imageValue)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: CGFloat(size.value))
                .foregroundStyle(color.value)
                .base((try imageView.base.value(with: variables, and: scope) as MakeableBase))
                .any
        } catch {
            handleError(error)
            return Text("ERROR").any
        }
    }
    var body: some View {
        VStack {
            if isRunning {
                content
                    .any
            } else {
                Text(imageView.protoString)
                    .any
            }
        }
    }
    
    private func handleError(_ error: Error) {
        if let error = error as? VariableValueError {
            self.error = error
        } else {
            print(error.localizedDescription)
        }
    }
}
