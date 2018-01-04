# Flags: Code test for Properties (swift 4.0)

## Exploring the Code

This project uses self-defined structs to hold the data

- `PropertyTableViewController`: is a table view controller to display a list of property data
- `PropertyDetailTableViewController`: is a view controller to display the description of the property

- `PropertyCell` and `PremiumPropertyCell`: are custom table view cell to display property data 
 
## Requirements
 
### Build
 
Xcode 9.0 or later; iOS 10.0 SDK or later
 
### Runtime
 
iOS 10.0 or later
 
### Introduction

- run `pod install` before launch the project

- Three models to hold properties data and displayed in table view

- Memory issue with loading big size images via SDWebImage, fixed by following solution:
      SDImageCache.shared().config.shouldDecompressImages = false
      SDWebImageDownloader.shared().shouldDecompressImages = false


