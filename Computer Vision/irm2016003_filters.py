##Imports
import cv2
import numpy as numpy
from matplotlib import pyplot as plt 

#loading images
img_moon 	= cv2.imread('moon.png')
img_saturn 	= cv2.imread('Saturn.png')
img_ocv		= cv2.imread('OpenCV.jpg')
saltpepper	= cv2.imread('saltpepper.jpg')
#Filters/Kernels/Masks

#Gaussian Blurring
blur_g	= cv2.GaussianBlur(img_moon, (5,5), 0)

#Median Blurring - Useful in salt and pepper noise
median_blur	= cv2.medianBlur(saltpepper, 5)
#Implementation (in a 5x5 window, find median, and change outlier value)

#Bilateral Filtering


""" Display """
# cv2.imshow('ImageWindow', img_moon)
# cv2.waitKey(0)
# cv2.destroyAllWindows()


# cv2.imshow('Original', saltpepper)
# cv2.imshow('Blurred', median_blur)
# cv2.waitKey(5)
# cv2.destroyAllWindows()
# plt.imshow(saltpepper)
# plt.title('Original')
# plt.xticks([]), plt.yticks([])
# plt.subplot(122),plt.imshow(median_blur),plt.title('Blurred')
# plt.xticks([]), plt.yticks([])
# plt.show()


