//
//  ElixrTalentConnectTests.swift
//  ElixrTalentConnectTests
//
//  Created by Shemil Tom on 10/01/24.
//

import XCTest
@testable import ElixrTalentConnect

final class ElixrTalentConnectTests: XCTestCase {

   // Optional instance of LoginViewModel.
    var viewModel: LoginViewModel?
    
    //Called before each test
    override func setUp() {
        viewModel = LoginViewModel()
    }

    //Called after each test
    override func tearDown() {
        viewModel = nil
    }
    
    // To test the Login Validations.
    func testValidateCredentials() throws {
        //Invalid email
        var model = LoginModel(email: "invalidEmail", password: "validPassword")
        let viewModel = try XCTUnwrap(viewModel)
        var validationResult = viewModel.validateCredentials(model: model)
        XCTAssertFalse(validationResult.isValid, "validation result should not be false")
        //Invalid passwoord
        model = LoginModel(email: "validEmail@example.com", password: "pass")
        validationResult = viewModel.validateCredentials(model: model)
        XCTAssertFalse(validationResult.isValid, "validation result should not be false")
        //Valid details
        model = LoginModel(email: "validEmail@example.com", password: "passsword1234")
        validationResult = viewModel.validateCredentials(model: model)
        XCTAssertTrue(validationResult.isValid, "validation result should not be false")
    }

}
