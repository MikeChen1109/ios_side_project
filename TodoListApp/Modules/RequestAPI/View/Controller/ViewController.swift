//
//  ViewController.swift
//  TodoListApp
//
//  Created by 逸唐陳 on 2023/8/2.
//

import UIKit

class ViewController: UIViewController {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        return stackView
    }()
    
    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private let requsetButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Request Post", for: .normal)
        return btn
    }()
    
    private let todoButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Go Todo List", for: .normal)
        return btn
    }()
    
    private let loadingActivity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.hidesWhenStopped = true
        activity.accessibilityIdentifier = "loading"
        return activity
    }()
    
    private let viewModel: HomeViewModel
    weak var appCoordinator: AppCoordinator?
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        verticalStackView.addArrangedSubview(requsetButton)
        verticalStackView.addArrangedSubview(todoButton)
        stackView.addArrangedSubview(verticalStackView)
        view.addSubview(loadingActivity)
        loadingActivity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingActivity.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingActivity.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loadingActivity.widthAnchor.constraint(equalToConstant: 45).isActive = true
        requsetButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        todoButton.addTarget(self, action: #selector(goTodoListDidTap), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        binding()
    }
    
    @objc private func buttonDidTap() {
        viewModel.getPost()
    }
    
    @objc private func goTodoListDidTap() {
        appCoordinator?.showTodoListModule()
    }
    
    private func binding() {
        viewModel.eventState = eventHandler
    }
    
    private func eventHandler(eventState: EventState<Post>) {
        switch eventState {
        case .data(let post):
            dataHandler(post: post)
        case .error(let error):
            errorHandler(error: error)
        case .loading:
            loadingHandler()
        }
    }
    
    private func dataHandler(post: Post) {
        loadingActivity.stopAnimating()
        appCoordinator?.showDetailModule(post: post)
    }
    
    private func errorHandler(error: Error) {
        loadingActivity.stopAnimating()
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "errorAlert"
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func loadingHandler() {
        loadingActivity.startAnimating()
    }

}

