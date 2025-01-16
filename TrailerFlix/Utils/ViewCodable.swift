//
//  ViewCodable.swift
//  TrailerFlix
//
//  Created by Michelli Cristina de Paulo Lima on 16/01/25.
//

import Foundation


protocol ViewCodable {
    func buildHierarchy()
    func setupConstraints()
    func configureView()
    func setupView()
}

extension ViewCodable {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        configureView()
    }
    func configureView() { }
}
