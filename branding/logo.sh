#!/bin/sh

# OpenSCAD to SVG/PNG/PDF/EPS Export Script

INPUT_SCAD="logo.scad"
OUTPUT_NAME="logo"

# Check if input file exists
if [ ! -f "$INPUT_SCAD" ]; then
    echo "Error: Input file '$INPUT_SCAD' not found!"
    exit 1
fi

# Check if OpenSCAD is installed
if ! command -v openscad >/dev/null 2>&1; then
    echo "Error: OpenSCAD is not installed or not in PATH"
    exit 1
fi

# Check if Inkscape is installed (for format conversions)
if ! command -v inkscape >/dev/null 2>&1; then
    echo "Error: Inkscape is not installed or not in PATH"
    echo "Install with: sudo apt install inkscape (Linux) or brew install inkscape (Mac)"
    exit 1
fi

echo "=== Starting Export Process ==="
echo "Input: $INPUT_SCAD"
echo "Output base name: $OUTPUT_NAME"
echo ""

# Step 1: Export from OpenSCAD to SVG
echo "[1/4] Exporting OpenSCAD to SVG..."
openscad -o "${OUTPUT_NAME}_temp.svg" \
         --projection=o \
         --viewall \
         --autocenter \
         "$INPUT_SCAD"

if [ $? -ne 0 ]; then
    echo "Error: OpenSCAD export failed!"
    exit 1
fi

# Step 2: Make all SVG lines black using sed (BSD-compatible)
echo "[2/4] Converting all lines to black..."
sed -e 's/stroke="[^"]*"/stroke="black"/g' \
    -e 's/fill="[^"]*"/fill="black"/g' \
    "${OUTPUT_NAME}_temp.svg" > "${OUTPUT_NAME}.svg"

# Alternative: If you want filled black shapes instead of just outlines:
# sed -e 's/stroke="[^"]*"/stroke="black"/g' \
#     -e 's/fill="[^"]*"/fill="black"/g' \
#     "${OUTPUT_NAME}_temp.svg" > "${OUTPUT_NAME}.svg"

rm "${OUTPUT_NAME}_temp.svg"

# Step 3a: Convert SVG to PNG using Inkscape
echo "[3/4] Converting to PNG..."
inkscape "${OUTPUT_NAME}.svg" \
         --export-type=png \
         --export-filename="${OUTPUT_NAME}_300dpi.png" \
         --export-dpi=300

# Step 3b: Convert SVG to PNG using Inkscape
echo "[3/4] Converting to PNG..."
inkscape "${OUTPUT_NAME}.svg" \
         --export-type=png \
         --export-filename="${OUTPUT_NAME}_600dpi.png" \
         --export-dpi=600

# Step 3c: Convert SVG to PNG using Inkscape
echo "[3/4] Converting to PNG..."
inkscape "${OUTPUT_NAME}.svg" \
         --export-type=png \
         --export-filename="${OUTPUT_NAME}_1200dpi.png" \
         --export-dpi=1200

# Step 4: Convert SVG to PDF and EPS using Inkscape
echo "[4/4] Converting to PDF and EPS..."
inkscape "${OUTPUT_NAME}.svg" \
         --export-type=pdf \
         --export-filename="${OUTPUT_NAME}.pdf"

inkscape "${OUTPUT_NAME}.svg" \
         --export-type=eps \
         --export-filename="${OUTPUT_NAME}.eps"

echo ""
echo "=== Export Complete ==="
