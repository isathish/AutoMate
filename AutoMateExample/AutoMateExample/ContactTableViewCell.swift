//
//  ContactTableViewCell.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 23/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import Contacts

class ContactTableViewCell: UITableViewCell, ConfigurableCell {

    // MARK: Properties - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var socialLabel: UILabel!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var urlAddressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet var informationStackViews: [UIStackView]!
    @IBOutlet weak var socialProfileStackView: UIStackView!
    @IBOutlet weak var phoneNumberStackView: UIStackView!
    @IBOutlet weak var urlStackView: UIStackView!
    @IBOutlet weak var emailStackView: UIStackView!

    // MARK: UITableViewCell lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        informationStackViews.forEach { $0.isHidden = false }
        nicknameLabel.isHidden = false
    }

    // MARK: ConfigurableCell - Methods
    func configure(with data: CNContact) {
        nameLabel.text = "\(data.givenName) \(data.familyName)"

        if !data.nickname.isEmpty {
            nicknameLabel.text = data.nickname
        } else {
            nicknameLabel.isHidden = true
        }

        if let socialProfile = data.socialProfiles.first {
            socialLabel.text = "\(socialProfile.label ?? "") (\(socialProfile.value.service))"
            profileLabel.text = socialProfile.value.username
        } else {
            socialProfileStackView.isHidden = true
        }

        if let phoneNumber = data.phoneNumbers.first {
            phoneLabel.text = phoneNumber.label
            numberLabel.text = phoneNumber.value.stringValue
        } else {
            phoneNumberStackView.isHidden = true
        }

        if let urlAddress = data.urlAddresses.first {
            urlLabel.text = urlAddress.label
            urlAddressLabel.text = urlAddress.value as String
        } else {
            urlStackView.isHidden = true
        }

        if let emailAddress = data.emailAddresses.first {
            emailLabel.text = emailAddress.label
            emailAddressLabel.text = emailAddress.value as String
        } else {
            emailStackView.isHidden = true
        }

        thumbnailImageView.image = data.thumbnailImageData.flatMap(UIImage.init(data:)) ?? #imageLiteral(resourceName: "automate_logo")
    }
}
