//
//  EditorViewController.swift
//  MemeMe
//
//  Created by Maria  on 6/26/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

protocol EditorViewControllerDelegate {
    func savedMeme(meme: Meme)
}


class EditorViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var chooseImageLabel: UILabel!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    @IBOutlet weak var albumButton: UIBarButtonItem!
    
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var topTextField: UITextField!
    
    var memedImage: UIImage?
    
    var delegate: EditorViewControllerDelegate?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(EditorViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(EditorViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    /*
     Code Reference : https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift
     */
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            print(self.topTextField.isFirstResponder)
            if self.bottomTextField.isFirstResponder && self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Presents an image picker with the given sourceType.
    func chooseSourceType(sourceType: UIImagePickerControllerSourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = sourceType
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func openCamera(_ sender: Any) {
        
        chooseSourceType(sourceType: .camera)
    }
    
    @IBAction func openAlbum(_ sender: Any) {
        chooseSourceType(sourceType: .photoLibrary)
    }
    
    // Clears the image and text, unhides label and dismisses keyboard
    @IBAction func cancel(_ sender: Any) {
        dismissKeyboard()
        imageView.image = nil
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        chooseImageLabel.isHidden = false
        
        dismiss(animated: true, completion: nil)

    }
    
    func dismissKeyboard() {
        topTextField.resignFirstResponder()
        bottomTextField.resignFirstResponder()
    }
    
    // Creates Meme image and launches Apple's stock Activity view
    @IBAction func share(_ sender: Any) {
        
        dismissKeyboard()
        generateMemedImage()
        
        guard let image = memedImage else {
            return
        }
        
        let imageToShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.save()
        
        activityViewController.completionWithItemsHandler = { (activityType: UIActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
            if completed == true {
                self.save()
            }
        }
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    // Generats the image with top and bottom text by rendering the view.
    func generateMemedImage() {
        UIGraphicsBeginImageContext(self.secondView.bounds.size)
        secondView.drawHierarchy(in: self.secondView.bounds, afterScreenUpdates: true)
        memedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    //Save Memes - To be implemented in Meme 2.0
    func save() {
        let meme = Meme(topText: topTextField.text, bottomText: bottomTextField.text, originalImage: imageView.image!, memedImage: memedImage!)
        self.delegate?.savedMeme(meme: meme)
        dismiss(animated: true, completion: nil)
        
    }
}

// UIImagePickerControllerDelegate Methods
extension EditorViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        chooseImageLabel.isHidden = true
    }
    
}

// UITextFieldDelegate Methods
extension EditorViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.text = nil
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == topTextField {
            bottomTextField.becomeFirstResponder()
        } else {
            bottomTextField.resignFirstResponder()
        }
        return true
    }
    
}
