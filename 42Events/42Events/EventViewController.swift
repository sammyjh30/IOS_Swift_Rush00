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
    
    var data: CellData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name.text = data?.name
        nSub.text = data?.nSub
        mSub.text = data?.mSub
        desc.text = data?.desc
        date.text = data?.date
        bTim.text = data?.bTim
        eTim.text = data?.eTim
        dura.text = data?.dura
        locn.text = data?.locn
        kind.text = data?.kind
    }


}

