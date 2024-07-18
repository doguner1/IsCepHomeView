//
//  GifView.swift
//  IsCepHomeView
//
//  Created by qwerty on 18.07.2024.
//
import SwiftUI
import UIKit

// UIViewRepresentable kullanarak GIF oynatıcı oluşturma
struct GIFView: UIViewRepresentable {
    private let gifName: String
    
    init(gifName: String) {
        self.gifName = gifName
    }
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        if let path = Bundle.main.path(forResource: gifName, ofType: "gif") {
            let url = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: url) {
                let image = UIImage.gif(data: data)
                uiView.image = image
            }
        }
    }
}

// UIImage genişletmesi ile GIF desteği ekleme
extension UIImage {
    public static func gif(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("Image source is nil")
            return nil
        }

        var images = [UIImage]()
        var duration: TimeInterval = 0

        let count = CGImageSourceGetCount(source)
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage))
                if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
                   let gifProperties = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
                   let delay = gifProperties[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double {
                    duration += delay
                }
            }
        }

        return UIImage.animatedImage(with: images, duration: duration)
    }
}
