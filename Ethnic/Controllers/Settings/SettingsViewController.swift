//
//  SettingsViewController.swift
//  Ethnic
//
//  Created by user205191 on 11/3/21.
//

import UIKit

class SettingsViewController: BaseViewController {

    //Declaration view frome Views folder.
    private var settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"

        // Do any additional setup after loading the view.
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
