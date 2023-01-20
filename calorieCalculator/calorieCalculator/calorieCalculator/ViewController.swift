//
//  ViewController.swift
//  calorieCalculator
//
//  Created by Cole Rasmussen on 7/23/22.
//
//  For this app you will put in:
//  - Your gender (a button select)
//  - Your weight (a text box entry)
//  - Your height (in inches, but would be best if it was in feet and inches if possible)
//  - Your activity (from 5 possible selections:
//      - Sedentary (office job)
//      - Light exercise (1-2 days a week)
//      - Moderate exercise (3-5 days a week)
//      - Heavy exercise (6-7 days a week)
//      - Athlete (2x times per day)
//  And then a result with how many calories a day that your body burns will appear
//

import UIKit

class ViewController: UIViewController {

    // User Input
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var gain: UILabel!
    @IBOutlet weak var lose: UILabel!
    
    let cBox1 = theCheckbox(frame: CGRect(x: 70, y: 170, width: 20, height: 20))
    let cBox2 = theCheckbox(frame: CGRect(x: 160, y: 170, width: 20, height: 20)) //x: 160, x: 220
    
    // for x and y information, each box should be y + 30 from each other
    let cBoxSedentary = theCheckbox(frame: CGRect(x: 70, y: 250, width: 20, height: 20))
    let cBoxLight = theCheckbox(frame: CGRect(x: 70, y: 280, width: 20, height:20 ))
    let cBoxModerate = theCheckbox(frame: CGRect(x: 70, y: 310, width: 20, height:20 ))
    let cBoxHeavy = theCheckbox(frame: CGRect(x: 70, y: 340, width: 20, height:20 ))
    let cBoxAthlete = theCheckbox(frame: CGRect(x: 70, y: 370, width: 20, height:20 ))
    //make 5 check boxes for the activity calculator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Gender Checkboxes
        
        let mLabel = UILabel(frame: CGRect(x: 100, y: 155, width: 50, height: 50))
        mLabel.text = "Male"
        view.addSubview(mLabel)
        view.addSubview(cBox1)
        
        let fLabel = UILabel(frame: CGRect(x: 190, y: 155, width: 150, height: 50)) //x: 190, x: 250
        fLabel.text = "Female"
        view.addSubview(fLabel)
        view.addSubview(cBox2)
        
