//
//  ErrorView.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 26/12/2022.
//

import UIKit
import Lottie
protocol ErrorViewDelegate: AnyObject {
    func retryButtonDidTapped()
}

final class ErrorView: UIView {

    weak var delegate: ErrorViewDelegate?

    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var retryButton: UIButton!

    @IBAction func retryButtonTapped(_ sender: Any) {
        delegate?.retryButtonDidTapped()
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        retryButton.layer.cornerRadius = 8
        retryButton.layer.borderWidth = 2
        retryButton.layer.borderColor = UIColor.systemGreen.cgColor

        animationView.animation = .named("networkError_lottie")
        animationView.loopMode = .loop
        animationView.play()
    }
}
