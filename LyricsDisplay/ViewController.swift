//
//  ViewController.swift
//  LyricsDisplay
//
//  Created by Jerry on 21/10/15.
//  Copyright © 2015 Jerry. All rights reserved.
//

import Cocoa
import AppKit
import AVFoundation

class ViewController: NSViewController {
    @IBOutlet var choose: NSButton!
    @IBOutlet var lyricsView: NSTextView!
    @IBOutlet var titleField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func choose(sender: AnyObject) {
        //print("View controller instance with view: \(self.view)")
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            if result == NSFileHandlingPanelOKButton {
                let lyrics = AVAsset(URL: openPanel.URL!).lyrics
                let meta = [AVMetadataItem](AVAsset(URL: openPanel.URL!).commonMetadata)
                self.lyricsView.string = lyrics
                for item in meta{
                    if(item.commonKey == "title"){
                        print(item.value!)
                        self.titleField.stringValue = item.value! as! String
                        break
                    }
                }
                
            }
        }
    }

}

