//
//  LoadingButton.swift
//  TestProjectGlobalRadio
//
//  Created by Adam Leitgeb on 11/02/2019.
//  Copyright © 2019 Adam Leitgeb. All rights reserved.
//

import UIKit

/// Button with loading state & scale highlighting.

@IBDesignable
class LoadingButton: UIButton {

    // MARK: - Properties

    private var title: String?
    private let activityView = UIActivityIndicatorView()

    var activityIndicatorStyle: UIActivityIndicatorView.Style = .white {
        didSet {
            activityView.style = activityIndicatorStyle
        }
    }

    // MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }

    // MARK: - UIButton

    override func setTitle(_ title: String?, for state: UIControl.State) {
        if title != nil && title != "" {
            self.title = title
        }
        super.setTitle(title, for: state)
    }

    override var isHighlighted: Bool {
        didSet {
            isHighlighted ? highlight() : unhighlight()
        }
    }

    override var isEnabled: Bool {
        didSet {
            super.isEnabled = isEnabled
            alpha = isEnabled ? 1 : 0.8
        }
    }

    // MARK: - Setup

    private func setup() {
        title = titleLabel?.text
        layer.cornerRadius = 8

        setupFont()
        setupActivityView()
    }

    private func setupFont() {
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }

    private func setupActivityView() {
        addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            activityView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    // MARK: - Actions

    func startLoading() {
        setTitle(nil, for: .normal)
        isUserInteractionEnabled = false
        activityView.startAnimating()
    }

    func stopLoading() {
        setTitle(title, for: .normal)
        isUserInteractionEnabled = true
        activityView.stopAnimating()
    }

    private func highlight() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
            self.alpha = 0.8
        }, completion: nil)
    }

    private func unhighlight() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.alpha = 1
        }, completion: nil)
    }
}

