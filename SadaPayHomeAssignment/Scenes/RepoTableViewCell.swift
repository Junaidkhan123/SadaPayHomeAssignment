//
//  RepoTableViewCell.swift
//  SadaPayHomeAssignment
//
//  Created by Junaid on 25/12/2022.
//

import UIKit
import Kingfisher
class RepoTableViewCell: UITableViewCell {

    static let identifier = "RepoTableViewCell"

    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(with viewModel: TrendingRepoCellViewModelType) {
        ownerNameLabel.text = viewModel.ownerLogin
        repositoryNameLabel.text = viewModel.name
        repoDescriptionLabel.text = viewModel.trendingRepositoryDescription
        languageLabel.text = viewModel.language
        starsCountLabel.text = viewModel.stars
        avatarImageView.kf.setImage(with: viewModel.avatarUrl)
    }
}
