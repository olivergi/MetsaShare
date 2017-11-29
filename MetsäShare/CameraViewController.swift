//
//  ViewController.swift
//  MetsäShare
//
//  Created by iosdev on 14.9.2017.
//  Copyright © 2017 Oliver. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    //MARK: Properties
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var barcodeFrameView: UIView!
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var capturePhotoOutput: AVCapturePhotoOutput?
    var generatedPlanogram: Planogram?
    
    var productEAN: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Assigns the captureDevice as the Camera of the device
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            // Get an instance of ACCapturePhotoOutput class
            capturePhotoOutput = AVCapturePhotoOutput()
            capturePhotoOutput?.isHighResolutionCaptureEnabled = true
            // Set the output on the capture session
            captureSession?.addOutput(capturePhotoOutput)
        } catch {
            print(error)
        }
        
        // This block of code, will allow the application to show the live video feed when on the camera view.
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        previewView.layer.addSublayer(videoPreviewLayer!)
        
        
        // This block of code adds an output function of "MetaData" to the camera.
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        captureMetadataOutput.metadataObjectTypes = captureMetadataOutput.availableMetadataObjectTypes
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureSession?.startRunning()
    }
    
    // This function is called when a Metadata object is found by the camera, it will check for all data inside the metadata (barcode).
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        for data in metadataObjects {
            let metaData = data as! AVMetadataObject
            print(metaData.description)
            let transformed = videoPreviewLayer?.transformedMetadataObject(for: metaData) as? AVMetadataMachineReadableCodeObject
            if let unwraped = transformed {
                print(unwraped.stringValue)
                barcodeLabel.text = unwraped.stringValue
                productEAN = unwraped.stringValue
                
                if (productEAN.characters.count == 13) {
                    if (productEAN == "1234567890128" ) {
                        performSegue(withIdentifier: "productFoundSegue", sender: self)
                        captureSession?.stopRunning()
                    } else {
                        performSegue(withIdentifier: "newProductSegue", sender: self)
                        captureSession?.stopRunning()
                    }
                } else {
                    showBarcodeAlert()
                }
            }
        }
    }
    
    func showBarcodeAlert () {
        let alert = UIAlertController(title: "Error",
                                      message: "Failed to read barcode. Please try again.",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

    //MARK: Actions
    @IBAction func didTakePhoto(_ sender: UIButton) {
        // Make sure capturePhotoOutput is valid
        guard let capturePhotoOutput = self.capturePhotoOutput else { return }
        // Get an instance of AVCapturePhotoSettings class
        let photoSettings = AVCapturePhotoSettings()
        // Set photo settings for our need
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoSettings.isHighResolutionPhotoEnabled = true
        photoSettings.flashMode = .auto
        // Call capturePhoto method by passing the photo settings and a
        // delegate implementing AVCapturePhotoCaptureDelegate
        capturePhotoOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "productCreationSegue") {
            let destination = segue.destination as! ProductCreationViewController
            destination.generatedPlanogram = generatedPlanogram
        } else if (segue.identifier == "productFoundSegue") {
            let destination = segue.destination as! ProductFoundViewController
            destination.productEAN = productEAN
            destination.productName = "Serla 6 Pack"
        }
    }
    
}

extension CameraViewController : AVCapturePhotoCaptureDelegate {
    func capture(_ captureOutput: AVCapturePhotoOutput,
                 didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?,
                 previewPhotoSampleBuffer: CMSampleBuffer?,
                 resolvedSettings: AVCaptureResolvedPhotoSettings,
                 bracketSettings: AVCaptureBracketedStillImageSettings?,
                 error: Error?) {
        // Make sure it gets some photo sample buffer
        guard error == nil,
            let photoSampleBuffer = photoSampleBuffer else {
                print("Error capturing photo: \(String(describing: error))")
                return
        }
        // Convert photo same buffer to a jpeg image data by using // AVCapturePhotoOutput
        guard let imageData =
            AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer) else {
                return
        }
        // Initialise a UIImage with the image data
        let capturedImage = UIImage.init(data: imageData , scale: 1.0)
        if let image = capturedImage {
            // Save the captured image to photos album
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
}

