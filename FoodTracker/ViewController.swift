//
//  ViewController.swift
//  FoodTracker
//
//  Created by RasB on 2021-04-08.
//  Copyright © 2021 Mykal Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: Actions
    @IBOutlet weak var setDefaultLabelText: UIButton!

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hides keyboard.
        nameTextField.resignFirstResponder()
        // lets user pick image from photo library
        let imagePickerController = UIImagePickerController()
        // only allows photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        // makes sure ViewController is notified when the user has picked an image
        imagePickerController.delegate = self
        present(imagePickerController,animated: true, completion: nil)
    }
    
    //MARK: UIImageControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismisses picker if user clicks cancel
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following \(info)")
        }
        photoImageView.image = selectedImage
        // Dismiss
        dismiss(animated: true, completion: nil)
    }
}

