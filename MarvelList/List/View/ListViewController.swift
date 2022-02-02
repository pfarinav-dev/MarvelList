//
//  ListViewController.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import UIKit

class ListViewController: UIViewController {
    var presenter: ListPresenterProtocol?
    var serviceLocator: ListServiceLocator?
    let tableView = UITableView(frame: .zero)
    private var heroes = [Heroe]()
    
    private var totalHeroes: Int = .zero
    private var currentPage: Int = .zero
    
    private var offset: Int {
        return currentPage * 30
    }
    
    convenience init(presenter: ListPresenterProtocol, serviceLocator: ListServiceLocator) {
        self.init()
        self.presenter = presenter
        self.serviceLocator = serviceLocator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = ListConstants.title
        prepareTableView()
        
        presenter?.getHeroes(offset: offset)
    }
    
    
    
    private func prepareTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "generic")
    }
    
    private func calculateIndexPathsToReload(from newHeroes: [Heroe]) -> [IndexPath] {
        let startIndex = heroes.count - newHeroes.count
        let endIndex = min(startIndex + heroes.count, totalHeroes)
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
    
    fileprivate func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= heroes.count
    }
    
    fileprivate func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalHeroes
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "generic", for: indexPath)
        
        
        if isLoadingCell(for: indexPath) {
            cell.textLabel?.text = "Loading..."
        } else {
            cell.textLabel?.text = "\(indexPath.row) - \(heroes[indexPath.row].name)"
        }
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            presenter?.getHeroes(offset: offset)
        }
    }
}

extension ListViewController: ListView {
    func loadHeroes(_ list: (listData: ListData, heroes: [Heroe])) {
        self.currentPage += 1
        self.totalHeroes = list.listData.total
        self.heroes.append(contentsOf: list.heroes)
        
        if self.currentPage > 1 {
            let indexPathsToReload = self.calculateIndexPathsToReload(from: list.heroes)
            self.tableView.reloadRows(at: indexPathsToReload, with: .automatic)
        } else {
            self.tableView.reloadData()
        }
    }
}
