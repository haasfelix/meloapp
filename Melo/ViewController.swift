//
//  ViewController.swift
//  Dicee
//
//  Created by Felix Haas on 23.11.17.
//  Copyright © 2017 Felix Haas. All rights reserved.
//

import UIKit
import ConfettiView


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var meloIt: UIButton!
    @IBOutlet weak var pressBtn: UILabel!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var pressBtnText: UILabel!
    @IBOutlet weak var meloLogoSmall: UILabel!
    @IBOutlet weak var addFriendsBtn: UIImageView!
    @IBOutlet weak var resetbtn: UIImageView!
    
    
    @IBOutlet weak var meloItBorder: UIImageView!
    var diceArray: [UIImage] = []
    
    let funArray = ["Take a shot.", "Pick someone to take a shot.", "Finish your drink!", "Dance around the room singing a song.", "Take a shot.", "Do your best Batman impression.", "Take a shot.", "Act like a monkey.", "MELO waterfall", "Person next to you has to drink", "make a crazy drink mixture and chug it", "MELO TIME: Everyone has to drink.", "Refill everyones drinks", "Drink n repeat", "Propose to the whisky bottle", "Stand on one leg for 3 mins", "Stand in the corner and be quiet for 3 mins", "Take a shot.", "Pick someone to take a shot.", "Finish your drink!", "Take a shot.", "Take a shot.", "Act like a monkey.", "Text someone using only your nose.", "Let someone tickle you for 20 seconds.", "Talk and act like a robot.", "Go outside and howl at the moon.", "Come up with famous people each person in your group looks like.", "Wear your t-shirt inside out.", "Try to make the person next to you laugh. You’ve got 60 seconds.", "Talk to a pillow like it’s your crush.", "Give yourself a new name.", "Just drink!", "Call a 7-Eleven and ask if they’re open.", "Get into a debate with a wall.", "Hold hands with the person next to you.", "Do 10 pushups.", "Do a handstand.", "Take 3 shots.", "Tell a joke.", "Take someone’s drink and drink out of it.", "Eat grass.", "MELO TIME: Everyone has to drink.", "Take off a piece of clothing", "Tripple Shot", "MELO TIME: Everyone has to drink.", "Let the group give you a new hairstyle.", "Talk in an accent for the next 3 rounds.", "Attempt to do a magic trick.", "Be someone’s pet for the next 5 minutes.", "Put 4 ice cubes down your pants.", "Just drink!"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    
    func realAddPhoto() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var resetFriends: UIImageView!
    
    @IBOutlet weak var addFriends: UIImageView!
    
    @IBAction func addPhoto(_ sender: Any) {
        realAddPhoto()
    }
    @IBOutlet weak var funLabelView: UILabel!
    
    @objc func addNewFriends(gesture: UIGestureRecognizer) {
        realAddPhoto()
    }
    
    @objc func resetFriendsAction(gesture: UIGestureRecognizer) {
        self.diceArray = []
        diceImageView2.image = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: 220, height: 220)
        diceImageView2.frame = frame
        diceImageView2.layer.borderWidth=1.0
        diceImageView2.layer.masksToBounds = false
        diceImageView2.layer.borderColor = UIColor.white.cgColor
        diceImageView2.layer.cornerRadius = diceImageView2.frame.size.height/2
        diceImageView2.clipsToBounds = true
        diceImageView2.layer.borderWidth = 8.0
        diceImageView2.layer.borderColor = UIColor(red: 246.0/255.0, green: 99.0/255.0, blue: 99.0/255.0, alpha: 1.0).cgColor
        diceImageView2.center.x = self.view.center.x
        diceImageView2.center.y = self.view.center.y * 0.7
        diceImageView2.contentMode = .scaleAspectFill

        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.addNewFriends(gesture:)))
        addFriends.addGestureRecognizer(tapGesture)
        addFriends.isUserInteractionEnabled = true
        
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.resetFriendsAction(gesture:)))
        resetFriends.addGestureRecognizer(tapGesture2)
        resetFriends.isUserInteractionEnabled = true
                imagePicker.delegate = self
        
        meloIt.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 250, height: 80)
        let centerOfScreenX5 = (self.view.frame.size.width * 0.5) - (meloIt.frame.width / 2)
        let centerOfScreenY5 = (self.view.frame.size.height * 0.85) - (meloIt.frame.height / 2)
        meloIt.frame = CGRect(x: centerOfScreenX5, y: centerOfScreenY5, width: 250, height: 80)
        
        meloItBorder.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 270, height: 80)
        let centerOfScreenX6 = (self.view.frame.size.width * 0.5) - (meloItBorder.frame.width / 2)
        let centerOfScreenY6 = (self.view.frame.size.height * 0.85) - (meloItBorder.frame.height / 2)
        meloItBorder.frame = CGRect(x: centerOfScreenX6, y: centerOfScreenY6, width: 270, height: 80)
        
        
        pressBtn.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 270, height: 80)
        let centerOfScreenX7 = (self.view.frame.size.width * 0.5) - (pressBtn.frame.width / 2)
        let centerOfScreenY7 = (self.view.frame.size.height * 0.93) - (pressBtn.frame.height / 2)
        pressBtn.frame = CGRect(x: centerOfScreenX7, y: centerOfScreenY7, width: 270, height: 80)
        
        
        avatarView.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 220, height: 220)
        let centerOfScreenX8 = (self.view.frame.size.width * 0.5) - (avatarView.frame.width / 2)
        let centerOfScreenY8 = (self.view.frame.size.height * 0.33) - (avatarView.frame.height / 2)
        avatarView.frame = CGRect(x: centerOfScreenX8, y: centerOfScreenY8, width: 220, height: 220)
        
        
        pressBtnText.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 196, height: 72)
        let centerOfScreenX9 = (self.view.frame.size.width * 0.5) - (pressBtnText.frame.width / 2)
        let centerOfScreenY9 = (self.view.frame.size.height * 0.62) - (pressBtnText.frame.height / 2)
        pressBtnText.frame = CGRect(x: centerOfScreenX9, y: centerOfScreenY9, width: 196, height: 72)
        
        
        meloLogoSmall.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 181, height: 52)
        let centerOfScreenX10 = (self.view.frame.size.width * 0.5) - (meloLogoSmall.frame.width / 2)
        let centerOfScreenY10 = (self.view.frame.size.height * 0.09) - (meloLogoSmall.frame.height / 2)
        meloLogoSmall.frame = CGRect(x: centerOfScreenX10, y: centerOfScreenY10, width: 181, height: 52)
    
        
        
        addFriendsBtn.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 181, height: 52)
        let centerOfScreenX11 = (self.view.frame.size.width * 0.8) - (addFriendsBtn.frame.width / 2)
        let centerOfScreenY11 = (self.view.frame.size.height * 0.09) - (addFriendsBtn.frame.height / 2)
        addFriendsBtn.frame = CGRect(x: centerOfScreenX11, y: centerOfScreenY11, width: 181, height: 52)
        
        resetbtn.frame = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 181, height: 52)
        let centerOfScreenX12 = (self.view.frame.size.width * 0.2) - (resetbtn.frame.width / 2)
        let centerOfScreenY12 = (self.view.frame.size.height * 0.09) - (resetbtn.frame.height / 2)
        resetbtn.frame = CGRect(x: centerOfScreenX12, y: centerOfScreenY12, width: 181, height: 52)
        
        
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


    }
        func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {

            diceArray.append(pickedImage)
            diceImageView2.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func changeLabel() {
        
        let randomIndex = Int(arc4random_uniform(UInt32(funArray.count)))
    
        
        
        funLabelView.text = funArray[randomIndex]
        
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
    updateDiceImage()
    changeLabel()
    }

    func updateDiceImage(){
        guard diceArray.count != 0 else {
            realAddPhoto()
            return
        }
        randomDiceIndex1 = Int(arc4random_uniform(UInt32(diceArray.count)))
        randomDiceIndex2 = Int(arc4random_uniform(UInt32(diceArray.count)))

        var superdelay = 0.0
        let randomCountThrough = Int(arc4random_uniform(UInt32(30)))
        for index in 0...randomCountThrough {
            superdelay += Double(1)
            delay(0.05 * Double(Double(index) + superdelay)) {
//                var randomDiceIndex13 = Int(arc4random_uniform(UInt32(self.diceArray.count)))
                let moduloIndex = index % self.diceArray.count
                self.changeLabel()
                guard self.diceArray.count != 0 else { return }
                self.diceImageView2.image = self.diceArray[moduloIndex]
            }

        }
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func changeText() {
        randomDiceIndex2 = Int(arc4random_uniform(UInt32(diceArray.count)))
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        updateDiceImage()
        changeLabel()
    }

}
