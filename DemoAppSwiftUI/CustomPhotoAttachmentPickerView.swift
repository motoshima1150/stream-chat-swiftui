//
//  CustomPhotoAttachmentPickerView.swift
//  DemoAppSwiftUI
//
//  Created by motoshima1150 on 2022/02/06.
//

import StreamChat
import StreamChatSwiftUI
import SwiftUI

struct CustomPhotoAttachmentPickerView : View {
    
    var assets: PHFetchResultCollection
    var onImageTap: (AddedAsset) -> Void
    var imageSelected: (String) -> Bool
    
    var body: some View {
        PhotoAttachmentPickerView(
            assets: assets,
            onImageTap: { imageAsset in
                onImageTap(downSizeAsset(imageAsset))
            },
            imageSelected: imageSelected
        )
    }
    
    func downSizeAsset(_ asset: AddedAsset) -> AddedAsset {
        print("Get image: \(asset.url)")
        
        // Do down size action
        
        return AddedAsset(image: asset.image, id: asset.id, url: asset.url, type: asset.type)
    }
}
