# Loner
# Bob Houtkooper
# 08-01-2016

# Make directories and set Working directory
setwd("~/bin/Exercise Lesson 6/Exercise Lesson 6")
dir.create("Data")
dir.create("R")
dir.create("Output")

# Import packages
library(sp)
library(rgeos)
library(rgdal)

# Source functions


# Download data
download.file("http://www.mapcruzin.com/download-shapefile/netherlands-places-shape.zip", 
							destfile="./Data/places.zip", method='wget')

download.file("http://www.mapcruzin.com/download-shapefile/netherlands-railways-shape.zip", 
							destfile="./Data/railways.zip", method='wget')

# Unzip
unzip("./Data/places.zip", exdir="Data")
unzip("./Data/railways.zip", exdir="Data")

# Select the industrial railways 
dsn = file.path("Data", "railways.shp")
ogrListLayers(dsn)
trainrail <- readOGR(dsn, layer = ogrListLayers(dsn))
ind.trainrail <- subset(trainrail, select = type, type == 'industrial')
prj_string_RD <- CRS("+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +towgs84=565.2369,50.0087,465.658,-0.406857330322398,0.350732676542563,-1.8703473836068,4.0812 +units=m +no_defs")
proj4string(ind.trainrail) <- prj_string_RD

# Buffer the industrial railways with a buffer of 1000m
railbuffer <- gBuffer(ind.trainrail, byid = TRUE, width = 1000)

# Find the place (i.e. a city) that intersects with this buffer


# Create a plot that shows the buffer, the points, and the name of the city








