//
//  MTFilterManager.swift
//  MetalFilters
//
//  Created by xushuifeng on 2018/6/10.
//  Copyright © 2018 shuifeng.me. All rights reserved.
//

import Foundation
import UIKit
import MetalPetal

public class MTFilterManager {

    public static let shared = MTFilterManager()

    public var allFilters: [MTFilter.Type] = []
    
    private var resourceBundle: Bundle
    
    private var context: MTIContext?

    public var device = MTLCreateSystemDefaultDevice()!

    public init() {
        
        allFilters.append(MTNormalFilter.self)
        allFilters.append(MTClarendonVideoFilter.self)
        allFilters.append(MTGinghamVideoFilter.self)
        allFilters.append(MTMoonVideoFilter.self)
        allFilters.append(MTLarkFilter.self)
        allFilters.append(MTReyesFilter.self)
        allFilters.append(MTJunoFilter.self)
        allFilters.append(MTSlumberFilter.self)
        allFilters.append(MTCremaFilter.self)
        allFilters.append(MTLudwigFilter.self)
        allFilters.append(MTAdenFilter.self)
        allFilters.append(MTPerpetuaFilter.self)
        allFilters.append(MTAmaroFilter.self)
        allFilters.append(MTMayfairFilter.self)
        allFilters.append(MTRiseFilter.self)
        allFilters.append(MTHudsonFilter.self)
        allFilters.append(MTValenciaFilter.self)
        allFilters.append(MTXpro2Filter.self)
        allFilters.append(MTSierraFilter.self)
        allFilters.append(MTWillowFilter.self)
        allFilters.append(MTLoFiFilter.self)
        allFilters.append(MTEarlybirdFilter.self)
        allFilters.append(MTBrannanFilter.self)
        allFilters.append(MTInkwellFilter.self)
        allFilters.append(MTHefeFilter.self)
        allFilters.append(MTNashvilleFilter.self)
        allFilters.append(MTSutroFilter.self)
        allFilters.append(MTToasterFilter.self)
        allFilters.append(MTWaldenFilter.self)
        allFilters.append(MT1977Filter.self)
        allFilters.append(MTKelvinFilter.self)
        allFilters.append(MTStinsonVideoFilter.self)
        allFilters.append(MTVesperVideoFilter.self)
        allFilters.append(MTMavenVideoFilter.self)
        allFilters.append(MTGinzaVideoFilter.self)
        allFilters.append(MTSkylineVideoFilter.self)
        allFilters.append(MTDogpatchVideoFilter.self)
        allFilters.append(MTBrooklynVideoFilter.self)
        allFilters.append(MTHelenaVideoFilter.self)
        allFilters.append(MTAshbyVideoFilter.self)
        allFilters.append(MTCharmesVideoFilter.self)
        
        context = try? MTIContext(device: MTLCreateSystemDefaultDevice()!)
        
        let bundle = Bundle(for: MTFilterManager.self)
        let url = bundle.url(forResource: "FilterAssets", withExtension: "bundle")!
        resourceBundle = Bundle(url: url)!
    }

    public func url(forResource name: String) -> URL? {
        return resourceBundle.url(forResource: name, withExtension: nil)
    }
    
    public func generateThumbnailsForImage(_ image: UIImage, with type: MTFilter.Type) -> UIImage? {
        let inputImage = MTIImage(cgImage: image.cgImage!, options: [.SRGB: false], isOpaque: true)
        let filter = type.init()
        filter.inputImage = inputImage
        if let cgImage = try? context?.makeCGImage(from: filter.outputImage!) {
            return UIImage(cgImage: cgImage)
        }
        
//        let filter = MTISaturationFilter()
//        filter.saturation = 0
//        filter.inputImage = inputImage
//
//        if let cgImage = try? context?.makeCGImage(from: filter.outputImage!) {
//            return UIImage(cgImage: cgImage)
//        }
        return nil
    }

    public func generate(image: MTIImage) -> UIImage? {
        if let cgImage = try? context?.makeCGImage(from: image) {
            return UIImage(cgImage: cgImage)
        }
        return nil
    }

    public func generateCIImage(image: MTIImage) -> CIImage? {
        if let cgImage = try? context?.makeCIImage(from: image) {
            return cgImage
        }
        return nil
    }
}
