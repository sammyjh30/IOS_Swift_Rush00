//
//  ViewController.swift
//  42Events
//
//  Created by Samantha HILLEBRAND on 2019/10/12.
//  Copyright © 2019 Rush00Team. All rights reserved.
//

import UIKit

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
    
    var data: EventData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        name.text = data?.name
        name.isUserInteractionEnabled = false
        nSub.text = "\(String(describing: data?.nbr_subs!))"
        nSub.isUserInteractionEnabled = false
        mSub.text = "\(String(describing: data?.max_subs!))"
        mSub.isUserInteractionEnabled = false
        desc.text = data?.desc
        date.text = data?.begin_at
        date.isUserInteractionEnabled = false
        bTim.text = data?.begin_at
        bTim.isUserInteractionEnabled = false
        eTim.text = data?.end_at
        eTim.isUserInteractionEnabled = false
        dura.text = "date formatter here"
        dura.isUserInteractionEnabled = false
        locn.text = data?.location
        locn.isUserInteractionEnabled = false
        kind.text = data?.kind
        kind.isUserInteractionEnabled = false
    }


}

