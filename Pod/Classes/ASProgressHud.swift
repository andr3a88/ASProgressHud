//
//  ASProgress.swift
//  Pods
//
//  Created by Andrea Stevanato on 17/02/16.
//
//

/**
*  Specify the property for the Hud.
*/
public struct HudProperty {
    
    /// The images predix name (eg. For a image with format "my_loader_XX.png" with NN from 0 to 20 the predix name is "my:loader")
    public let prefixName: String
    /// The number of images used to animate the loader
    let frameNumber: Int
    /// The size for the loader. Defaut value 60 px
    let size: CGFloat
    /// The animation duration for a single cycles. Default value 1.0 second
    let animationDuration: NSTimeInterval
    /// An optional background color. The defuault value is clear color
    let backgroundColor: UIColor?
    
    private var mainBundle : Bool = false
    
    /**
     Specify the property for the Hud
     
     - parameter prefixName:        The images predix name (eg. For a image with format "my_loader_XX.png" with NN from 0 to 20 the predix name is "my:loader")
     - parameter frameNumber:       The number of images used to animate the loader
     - parameter size:              The size for the loader. Defaut value 60 px
     - parameter animationDuration: The animation duration for a single cycles. Default value 1.0 second
     - parameter backgroundColor:   An optional background color. The defuault value is clear color
     
     - returns: The property struct
     */
    public init(prefixName : String, frameNumber : Int, size : CGFloat = 60, animationDuration : NSTimeInterval = 1.0, backgroundColor : UIColor? = UIColor.clearColor()) {
        self.prefixName = prefixName
        self.frameNumber = frameNumber
        self.size = size
        self.animationDuration = animationDuration
        self.backgroundColor = backgroundColor
    }
}

/// A set of custom Hud
public enum HudType : Int {
    case Default, Flag, Google
    
    var properties : HudProperty {
        switch self {
        case .Default:
            return HudProperty(prefixName: "default", frameNumber: 18)
        case .Flag:
            return HudProperty(prefixName: "flag", frameNumber: 20)
        case .Google:
            return HudProperty(prefixName: "google", frameNumber: 30)
        }
    }
}

/**
 *  ASProgressHud is UIView subclass
 */
public class ASProgressHud: UIView {
    
    private var useAnimation = true
    private var showStarted : NSDate?
    private var hudImageView : UIImageView?
    var removeFromSuperViewOnHide : Bool? = false
    
    //MARK: - Init
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Init with Progress Hud Type
     
     :param: frame frame
     :param: type  Progress Hud Type
     
     :returns: ASProgressHud istance
     */
    init(frame: CGRect, type: HudType) {
        super.init(frame: frame)
        
        let hudProperty = type.properties
        self.initializeWithHudProperty(hudProperty)
        
        self.customTypeBasedConfiguration(type)
        self.addSubview(self.hudImageView!)
    }
    
    /**
     Init with custom loader
     
     :param: frame       Frame
     :param: hudProperty Hud property
     
     :returns: ASProgressHud istance
     */
    init(frame: CGRect, hudProperty: HudProperty) {
        super.init(frame: frame)
        
        self.initializeWithHudProperty(hudProperty)
        self.addSubview(self.hudImageView!)
    }
    
    private func initializeWithHudProperty(hudProperty : HudProperty) {
        self.removeFromSuperViewOnHide = true
        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        self.opaque = false
        self.alpha = 0.0
        self.contentMode = UIViewContentMode.Center
        self.autoresizingMask = [.FlexibleTopMargin, .FlexibleBottomMargin, .FlexibleLeftMargin, .FlexibleRightMargin]
        
        //Configure HudImageView
        self.hudImageView = UIImageView(frame:CGRectMake(0, 0, hudProperty.size, hudProperty.size))
        self.hudImageView?.center = CGPointMake(frame.size.width/2, frame.size.height/2)
        self.hudImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        self.hudImageView?.backgroundColor = hudProperty.backgroundColor
        
        //Load images
        let imagesArray = self.loadImages(hudProperty)
        
        //Animation configuration
        self.hudImageView?.animationImages = imagesArray
        self.hudImageView?.animationDuration = 1.0
        self.hudImageView?.animationRepeatCount = 0
        self.hudImageView?.clipsToBounds = true
        self.hudImageView?.layer.cornerRadius = 10.0
    }
    
