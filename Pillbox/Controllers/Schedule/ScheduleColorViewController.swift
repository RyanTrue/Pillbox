//
//  ScheduleColorViewController.swift
//  Pillbox
//
//  Created by Rayen on 9/30/21.
//

import UIKit
class ScheduleColorViewController : UITableViewController {
    
    let idOptionsColorCell = "idOptionsScheduleCell"
    let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    
    let headerNameArray = ["RED","BLUE","TEAL","INDIGO","ORANGE", "YELLOW", "GRAY"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .gray
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: idOptionsColorCell)
        tableView.register(HeaderOptionTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
        
        title = "Color shcedule"
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsColorCell, for: indexPath) as! ColorTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsScheduleHeader) as! HeaderOptionTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: setColor(color: "E74C3C")
        case 1: setColor(color: "5DADE2")
        case 2: setColor(color: "#48C9B0")
        case 3: setColor(color: "576ac1")
        case 4: setColor(color: "E67E22")
        case 5: setColor(color: "F4D03F")
        case 6: setColor(color: "#85929E")
        default:
            setColor(color: "FFFFFF")
        }
    }
    
    private func setColor(color: String) {
        let scheduleOptions = self.navigationController?.viewControllers[1] as? ScheduleOptionTableViewController
        scheduleOptions?.hexColorCell = color
        scheduleOptions?.tableView.reloadRows(at: [[3,0], [4,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
}