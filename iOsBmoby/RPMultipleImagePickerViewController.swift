//
//  MultipleImagePickerViewController.h
//
//  Created by Renato Peterman on 17/08/14.
//  Copyright (c) 2014 Renato Peterman. All rights reserved.
//
import UIKit
import QuartzCore
import MobileCoreServices

typealias RPMultipleImagePickerDoneCallback = (images: [Any]) -> Void

class RPMultipleImagePickerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UINavigationBarDelegate {
    var doneCallback = RPMultipleImagePickerDoneCallback()
    var pickerController: UIImagePickerController!
    var images = [Any]()
    var image: UIImage!
    @IBOutlet var btRemover: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var bgView: UIView!
    var selectedIndex = 0
    var sourceType = UIImagePickerControllerSourceType()

    override func add(_ image: UIImage) {
        self.image = image
        self.images.append(image)
    }

    @IBAction func remove(_ sender: Any) {
        self.images.remove(at: (self.selectedIndex - 1))
        self.reloadCollectionView()
        self.selectLastImage()
        if self.images.count > 0 {
            self.currentImage = self.images[(self.selectedIndex - 1)]
        }
        else {
            self.dismiss(animated: true, completion: { _ in })
        }
        self.refreshTitle()
    }


    override init() {
        super.init(nibName: "RPMultipleImagePicker", bundle: Bundle.main)
        
        self.sourceType = .camera
        // Default
        self.images = [Any]()
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Refresh
        self.currentImage = self.image
        self.reloadCollectionView()
        self.refreshTitle()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.selectLastImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Style
        self.navigation!.navigationBar.barStyle = .black
        // Background
        self.view.backgroundColor! = UIColor.darkGray
        self.collectionView!.registerClass(RPImageCell.self, forCellWithReuseIdentifier: "RPImageCell")
        self.selectedIndex = 0
        var gradient = CAGradientLayer.layer
        gradient.frame = self.bgView.bounds
        gradient.colors = [(UIColor.lightGray.cgColor as! Any), (UIColor.darkGray.cgColor as! Any)]
        self.bgView.layer.insertSublayer(gradient, at: 0)
        // Background view for images collection
        self.bgView.layer.shadowColor = UIColor.black.cgColor
        self.bgView.layer.shadowRadius = 3.0
        self.bgView.layer.shadowOpacity = 0.15
        // Customize default ImageView
        self.imageView!.layer.masksToBounds = true
        self.imageView!.layer.shadowColor = UIColor.black.cgColor
        self.imageView!.layer.shadowOpacity = 0.3
        self.imageView!.layer.shadowRadius = 6.0
        // Picker Controller Init
        self.pickerController = UIImagePickerController()
        self.pickerController.delegate = self
        self.pickerController.sourceType = self.sourceType
        // Bt Remover
        self.btRemover.backgroundColor = UIColor.white
        self.btRemover.layer.cornerRadius = 15.0
            // Set buttons to navigation
        var cancelButton = UIBarButtonItem(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .plain, target: self, action: #selector(self.cancel))
        var doneButton = UIBarButtonItem(title: NSLocalizedString("Done", comment: "Done"), style: .done, target: self, action: #selector(self.done))
        // iOS 7 only
        if floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1 {
            doneButton.tintColor = UIColor.yellow
        }
        self.navigationItem.leftBarButton = cancelButton
        self.navigationItem.rightBarButton = doneButton
        self.navigation!.navigationBarHidden = false
        // Set ImageView size
        if UI_USER_INTERFACE_IDIOM() == .phone {
            // iPhone
            if UIScreen.main.bounds.size.height > 500 {
                self.imageView!.bounds = CGRect(x: self.imageView!.bounds.origin.x, y: self.imageView!.bounds.origin.y, width: 240, height: 350)
            }
            else {
                self.imageView!.bounds = CGRect(x: self.imageView!.bounds.origin.x, y: self.imageView!.bounds.origin.y, width: 190, height: 300)
            }
        }
        else {
            // TODO: iPad
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
// MARK: - Util

    func selectLastImage() {
        if self.images.count > 0 {
            self.selectedIndex = self.images.count
            self.collectionView!.selectItem(atIndexPath: IndexPath(forItem: self.selectedIndex, inSection: 0), animated: true, scrollPosition: .right)
        }
        else {
            self.selectedIndex = 0
        }
    }

    override func setCurrentImage(_ image: UIImage) {
        self.imageView!.image = image
        var heigth: Double = self.imageView!.image.size.height * self.imageView!.frame.size.width / self.imageView!.image.size.width
        self.imageView!.bounds = CGRect(x: self.imageView!.bounds.origin.x, y: self.imageView!.bounds.origin.y, width: self.imageView!.bounds.size.width, height: heigth)
            // Positioning button x
        var btX: Double = (self.imageView!.center.x - (self.imageView!.frame.size.width / 2)) - 15
        var btY: Double = (self.imageView!.center.y - (self.imageView!.frame.size.height / 2)) - 15
        self.btRemover.frame = CGRect(x: btX, y: btY, width: self.btRemover.frame.size.width, height: self.btRemover.frame.size.height)
    }

    func refreshTitle() {
        if self.images.count == 1 {
            self.title! = "1 \(NSLocalizedString("image", comment: "image"))"
        }
        else if self.images.count > 1 {
            self.title! = "\(self.images.count) \(NSLocalizedString("images", comment: "images"))"
        }

    }

    func done() {
        if self.doneCallback {
            self.doneCallback(self.images)
        }
        self.dismiss(animated: true, completion: { _ in })
    }

    override func cancel() {
        self.image = nil
        self.images = nil
        self.dismiss(animated: true, completion: { _ in })
    }

    func reloadCollectionView() {
        self.collectionView!.performBatchUpdates({() -> Void in
            self.collectionView!.reloadSections(IndexSet.withIndex(0))
        }, completion: { _ in })
    }
// MARK: - Collection view delegate

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count + 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var CellIdentifier = "RPImageCell"
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, forIndexPath: indexPath)
        if cell == nil {
            cell = RPImageCell(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
        }
        if indexPath.row == 0 {
            cell.styleAddButton()
            cell.backgroundImageView.image! = nil
        }
        else {
            cell.styleImage()
            cell.backgroundImageView.image! = self.images[(indexPath.row - 1)]
        }
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            UIApplication.shared.setStatusBarHidden(true, withAnimation: .slide)
            self.present(self.pickerController, animated: true, completion: { _ in })
        }
        else {
            self.currentImage = self.images[(indexPath.row - 1)]
            self.selectedIndex = indexPath.row
        }
    }
// MARK: - ImagePicker delegate methods

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        UIApplication.shared.setStatusBarHidden(false, withAnimation: .slide)
        picker.dismiss(animated: true, completion: { _ in })
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [AnyHashable: Any]) {
        var mediaType = (info[UIImagePickerControllerMediaType] as! String)
        var originalImage: UIImage?
        var editedImage: UIImage?
        var imageToUse: UIImage?
        if CFStringCompare((mediaType as! CFString), kUTTypeImage, 0) == kCFCompareEqualTo {
            if self.images == nil {
                self.images = [Any]()
            }
            editedImage = ((info[UIImagePickerControllerEditedImage] as! String) as! UIImage)
            // Edited image if available
            originalImage = ((info[UIImagePickerControllerOriginalImage] as! String) as! UIImage)
            imageToUse = editedImage ? editedImage : originalImage
            self.addImage(imageToUse)
            picker.dismiss(animated: true, completion: { _ in })
        }
    }
// MARK: - UI navigation bar delegate

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navigationController.navigationBar.barStyle = .black
    }
// MARK: - IBActions
}
//
//  MultipleImagePickerViewController.m
//
//  Created by Renato Peterman on 17/08/14.
//  Copyright (c) 2014 Renato Peterman. All rights reserved.
//