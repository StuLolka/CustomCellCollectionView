import UIKit
import SnapKit

final class SecondView: UIView {
    static let id = "SecondView"

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = """
                     Happy families are all alike; every unhappy family is unhappy in its own way.
                    """
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = .secondCellBackground
        addSubview(label)
        setupConstraints()
    }

    private func setupConstraints() {
        snp.makeConstraints { make in
            make.width.equalTo(Constants.width)
        }

        label.snp.makeConstraints { make in
            make.centerY.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
        }
    }
}
