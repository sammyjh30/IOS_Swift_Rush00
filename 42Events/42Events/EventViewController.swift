//
//  ViewController.swift
//  42Events
//
//  Created by Samantha HILLEBRAND on 2019/10/12.
//  Copyright © 2019 Rush00Team. All rights reserved.
//

import UIKit

class AlertInfo {
//    ALERT_MESSAGE
    func showAlert(fromController controller: UIViewController, messages: String) {
        let alert = UIAlertController(title: "Info", message: messages, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "FeelsBadMan", style: .cancel, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}

class EventViewController: UIViewController {

    @IBOutlet var name: UILabel!
    @IBOutlet var nSub: UITextField!
    @IBOutlet var mSub: UITextField!
    @IBOutlet var desc: UITextView!
    @IBOutlet var date: UITextField!
    @IBOutlet var bTim: UITextField!
    @IBOutlet var eTim: UITextField!
    @IBOutlet var dura: UITextField!
    @IBOutlet var locn: UITextField!
    @IBOutlet var kind: UITextField!
    @IBOutlet weak var subS: UIButton!
    @IBAction func subSButtonPress(_ sender: Any) {
        let alert = AlertInfo()
        alert.showAlert(fromController: self, messages: "Would be able to subscribe if possible.")
    }
    
    var data: CellData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        name.text = data?.name
        name.isUserInteractionEnabled = false
        nSub.text = data?.nSub
        nSub.isUserInteractionEnabled = false
        mSub.text = data?.mSub
        mSub.isUserInteractionEnabled = false
        desc.text = data?.desc
        date.text = data?.date
        date.isUserInteractionEnabled = false
        bTim.text = data?.bTim
        bTim.isUserInteractionEnabled = false
        eTim.text = data?.eTim
        eTim.isUserInteractionEnabled = false
        dura.text = data?.dura
        dura.isUserInteractionEnabled = false
        locn.text = data?.locn
        locn.isUserInteractionEnabled = false
        kind.text = data?.kind
        kind.isUserInteractionEnabled = false
    }


}

