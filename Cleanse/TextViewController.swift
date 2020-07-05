//
//  TextViewController.swift
//  Cleanse
//
//  Created by Alek Matthiessen on 10/27/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit

var selectedheadline = String()
var dateformat = String()
var randomString = String()


class TextViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bookcover: UIImageView!
    @IBOutlet weak var authorlabel: UILabel!
    @IBOutlet weak var titlelabel: UILabel!
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        textView.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        textView.resignFirstResponder()
    }
    
    @IBAction func tapBack(_ sender: Any) {
        
        //        lastcount()
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.textView.endEditing(true)
        
        
        
    }
    
    var arrayCount = Int()
    @IBOutlet weak var totaltime: UILabel!
    
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var text: UILabel!
    
    func nextcount() {
        
        textView.text = ""
        textView.textColor = UIColor.black
        
        if counter > headlines.count-2 {
            
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            
            
            
            
            self.dismiss(animated: true, completion: nil)
            
        } else {
            
                        counter += 1
            
            
            
            showpropersummaries()
            //            textView.slideInFromRight()
            //            text.slideInFromRight()
        }
        
    }
    //
    //    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    //         if(text == "\n") {
    //             textView.resignFirstResponder()
    //             return false
    //         }
    //         return true
    //     }
    
    /* Older versions of Swift */
    //     func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
    //         if(text == "\n") {
    //             textView.resignFirstResponder()
    //             return false
    //         }
    //         return true
    //     }
    
    @IBAction func tapDismiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var authorftile: UILabel!
    @IBOutlet weak var titleoftile: UILabel!
    
//    @objc func updateprogress() {
//
//        counter += 1
//
//        let progress = (Float(counter)/Float(900))
//
//        self.progressView.setProgress(Float(progress), animated: true)
//
////        titleoftile.text = String(counter)
//        totaltime.text = "900"
//
//    }
    
    @IBOutlet weak var backimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 0
        arrayCount = headlines.count
        
        //        textView.returnKeyType = UIReturnKeyType.done
        
        progressView.layer.cornerRadius = 5.0
        progressView.clipsToBounds = true
        
        textView.layer.cornerRadius = 5.0
        textView.clipsToBounds = true
        
        var transform : CGAffineTransform = CGAffineTransform(scaleX: 1.0, y: 3.0)
        progressView.transform = transform
        
        textView.delegate = self
        
        textView.text = ""
        textView.textColor = UIColor.black
        
        textView.becomeFirstResponder()
        
        tapsave.layer.cornerRadius = 5.0
        tapsave.clipsToBounds = true
        
        
        
        if headlines.count > 1 {
            
            progressView.alpha = 1
            
            text.text = headlines[counter]
            
        } else {
            
            
            
            progressView.alpha = 0
            text.text = selectedheadline
            
        }
        
        let imageURLString = selectedbackground
        
        let  imageUrl = URL(string: imageURLString)
        
                titleoftile.text = selectedtitle
        
//        titleoftile.text = "00:01"
        
        
        if textone != "" {
            
            textView.text = textone
        } else {
            
            textView.text = ""
            
        }
        
        newText = textView.text
        
