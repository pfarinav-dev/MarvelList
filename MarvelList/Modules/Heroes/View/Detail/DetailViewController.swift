//
//  DetailViewController.swift
//  MarvelList
//
//  Created by Patricio Fariña on 03-02-22.
//

import UIKit

class DetailViewController: UIViewController {
    var presenter: DetailPresenterProtocol?
    private let tableView = UITableView(frame: .zero)
    private let avatar = UIImageView(frame: .zero)
    private let descriptionLabel = UILabel(frame: .zero)
    
    var hero: Hero? {
        didSet {
            title = hero?.name
            descriptionLabel.text = hero?.description
        }
    }
    
    var avatarImage: UIImage? {
        didSet {
            avatar.image = avatarImage
        }
    }
    
    var events: [Event]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    convenience init(presenter: DetailPresenterProtocol) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        prepareTableView()
        guard let identifier = hero?.identifier else {
            return
        }
        
        presenter?.getEvents(identifier: identifier)
    }

    private func prepareTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "generic")
        tableView.register(HeroDetailAvatarCell.self, forCellReuseIdentifier: "AvatarCell")
        tableView.register(HeroDetailEventsCell.self, forCellReuseIdentifier: "EventsCell")
        
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailViewCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch DetailViewCellType.allCases[indexPath.row] {
        case .avatar:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell", for: indexPath) as! HeroDetailAvatarCell
            cell.prepare(with: avatarImage ?? UIImage())
            cell.selectionStyle = .none
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: "generic", for: indexPath)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.numberOfLines = .zero
            cell.textLabel?.textAlignment = .justified
            cell.textLabel?.text = hero?.description
            return cell
        case .events:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventsCell", for: indexPath) as! HeroDetailEventsCell
            cell.prepare(with: events ?? [])
            return cell
        }
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch DetailViewCellType.allCases[indexPath.row] {
        case .avatar:
            return 300
        case .description:
            return UITableView.automaticDimension
        case .events:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch DetailViewCellType.allCases[indexPath.row] {
        case .avatar:
            return 300
        case .description:
            return UITableView.automaticDimension
        case .events:
            return UITableView.automaticDimension
        }
    }
}

extension DetailViewController: DetailView {
    func loadEvents(_ events: [Event]) {
        if events.isEmpty {
            self.events = [Event(name: "El heroe no tiene eventos destacados :(")]
            return
        }
        self.events = events
    }
    
    func showError(_ error: ErrorModel) {
        let alert = UIAlertController(title: error.title, message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ListConstants.errorCloseButton, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
