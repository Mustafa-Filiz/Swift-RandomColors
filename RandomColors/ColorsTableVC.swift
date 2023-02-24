//
//  ColorsTableVC.swift
//  RandomColors
//
//  Created by Mustafa Filiz on 14.02.2023.
//

import UIKit

class ColorsTableVC: UIViewController {
    let colorsTable = UITableView()
    var colorsArray: [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Colors"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        createRandomColorsArray()

        // Do any additional setup after loading the view.
    }

    func configureTableView() {
        view.addSubview(colorsTable)
        setTableViewDelegates()
        colorsTable.rowHeight = 50
        colorsTable.register(ColorCell.self, forCellReuseIdentifier: "ColorCell")
        colorsTable.pin(to: view)
    }

    func setTableViewDelegates() {
        colorsTable.delegate = self
        colorsTable.dataSource = self
    }

    func createRandomColorsArray() {
        for _ in 0 ..< 50 {
            colorsArray.append(.random())
        }
    }

}

extension ColorsTableVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else { return UITableViewCell() }

        tableCell.backgroundColor = colorsArray[indexPath.row]

        return tableCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let colorDetailVC = ColorsDetailVC()
        colorDetailVC.backgroundColor = colorsArray[indexPath.row]
        
        navigationController?.pushViewController(colorDetailVC, animated: true)
//        navigationController?.show(ColorsDetailVC(), sender: colorsArray[indexPath.row])
    }
}
