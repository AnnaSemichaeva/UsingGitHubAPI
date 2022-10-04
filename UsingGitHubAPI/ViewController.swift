//
//  ViewController.swift
//  UsingGitHubAPI
//
//  Created by macuser on 8/29/22.
//

import UIKit

class ViewController: UIViewController {

    let data: [String] = ["mom", "papa", "Borya", "Spasite", "Menya", "Pozhalyista", "Mne", "Ochen'", "Slozhno", "No", "ya", "horoshaya", "devochka", "i", "ya", "so", "vsem", "spravlys"]
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .blue
        return table
    }()
    
    // У любого ViewController'a есть view (вью или вьюшка), мы на ней располагаем наши элементы UI
    // Её мы и красим в бордовый цвет, а затем на неё добавляем как следующий слой, наш tableView
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.4550600524, green: 0.02154863621, blue: 0.1925193302, alpha: 1)
        title = "gggggg"
        
        setUpTableView()
        
    }

    private func setUpTableView() {
    
        // 1) add subview and set up constraints
        // Тут мы через код указываем констраинты
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // 2) register cell and set up delegates
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

