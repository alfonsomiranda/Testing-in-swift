//
//  TestingBasicTests.swift
//  TestingBasicTests
//
//  Created by Alfonso Miranda Castro on 28/09/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import XCTest
@testable import TestingBasic

class TestingBasicTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_viewController_titleLabel_is_welcome() {
        let viewController = ViewController()
        
        XCTAssertEqual(viewController.titleLabel.text!, "Welcome")
    }
    
    func test_viewController_nameLabel_is_Alfonso() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard
            .instantiateViewController(withIdentifier: "viewController") as! ViewController
        viewController.beginAppearanceTransition(true, animated: false)
        XCTAssertEqual(viewController.nameLabel.text!, "Alfonso")
        viewController.endAppearanceTransition()
    }

    func test_viewController_compose_name_label() {
        //GIVEN
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard
            .instantiateViewController(withIdentifier: "viewController") as! ViewController
        
        viewController.beginAppearanceTransition(true, animated: false)
        //WHEN
        viewController.nameTextField.text = "alfonso"
        viewController.lastNmeTextField.text = "miranda"
        viewController.composeButton.sendActions(for: .touchUpInside)
        //THEN
        XCTAssertEqual("Alfonso Miranda", viewController.nameLabel.text!)
        viewController.endAppearanceTransition()
    }
}
