//
//  ViewController.swift
//  API Generica
//
//  Created by Manuel Soberanis on 09/06/20.
//  Copyright © 2020 Archer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let employeeCell = "employeeCell"
    
    var employeeData = [EmployeeData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Funciones iniciales
        getEmployeeData()
        setupTableView()
    }

    
    func setupTableView(){
        //MARK: - Setup del tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: employeeCell)
        
    }
    
    @objc func getEmployeeData(){
        //MARK: - En esta funcion se hace la peticion a la API generica para traer los datos de los empleados
        let jsonUrlString = "http://dummy.restapiexample.com/api/v1/employees"
        guard let urlReq = URL(string: jsonUrlString) else { return }
        var url = URLRequest(url: urlReq)
        //        let id = 1
        url.httpMethod = "GET"
        let postString = ""
        url.httpBody = postString.data(using: String.Encoding.utf8)
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            if err != nil || data == nil {
                print("Client error")
                return
            }
            //also perhaps check response status 200 OK
            guard let response = response as? HTTPURLResponse, (200...209).contains(response.statusCode) else {
                print("Server error")
                return
            }
            //Retrieve data
            guard let data = data else { return }
            do {
                let employee = try JSONDecoder().decode(EmployeeJson.self, from: data)
                self.employeeData = employee.data
                
                DispatchQueue.main.async {
                    //MARK: - Recargamos el tableViewCon los nuevos datos
                    self.tableView.reloadData()
                }
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
    
    //MARK: - Metodos del tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: employeeCell, for: indexPath) as! EmployeeCell
        cell.employeeData = employeeData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