//        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateprogress), userInfo: nil, repeats: true)
        
        
        //        if newText.count < 240 {
        //
        //                 tapsave.alpha = 0.5
        //                 tapsave.isUserInteractionEnabled = false
        //            characterslabel.alpha = 1
        //             } else {
        //
        //                 tapsave.alpha = 1
        //                 tapsave.isUserInteractionEnabled = true
        //                characterslabel.alpha = 0
        //             }
        //
        
        // Do any additional setup after loading the view.
    }
    
    
    func lastcount() {
        
        if counter == 0 {
            
            self.dismiss(animated: true, completion: nil)
            
        } else {
            
            counter -= 1
            showpropersummaries()
            //
            //             textView.slideInFromLeft()
            //             text.slideInFromLeft()
            
        }
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        textone = ""
        texttwo = ""
        textthree = ""
    }
    
    func showpropersummaries() {
        
        if counter == 0 {
            
                        self.progressView.setProgress(0.0, animated: false)
            
        } else {
                        let progress = (Float(counter)/Float(arrayCount-1))
                        self.progressView.setProgress(Float(progress), animated: true)
        }
        
        if counter < headlines.count {
            
            if counter == 0 {
                
                if textone != "" {
                    
                    textView.text = textone
                    
                } else {
                    
                    textView.text = ""
                    
                }
            }
            
            if counter == 1 {
                
                if texttwo != "" {
                    
                    textView.text = texttwo
                } else {
                    
                    textView.text = ""
                    
                }
            }
            
            if counter == 2 {
                
                if textthree != "" {
                    
                    textView.text = textthree
                } else {
                    
                    textView.text = ""
                    
                }
            }
            
            text.text = headlines[counter]
            
            
            print(counter)
            
        }
    }
    
    @IBOutlet weak var characterslabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    var newText = String()
    
    func textViewDidChange(_ textView: UITextView) {
        
        //        newText = textView.text
        //
        //        let myint = 240-newText.count
        //
        //        characterslabel.text = "\(myint)"
        //
        //        if newText.count < 240 {
        //
        //            tapsave.alpha = 0.5
        //            tapsave.isUserInteractionEnabled = false
        //            characterslabel.alpha = 1
        //        } else {
        //
        //            tapsave.alpha = 1
        //            tapsave.isUserInteractionEnabled = true
        //            characterslabel.alpha = 0
        //        }
    }
    
    func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(TextViewController.dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.textView.inputAccessoryView = keyboardToolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var tapsave: UIButton!
    @IBAction func tapContinue(_ sender: Any) {
        
        
        
        if textView.text != "" {
            
            if headlines.count == 1 {
                
                ref?.child("Entries").child(uid).child(selectedbookid).removeValue()
                
                ref?.child("Entries").child(uid).childByAutoId().updateChildValues(["Author" : selectedauthorname, "Name" : selectedtitle, "Headline1" : headlines[0], "Author Image" : selectedauthorimage, "Image" : selectedbackground, "Text\(counter)" : textView.text!, "Date" : dateformat])
                
                ref?.child("Favorites").child(uid).child(selectedbookid).updateChildValues([ "Name" : selectedtitle, "Headline1" : headlines[0], "Image" : selectedbackground])
                
                
            }
            
            if headlines.count == 2 {
                
                ref?.child("Entries").child(uid).child(selectedbookid).removeValue()
                
                ref?.child("Entries").child(uid).childByAutoId().updateChildValues(["Author" : selectedauthorname, "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Author Image" : selectedauthorimage, "Image" : selectedbackground, "Text\(counter)" : textView.text!, "Date" : dateformat])
                
                ref?.child("Favorites").child(uid).child(selectedbookid).updateChildValues([ "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Image" : selectedbackground])
                
                
            }
            
            
            if headlines.count == 3 {
                
                
                
                ref?.child("Entries").child(uid).child(randomString).updateChildValues(["Author" : selectedauthorname, "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2], "Author Image" : selectedauthorimage, "Image" : selectedbackground, "Text\(counter)" : textView.text!, "Date" : dateformat])
                
                ref?.child("Favorites").child(uid).child(selectedbookid).updateChildValues([ "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2], "Image" : selectedbackground])
                
                
            }
            
            if headlines.count == 4 {
                
                
                
                ref?.child("Entries").child(uid).child(randomString).updateChildValues(["Author" : selectedauthorname, "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2],"Headline4" : headlines[3], "Author Image" : selectedauthorimage, "Image" : selectedbackground, "Text\(counter)" : textView.text!, "Date" : dateformat])
                
                ref?.child("Favorites").child(uid).child(selectedbookid).updateChildValues([ "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2], "Headline4" : headlines[3], "Image" : selectedbackground])
                
                
            }
            
            if headlines.count == 5 {
                
                
                
                ref?.child("Entries").child(uid).child(randomString).updateChildValues(["Author" : selectedauthorname, "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2],"Headline4" : headlines[3],"Headline5" : headlines[4], "Author Image" : selectedauthorimage, "Image" : selectedbackground, "Text\(counter)" : textView.text!, "Date" : dateformat])
                
                ref?.child("Favorites").child(uid).child(selectedbookid).updateChildValues([ "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2], "Headline4" : headlines[3], "Headline5" : headlines[4], "Image" : selectedbackground])
                
                
            }
            
            if headlines.count == 6 {
                
                
                
                ref?.child("Entries").child(uid).child(randomString).updateChildValues(["Author" : selectedauthorname, "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2],"Headline4" : headlines[3],"Headline5" : headlines[4],"Headline6" : headlines[5], "Author Image" : selectedauthorimage, "Image" : selectedbackground, "Text\(counter)" : textView.text!, "Date" : dateformat])
                
                ref?.child("Favorites").child(uid).child(selectedbookid).updateChildValues([ "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2], "Headline4" : headlines[3], "Headline5" : headlines[4], "Headline6" : headlines[5], "Image" : selectedbackground])
                
                
            }
            
            if headlines.count == 7 {
                
                
                
                ref?.child("Entries").child(uid).child(randomString).updateChildValues(["Author" : selectedauthorname, "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2],"Headline4" : headlines[3],"Headline5" : headlines[4],"Headline6" : headlines[5],"Headline7" : headlines[6], "Author Image" : selectedauthorimage, "Image" : selectedbackground, "Text\(counter)" : textView.text!, "Date" : dateformat])
                
                ref?.child("Favorites").child(uid).child(selectedbookid).updateChildValues([ "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2], "Headline4" : headlines[3], "Headline5" : headlines[4], "Headline6" : headlines[5], "Headline7" : headlines[6], "Image" : selectedbackground])
                
                
            }
            
            if headlines.count == 8 {
                
                
                
                ref?.child("Entries").child(uid).child(randomString).updateChildValues(["Author" : selectedauthorname, "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2],"Headline4" : headlines[3],"Headline5" : headlines[4],"Headline6" : headlines[5],"Headline7" : headlines[6],"Headline8" : headlines[7], "Author Image" : selectedauthorimage, "Image" : selectedbackground, "Text\(counter)" : textView.text!, "Date" : dateformat])
                
                ref?.child("Favorites").child(uid).child(selectedbookid).updateChildValues([ "Name" : selectedtitle, "Headline1" : headlines[0], "Headline2" : headlines[1], "Headline3" : headlines[2], "Headline4" : headlines[3], "Headline5" : headlines[4], "Headline6" : headlines[5], "Headline7" : headlines[6], "Headline8" : headlines[7], "Image" : selectedbackground])
                
                
            }
            
            nextcount()
            
        } else {
            
            nextcount()
            
        }
        
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write here..."
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
