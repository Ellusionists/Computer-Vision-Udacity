''' HARRIS EDGE DETECTION '''

#Imports
import cv2
import numpy as np
import operator


def main():

    '''
    window_size: The size (side length) of the sliding window
    k: Harris corner constant. Usually 0.04 - 0.06
    threshold: The threshold above which a corner is counted
    '''
    
    window_size = 5
    k = 0.04
    threshold = 10000

    img = cv2.imread('checkerboard.png')
    img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
    
    finalImg = findCorners(img, (int)(window_size), k, threshold)
    cv2.imwrite("finalimage.png", finalImg)

def findCorners(img, window_size, k, threshold):

    #Find x and y derivatives
    dy, dx = np.gradient(img)
    Ixx = dx**2
    Ixy = dy*dx
    Iyy = dy**2
    height = img.shape[0]
    width = img.shape[1]

    newImg = img.copy()
    color_img = cv2.cvtColor(newImg, cv2.COLOR_GRAY2RGB)
    offset = (int)(window_size/2)

    #Loop through image and find our corners

    for y in range(offset, height-offset):
        for x in range(offset, width-offset):
            #Calculate sum of squares
            windowIxx = Ixx[y-offset:y+offset+1, x-offset:x+offset+1]
            windowIxy = Ixy[y-offset:y+offset+1, x-offset:x+offset+1]
            windowIyy = Iyy[y-offset:y+offset+1, x-offset:x+offset+1]
            Sxx = windowIxx.sum()
            Sxy = windowIxy.sum()
            Syy = windowIyy.sum()

            #Find determinant and trace, use to get corner response
            det = (Sxx * Syy) - (Sxy**2)
            trace = Sxx + Syy
            r = det - k*(trace**2)

            #If corner response is over threshold, color the point
            if r > threshold:
                color_img.itemset((y, x, 0), 0)
                color_img.itemset((y, x, 1), 0)
                color_img.itemset((y, x, 2), 255)
    return color_img

if __name__ == "__main__":
    main()