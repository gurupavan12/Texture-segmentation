# Texture-segmentation
## Gabor filter :
Gabor filter is a linear filter used for texture analysis i.e. basically analyzes whether there are any specific frequency content in the image in specific directions in a localized region around the point or region of analysis. 

## Implementation:
Gabor filter is implemented for different images with different frequencies of interest and standard deviation. Once the image is filtered, it is thresholded by applying a smoothing filter and thus the textures are segmented. 

The project report can be found under Gurudath_Li_Project4_report.pdf which would detail the entire project. 

A brief representation of the input, 3D analysis and output are as follows:
### Input
![alt text](input_texture2.gif "texture1 image")
![alt text](input_texture1.gif "texture2 image")
![alt text](d9d771.gif "texture3 image")

### 3-D Visualization
![alt text](/Visualization_images/texture2_gabor_3d.png "texture1 image")
![alt text](/Visualization_images/texture1_gabor_3d.png "texture2 image")
![alt text](/Visualization_images/d9d771_gabor_3d.png "texture3 image")

### Segmented output image
![alt text](/Visualization_images/texture2_segment.png "texture1 image")
![alt text](/Visualization_images/texture1_segment.png "texture2 image")
![alt text](/Visualization_images/d9d771_segment.png "texture3 image")