        let mGesture = UITapGestureRecognizer(target: self, action: #selector(mDidTapCheckbox)) //Male Checkbox
        cBox1.addGestureRecognizer(mGesture)
        let fGesture = UITapGestureRecognizer(target: self, action: #selector(fDidTapCheckbox)) //Female Checkbox
        cBox2.addGestureRecognizer(fGesture)
        
        //MARK: Activity Level Checkboxes
        //I was going to do what I did with the male and female label, but I found it was easier to make the labels on the storyboard
        
//        let sLabel = UILabel(frame: CGRect(x: 100, y: 235, width: 250, height: 50))
//        sLabel.text = "Sendentary (office job)"
//        view.addSubview(sLabel)
        view.addSubview(cBoxSedentary)
        
//        let lLabel = UILabel(frame: CGRect(x: 100, y: 265, width: 250, height: 50))
//        lLabel.text = "Light exercise (1-2 days a week)"
//        view.addSubview(lLabel)
        view.addSubview(cBoxLight)
        
//        let moLabel = UILabel(frame: CGRect(x: 100, y: 295, width: 250, height: 50))
//        moLabel.text = "Moderate exercise (3-5 days a week)"
//        view.addSubview(moLabel)
        view.addSubview(cBoxModerate)
        
//        let hLabel = UILabel(frame: CGRect(x: 100, y: 325, width: 250, height: 50))
//        hLabel.text = "Heavy exercise (6-7 days a week)"
//        view.addSubview(hLabel)
        view.addSubview(cBoxHeavy)
        
//        let aLabel = UILabel(frame: CGRect(x: 100, y: 355, width: 250, height: 50))
//        aLabel.text = "Athlete (2x times a day)"
//        view.addSubview(aLabel)
        view.addSubview(cBoxAthlete)
        
        let sGesture = UITapGestureRecognizer(target: self, action: #selector(sDidTapCheckbox)) //Sendetary Checkbox
        cBoxSedentary.addGestureRecognizer(sGesture)
        let lGesture = UITapGestureRecognizer(target: self, action: #selector(lDidTapCheckbox)) //Light Checkbox
        cBoxLight.addGestureRecognizer(lGesture)
        let moGesture = UITapGestureRecognizer(target: self, action: #selector(moDidTapCheckbox)) //Moderate Checkbox
        cBoxModerate.addGestureRecognizer(moGesture)
        let hGesture = UITapGestureRecognizer(target: self, action: #selector(hDidTapCheckbox)) //Heavy Checkbox
        cBoxHeavy.addGestureRecognizer(hGesture)
        let aGesture = UITapGestureRecognizer(target: self, action: #selector(aDidTapCheckbox)) //Athlete Checkbox
        cBoxAthlete.addGestureRecognizer(aGesture)
    }
    
    @IBAction func tapOff(_ sender: Any)
    {
        height.resignFirstResponder()
        weight.resignFirstResponder()
        age.resignFirstResponder()
    }
    
    //MARK: Gender Functions
    
    @objc func mDidTapCheckbox()
    {
        cBox1.toggle()
        if cBox2.isChecked
        {
            cBox2.toggle()
        }
    }
    @objc func fDidTapCheckbox()
    {
        cBox2.toggle()
        if cBox1.isChecked
        {
            cBox1.toggle()
        }
    }
    
    //MARK: Activity Level Functions
    
    @objc func sDidTapCheckbox()
    {
        cBoxSedentary.toggle()
        if cBoxLight.isChecked {cBoxLight.toggle()}
        if cBoxModerate.isChecked {cBoxModerate.toggle()}
        if cBoxHeavy.isChecked {cBoxHeavy.toggle()}
        if cBoxAthlete.isChecked {cBoxAthlete.toggle()}
    }
    @objc func lDidTapCheckbox()
    {
        cBoxLight.toggle()
        if cBoxSedentary.isChecked {cBoxSedentary.toggle()}
        if cBoxModerate.isChecked {cBoxModerate.toggle()}
        if cBoxHeavy.isChecked {cBoxHeavy.toggle()}
        if cBoxAthlete.isChecked {cBoxAthlete.toggle()}
    }
    @objc func moDidTapCheckbox()
    {
        cBoxModerate.toggle()
        if cBoxSedentary.isChecked {cBoxSedentary.toggle()}
        if cBoxLight.isChecked {cBoxLight.toggle()}
        if cBoxHeavy.isChecked {cBoxHeavy.toggle()}
        if cBoxAthlete.isChecked {cBoxAthlete.toggle()}
    }
    @objc func hDidTapCheckbox()
    {
        cBoxHeavy.toggle()
        if cBoxSedentary.isChecked {cBoxSedentary.toggle()}
        if cBoxLight.isChecked {cBoxLight.toggle()}
        if cBoxModerate.isChecked {cBoxModerate.toggle()}
        if cBoxAthlete.isChecked {cBoxAthlete.toggle()}
    }
    @objc func aDidTapCheckbox()
    {
        cBoxAthlete.toggle()
        if cBoxSedentary.isChecked {cBoxSedentary.toggle()}
        if cBoxLight.isChecked {cBoxLight.toggle()}
        if cBoxModerate.isChecked {cBoxModerate.toggle()}
        if cBoxHeavy.isChecked {cBoxHeavy.toggle()}
    }
    
    @IBAction func calculate(_ sender: UIButton)
    {
        if height.text!.isEmpty || weight.text!.isEmpty || age.text!.isEmpty
        {
            return
        }
        
        let tHeight = Float(height.text!)!
        let tWeight = Float(weight.text!)!
        let tAge = Float(age.text!)!
        var TDEE = Float(0.0)
        
        if cBox1.isChecked //the male calculation
        {
            //the male calculation will use:
            let BMR: Float = (66 + (6.23 * tWeight) + (12.7 * tHeight) - (6.8 * Float(tAge)))
            //BMR: Basic Metabolic Rate, which is how many calories your body burns while resting
            if cBoxSedentary.isChecked {TDEE = (BMR * 1.2)}
            else if cBoxLight.isChecked {TDEE = (BMR * 1.375)}
            else if cBoxModerate.isChecked {TDEE = (BMR * 1.55)}
            else if cBoxHeavy.isChecked {TDEE = (BMR * 1.725)}
            else if cBoxAthlete.isChecked {TDEE = (BMR * 1.9)}
        }
        else if cBox2.isChecked //the female calculation
        {
            //the female calculation will use:
            let BMR = (655 + (4.35 * tWeight) + (4.7 * tHeight) - (4.7 * tAge))
            if cBoxSedentary.isChecked {TDEE = (BMR * 1.2)}
            else if cBoxLight.isChecked {TDEE = (BMR * 1.375)}
            else if cBoxModerate.isChecked {TDEE = (BMR * 1.55)}
            else if cBoxHeavy.isChecked {TDEE = (BMR * 1.725)}
            else if cBoxAthlete.isChecked {TDEE = (BMR * 1.9)}
        }
        let wGain = TDEE + 500
        let wLoss = TDEE - 500
        result.text = conversion(TDEE)
        gain.text = conversion(wGain)
        lose.text = conversion(wLoss)
    }
    
    func conversion(_ number: Float) -> String
    {
        return String(format: "%.0f", number)
    }
//    func mCalc(_ aWeight: Float, _ aHeight: Float, _ aAge: Int) -> String
//    {
//        let BMR: Float = (66 + (6.23 * aWeight) + (12.7 * aHeight) - (6.8 * Float(aAge)))
//        return String(format: "%.2f", BMR)
//    }
//    func fCalc(_ aWeight: Float, _ aHeight: Float, _ aAge: Int) -> String
//    {
//        let BMR: Float = (655 + (4.35 * aWeight) + (4.7 * aHeight) - (4.7 * Float(aAge)))
//        return String(format: "%.2f", BMR)
//    }

}

