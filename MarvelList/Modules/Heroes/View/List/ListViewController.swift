//
//  ListViewController.swift
//  MarvelList
//
//  Created by Patricio Fariña on 02-02-22.
//

import UIKit

class ListViewController: UIViewController {
    var presenter: ListPresenterProtocol?
    let tableView = UITableView(frame: .zero)
    let spinner = UIActivityIndicatorView(style: .large)
    
    private var isSearching = false
    private var isFiltering = false
    private var heroes = [Hero]()
    private var filteredHeroes = [Hero]()
    private var totalHeroes: Int = .zero
    private var currentPage: Int = .zero
    
    lazy var searchBar: UISearchBar = UISearchBar()
    
    private var offset: Int {
        return currentPage * ListConstants.limit
    }
    
    convenience init(presenter: ListPresenterProtocol) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.center = view.center
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        view.addSubview(spinner)
        
        tableView.isHidden = true
        view.backgroundColor = .white
        title = ListConstants.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .search, target: self,
            action: #selector(toggleSearch))
        prepareTableView()
        presenter?.getHeroes(offset: offset)
    }
    
    @objc
    private func toggleSearch() {
        isSearching.toggle()
        isFiltering.toggle()
        
        if isSearching {
            searchBar.searchBarStyle = UISearchBar.Style.default
            searchBar.placeholder = ListConstants.searchPlaceholder
            searchBar.sizeToFit()
            searchBar.isTranslucent = false
            searchBar.backgroundImage = UIImage()
            navigationItem.titleView = searchBar
            searchBar.delegate = self
            filteredHeroes = heroes
            
            searchBar.becomeFirstResponder()
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .close, target: self,
                action: #selector(toggleSearch))
        } else {
            navigationItem.titleView = nil
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .search, target: self,
                action: #selector(toggleSearch))
        }
        
        tableView.reloadData()
    }
    
    private func prepareTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.delegate = self
        tableView.rowHeight = ListConstants.rowHeight
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        tableView.register(HeroListCell.self, forCellReuseIdentifier: ListConstants.cellIdentifier)
    }
    
    private func calculateIndexPathsToReload(from newHeroes: [Hero]) -> [IndexPath] {
        let startIndex = heroes.count - newHeroes.count
        let endIndex = min(startIndex + heroes.count, totalHeroes)
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: .zero) }
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
        return isFiltering ? filteredHeroes.count : totalHeroes
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListConstants.cellIdentifier, for: indexPath) as! HeroListCell
        
        cell.prepare()
        if isLoadingCell(for: indexPath) {
            cell.name = ListConstants.cellDefaultText
        } else {
            let displayedHeroes = isFiltering ? filteredHeroes : heroes
            cell.name = displayedHeroes[indexPath.row].name
            if let url = URL(string: displayedHeroes[indexPath.row].thumbnail) {
                ThumbnailLoader().load(url, container: cell.imageContainer)
            }
        }
        
        return cell
    }
}

extension ListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            presenter?.getHeroes(offset: offset)
        }
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayedHeroes = isFiltering ? filteredHeroes : heroes
        let hero = displayedHeroes[indexPath.row]
        let viewController = ViewControllerFactory.viewController(type: .detail) as! DetailViewController
        let cell = tableView.cellForRow(at: indexPath) as! HeroListCell
        viewController.hero = hero
        viewController.avatarImage = cell.imageContainer.image
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}

extension ListViewController: ListView {
    func showError(_ error: ErrorModel) {
        let alert = UIAlertController(title: error.title, message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ListConstants.errorCloseButton, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loadHeroes(_ list: HeroList) {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            if self.tableView.isHidden {
                self.tableView.isHidden = false
            }
            
            self.currentPage += Digits.one
            self.totalHeroes = list.listData.total
            self.heroes.append(contentsOf: list.heroes)
            
            if self.currentPage > Digits.one, !self.isSearching {
                let indexPathsToReload = self.calculateIndexPathsToReload(from: list.heroes)
                let visiblePathToReload = self.visibleIndexPathsToReload(intersecting: indexPathsToReload)
                self.tableView.reloadRows(at: visiblePathToReload, with: .none)
            } else {
                self.tableView.reloadData()
            }
        }
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredHeroes = heroes
        } else {
            filteredHeroes = heroes.filter({ $0.name.lowercased().contains(searchText.lowercased()) })
        }
        
        tableView.reloadData()
        
    }
}
