import UIKit
import SnapKit

public class FooterCell: UICollectionReusableView {
    static let id = "FooterCell"

    private lazy var write_me_label: UILabel = {
        let label = UILabel()
        label.text = "Write me"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()

    private lazy var tg_button: UIButton = {
        let but = UIButton()
        but.setImage(UIImage.Icons.tg_icon, for: .normal)
        but.addTarget(self, action: #selector(open_telegram), for: .touchUpInside)
        return but
    }()

    private lazy var in_button: UIButton = {
        let but = UIButton()
        but.setImage(UIImage.Icons.in_icon, for: .normal)
        but.addTarget(self, action: #selector(open_linkedin), for: .touchUpInside)
        return but
    }()

    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(tg_button)
        stackView.addArrangedSubview(in_button)
        stackView.spacing = 24
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        [write_me_label, buttonsStackView].forEach(addSubview(_:))
        setupConstraints()
    }

    private func setupConstraints() {        
        write_me_label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }

        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(write_me_label.snp_bottomMargin).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constants.iconSize)
            make.bottom.equalToSuperview().inset(5).priority(.low)
        }

        tg_button.snp.makeConstraints { make in
            make.height.width.equalTo(Constants.iconSize)
        }

        in_button.snp.makeConstraints { make in
            make.height.width.equalTo(Constants.iconSize)
        }
    }

    @objc private func open_telegram() {
        if let url = URL(string: "https://t.me/Belo4kaS") {
            UIApplication.shared.open(url)
        }
    }

    @objc private func open_linkedin() {
        if let url = URL(string: "https://www.linkedin.com/mwlite/in/anastasiia-gerasimova-888bb41b6") {
            UIApplication.shared.open(url)
        }
    }
}
