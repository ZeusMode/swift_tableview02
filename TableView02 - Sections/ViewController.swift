//
//  ViewController.swift
//  TableView02 - Sections
//
//  Created by Wesley Cintra Nascimento on 21/10/16.
//  Copyright © 2016 Wesley Cintra Nascimento. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "clubes", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        
        names = namesDict as! [String: [String]]
        keys = (namesDict?.allKeys as! [String]).sorted()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Propriedades
    let idCell = "Cell"
    var names: [String: [String]]!
    var keys: [String]!
    
    // MARK: - TableView Datasources
    // numero de seções
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys!.count
    }
    
    // numero de linhas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        
        return nameSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        
        cell.textLabel?.text = nameSection[indexPath.row]
        
        return cell
    }
    
    // Implementar um indice de secoes
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
}

