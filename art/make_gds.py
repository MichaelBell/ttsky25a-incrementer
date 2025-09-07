# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: 2024 Uri Shaked

import gdspy
from PIL import Image

# Open the image
img = Image.open("dragon_inc.png")

LAYER = 71    # met4
DATATYPE = 20 # drawing
PIXEL_SIZE = 0.4 # um

# Convert the image to grayscale
img = img.convert("L")

layout = gdspy.Cell("incrementer_logo")
for y in range(img.height):
    for x in range(img.width):
        color = img.getpixel((x, y))
        if color < 128:
            # Adjust y-coordinate to flip the image vertically
            flipped_y = img.height - y - 1
            layout.add(
                gdspy.Rectangle((x * PIXEL_SIZE, flipped_y * PIXEL_SIZE),
                                ((x + 1) * PIXEL_SIZE, (flipped_y + 1) * PIXEL_SIZE),
                                layer=LAYER, datatype=DATATYPE))

# Save the layout to a file
gdspy.write_gds("incrementer_logo.gds")