    private func customTypeBasedConfiguration(type: HudType) {
        switch type {
        case .Default:
            
            //Add a black shadow with radius offset and opacity
            self.hudImageView?.layer.shadowColor = UIColor.blackColor().CGColor
            self.hudImageView?.layer.shadowOpacity = 0.4
            self.hudImageView?.layer.shadowRadius = 3.0
            self.hudImageView?.layer.shadowOffset = CGSizeMake(0, 3)
            self.hudImageView?.clipsToBounds = false
            
        default:
            break
        }
    }
    
    //MARK: - Utils
    
    private func loadImages(property : HudProperty) -> Array<UIImage> {

        //Load images
        var imageArray : [UIImage] = []
        
        for c in 0 ..< property.frameNumber {
            guard let image = UIImage(named: String(format: "%@_%02d.png", property.prefixName, c), inBundle: property.mainBundle ? nil : self.podBundle(), compatibleWithTraitCollection: nil) else {
                assertionFailure("Cannot load the image")
                return []
            }
            imageArray.append(image)
        }
        
        return imageArray
    }
    
    private func podBundle() -> NSBundle {
        
        let podBundle = NSBundle(forClass: self.classForCoder)
        if let bundleURL = podBundle.URLForResource("Resources", withExtension: "bundle") {
            
            if let bundle = NSBundle(URL: bundleURL) {
                return bundle
            } else {
                assertionFailure("Could not load the bundle")
            }
        } else {
            assertionFailure("Could not create a path to the bundle")
        }
        return podBundle
    }
    
    //MARK: - Class methods
    
    /**
    Creates a new HUD, adds it to provided view and shows it. The counterpart to this method is hideHUDForView:animated:.
    
    :note: This method sets `removeFromSuperViewOnHide`. The HUD will automatically be removed from the view hierarchy when hidden.
    
    :param: view     The view that the HUD will be added to
    :param: animated If set to YES the HUD will appear using the current animationType. If set to NO the HUD will not use animations while appearing.
    :param: type     The type for the HUD
    
    :returns: A reference to the created HUD.
    
    :see: hideHUDForView:animated:
    :see: animationType
    */
    public static func showHUDAddedTo(view : UIView, animated : Bool, type : HudType) -> ASProgressHud {
        let hud = ASProgressHud(frame: view.bounds, type: type)
        view.addSubview(hud)
        hud.show(animated)
        return hud
    }
    
    /**
     Creates a new HUD, adds it to provided view and shows it. The counterpart to this method is hideHUDForView:animated:.
     
     :note: This method sets `removeFromSuperViewOnHide`. The HUD will automatically be removed from the view hierarchy when hidden.
     
     :param: view     The view that the HUD will be added to
     :param: animated If set to YES the HUD will appear using the current animationType. If set to NO the HUD will not use animations while appearing.
     :param: type     The type for the HUD
     
     :returns: A reference to the created HUD.
     
     :see: hideHUDForView:animated:
     :see: animationType
     */
    public static func showCustomHUDAddedTo(view : UIView, animated : Bool, property : HudProperty) -> ASProgressHud {
        var hudProperty = property
        hudProperty.mainBundle = true
        let hud = ASProgressHud(frame: view.bounds, hudProperty: hudProperty)
        view.addSubview(hud)
        hud.show(animated)
        return hud
    }
    
