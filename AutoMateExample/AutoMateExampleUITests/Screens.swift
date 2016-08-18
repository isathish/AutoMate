//
//  Screens.swift
//  AutoMateExample
//
//  Created by Pawel Szot on 18/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest

protocol TableElement {
    var title: String { get }
    init(app: XCUIApplication)
}

extension TableElement {
    static func open(inside app: XCUIApplication) -> Self {
        let element = Self(app: app)
        app.staticTexts[element.title].tap()
        return element
    }
}

struct ScrollViewScreen: TableElement {
    let title = "Scroll view"
    let buttonTop: XCUIElement
    let buttonMiddle1: XCUIElement
    let buttonMiddle2: XCUIElement
    let buttonBottom: XCUIElement
    let textField: XCUIElement
    let scrollView: XCUIElement

    init(app: XCUIApplication) {
        buttonTop = app.buttons["ButtonTop"]
        buttonMiddle1 = app.buttons["ButtonMiddle1"]
        buttonMiddle2 = app.buttons["ButtonMiddle2"]
        buttonBottom = app.buttons["ButtonBottom"]
        textField = app.textFields.element
        scrollView = app.scrollViews.element
    }
}

struct TextInputScreen: TableElement {
    let title = "Text input"
    let textField: XCUIElement

    init(app: XCUIApplication) {
        textField = app.textFields.element
    }
}

struct LocationScreen: TableElement {
    let title = "Location"
    let deniedLabel: XCUIElement

    init(app: XCUIApplication) {
        deniedLabel = app.staticTexts["Denied"]
    }
}

struct MiddleButtonScreen: TableElement {
    let title = "Middle button"
    let label: XCUIElement
    let button: XCUIElement

    init(app: XCUIApplication) {
        label = app.staticTexts["Pressed"]
        button = app.buttons.element
    }
}
