import Prelude
import UIKit

public protocol UIStackViewProtocol: UIViewProtocol {
  func addArrangedSubview(_ view: UIView)
  var alignment: UIStackViewAlignment { get set }
  var arrangedSubviews: [UIView] { get }
  var axis: UILayoutConstraintAxis { get set }
  var isBaselineRelativeArrangement: Bool { get set }
  var distribution: UIStackViewDistribution { get set }
  var isLayoutMarginsRelativeArrangement: Bool { get set }
  var spacing: CGFloat { get set }
}

extension UIStackView: UIStackViewProtocol {}

public extension LensHolder where Object: UIStackViewProtocol {
  public var alignment: Lens<Object, UIStackViewAlignment> {
    return Lens(
      view: { $0.alignment },
      set: { $1.alignment = $0; return $1 }
    )
  }

  public var arrangedSubviews: Lens<Object, [UIView]> {
    return Lens(
      view: { $0.arrangedSubviews },
      set: {
        $1.arrangedSubviews.forEach { $0.removeFromSuperview() }
        $0.forEach($1.addArrangedSubview)
        return $1
      }
    )
  }

  public var axis: Lens<Object, UILayoutConstraintAxis> {
    return Lens(
      view: { $0.axis },
      set: { $1.axis = $0; return $1 }
    )
  }

  public var isBaselineRelativeArrangement: Lens<Object, Bool> {
    return Lens(
      view: { $0.isBaselineRelativeArrangement },
      set: { $1.isBaselineRelativeArrangement = $0; return $1 }
    )
  }

  public var distribution: Lens<Object, UIStackViewDistribution> {
    return Lens(
      view: { $0.distribution },
      set: { $1.distribution = $0; return $1 }
    )
  }

  public var isLayoutMarginsRelativeArrangement: Lens<Object, Bool> {
    return Lens(
      view: { $0.isLayoutMarginsRelativeArrangement },
      set: { $1.isLayoutMarginsRelativeArrangement = $0; return $1 }
    )
  }

  public var spacing: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.spacing },
      set: { $1.spacing = $0; return $1 }
    )
  }
}