    /**
     Finds the top-most HUD subview and hides it. The counterpart to this method is showHUDAddedTo:animated:.
     
     :note: This method sets `removeFromSuperViewOnHide`. The HUD will automatically be removed from the view hierarchy when hidden.
     
     :param: view     The view that is going to be searched for a HUD subview.
     :param: animated If set to YES the HUD will disappear using the current animationType. If set to NO the HUD will not use animations while disappearing.
     
     :returns: YES if a HUD was found and removed, NO otherwise.
     
     :see: showHUDAddedTo:animated:
     :see: animationType
     */
    public static func hideHUDForView(view : UIView, animated : Bool) -> Bool {
        let hud = self.HUDForView(view)
        
        if hud != nil {
            hud?.removeFromSuperViewOnHide = true
            hud?.hide(animated)
            return true
        }
        return false
    }
    
    
    /**
     Finds all the HUD subviews and hides them.
     
     :param: view     The view that is going to be searched for HUD subviews.
     :param: animated If set to YES the HUDs will disappear using the current animationType. If set to NO the HUDs will not use animations while disappearing.
     
     :returns: The number of HUDs found and removed.
     
     :see: hideHUDForView:animated:
     :see: animationType
     */
    public static func hideAllHUDsForView(view: UIView, animated: Bool) -> NSInteger {
        
        let huds = ASProgressHud.allHUDsForView(view)
        for hud in huds {
            hud.removeFromSuperViewOnHide = true
            hud.hide(animated)
        }
        return huds.count
    }
    
    private static func HUDForView(view : UIView) -> ASProgressHud? {
        
        let subviewsEnum  = view.subviews as NSArray
        let array = subviewsEnum.reverseObjectEnumerator()
        
        for subView in array {
            if subView.isKindOfClass(self) {
                return subView as? ASProgressHud
            }
        }
        return nil
    }
    
    private static func allHUDsForView(view : UIView) -> Array<ASProgressHud> {
        
        var huds : [ASProgressHud]? = []
        let subviews = view.subviews as Array
        for aView in subviews {
            if aView.isKindOfClass(self) {
                huds?.append(aView as! ASProgressHud)
            }
        }
        return huds!
    }
    
    //MARK: - Show & hide
    
    private func showUsingAnimation(animated : Bool) {
        // Cancel any scheduled hideDelayed: calls
        NSObject.cancelPreviousPerformRequestsWithTarget(self)
        self.setNeedsDisplay()
        
        self.hudImageView?.startAnimating()
        
        self.showStarted = NSDate()
        
        // Fade in
        if animated == true {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.30)
            self.alpha = 1.0
            UIView.commitAnimations()
        } else {
            self.alpha = 1.0
        }
    }
    
    private func hideUsingAnimation(animated : Bool) {
        // Fade out
        if animated == true && showStarted != nil {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.30)
            UIView.setAnimationDelegate(self)
            UIView.setAnimationDidStopSelector(#selector(ASProgressHud.animationFinished))
            // 0.02 prevents the hud from passing through touches during the animation the hud will get completely hidden
            // in the done method
            self.alpha = 0.02
            UIView.commitAnimations()
        } else {
            self.alpha = 0.0
            self.done()
        }
        self.showStarted = nil
    }
    
    private func show(animated : Bool) {
        assert(NSThread.isMainThread(), "ASProgressHud needs to be accessed on the main thread.")
        self.useAnimation = animated
        self.showUsingAnimation(useAnimation)
    }
    
    private func hide(animated : Bool) {
        assert(NSThread.isMainThread(), "ASProgressHud needs to be accessed on the main thread.")
        self.useAnimation = animated
        self.hideUsingAnimation(useAnimation)
    }
    
    //MARK: - Internal show & hide operations
    
    func animationFinished() {
        self.done()
    }
    
    private func done() {
        NSObject.cancelPreviousPerformRequestsWithTarget(self)
        self.alpha = 0.0
        self.hudImageView?.stopAnimating()
        
        if removeFromSuperViewOnHide == true {
            self.removeFromSuperview()
        }
    }
    
}
