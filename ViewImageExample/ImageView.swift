//
//  ImageView.swift
//  ViewImageExample
//
//  Created by book on 2022/10/20.
//

import SwiftUI

struct ImageView: View {
    var filename : String
    func pixelMessage(cgimage:CGImage) -> String? {
        if let data = cgimage.dataProvider?.data {
            let bpp = cgimage.bitsPerPixel / cgimage.bitsPerComponent
            let bpr = cgimage.bytesPerRow
            let x = cgimage.width - 1
            let y = cgimage.height - 1
            let bytes = CFDataGetBytePtr(data)!
            let offset = y * bpr + x * bpp
            var msg = "pixel(" + String(x) + "," + String(y) + ") = [ " + String(bytes[offset])
            for i in 1 ..< bpp {
                msg += ", " + String(bytes[offset+i])
            }
            return msg + " ]"
        }
        return nil
    }
    var body: some View {
        VStack {
            let mainBundleURL = Bundle.main.bundleURL
            let fileURL = mainBundleURL.appendingPathComponent(filename)
            let data = try! Data(contentsOf: fileURL)
            let uiimage = UIImage(data:data)!
            Image(uiImage: uiimage).padding()
            let cgimage = uiimage.cgImage!
            let bpp = cgimage.bitsPerPixel / cgimage.bitsPerComponent
            let msg = "size = ("+String(cgimage.width)+","+String(cgimage.height)+"), bytes/pixel = "+String(bpp)
            Text(msg).padding()
            if let pxmsg = pixelMessage(cgimage: cgimage) {
                Text(pxmsg).padding()
            }
        }
    }
}

struct ImageView_PreViews: PreviewProvider {
    let filename : String
    static var previews: some View {
        ImageView(filename:"")
    }
}
