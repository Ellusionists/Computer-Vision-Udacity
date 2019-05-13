import cv2
import numpy as numpy
from matplotlib import pyplot as plt 

#loading images
saltpepper	= cv2.imread('saltpepper.jpg')
img_saturn 	= cv2.imread('Saturn.png')

#Gaussian Blurring
blur1	= cv2.BilateralFilter(saltpepper, (5,5), 0) #Mask size is 5x5, mean 0
blur2	= cv2.BilateralFilter(img_saturn, (5,5), 0)

""" Display """
cv2.imshow('Bilatera lFilter', blur1)
cv2.waitKey(0)
cv2.destroyAllWindows()

"""Img 2 """
# cv2.imshow('Bilateral Filter', blur2)
# cv2.waitKey(0)
# cv2.destroyAllWindows()