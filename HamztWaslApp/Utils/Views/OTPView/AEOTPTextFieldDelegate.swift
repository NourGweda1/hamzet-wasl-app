//
//  AEOTPTextFieldDelegate.swift
//  HamztWaslApp
//
//  Created by Nour Gweda on 22/02/2025.
//

public protocol AEOTPTextFieldDelegate: AnyObject {
    func didUserFinishEnter(the code: String)
}
