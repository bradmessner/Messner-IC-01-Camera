//
//  ViewController.swift
//  Messner IC 01 Camera
//
//  Created by Brad D. Messner on 4/14/20.
//  Copyright © 2020 Brad D. Messner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker: UIImagePickerController!
    var imagePickerController : UIImagePickerController!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Use Camera
    
    
    @IBAction func takePic(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
    }
    

    
    
    
    
    
    
    // Save Picture
    
    
    @IBAction func savePic(_ sender: Any) {
        //guard let image = imageView.image else { return }

        UIImageWriteToSavedPhotosAlbum(imageView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    
    
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        
        
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Open from Camera Roll / Library
    
    @IBAction func openPic(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

