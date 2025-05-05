Atlys iOS Take-Home Assignment

Overview

This is a SwiftUI-based implementation of the image carousel on the sign-up screen of the Atlys iOS app. It replicates the animated, zoom-centered carousel with smooth scrolling and page control as shown in the original Atlys design.

Features Implemented

Custom carousel using ScrollView and GeometryReader

Center image zoom-in and side image scaling-down behavior

Page control dots to reflect currently centered item

Smooth, freeform horizontal scrolling with scale and opacity transitions

Carousel respects layout constraints from top and bottom views

Fully extensible with minimal code change for new items

No third-party libraries used – 100% SwiftUI-native


Technical Highlights

Carousel items are laid out using HStack inside a horizontal ScrollView

Each item uses GeometryReader to calculate its position relative to screen center and apply scaling/opacity accordingly

Current visible item is tracked using distance calculation, and reflected in the page control

@State and @Binding variables manage the scrolling state and selected index

Supports rounded image cards, 1:1 aspect ratio, and corner radius

Requirements Fulfilled

Requirement

Status

Smooth pan with tiles moving along

✅

Paginated behavior (snap to nearest)

✅

Zoom-in animation on center image

✅

Only native SwiftUI views used

✅

Carousel items with 1:1 ratio & rounded corners

✅

Dynamic height (resizes with layout)

✅

No view overlap with surrounding views

✅

Full screen width layout

✅

Center image visible and zoomed-in on appear

✅

Easily extensible for more images

✅

Project Structure

ContentView.swift: Main screen layout with logo, carousel, and mobile login input

CardView.swift: Reusable view to render each image with corner radius, text overlays, and a top-right icon

RoundedCorner.swift: Custom shape used for selectively rounding corners

visas on time branding integrated at the top as per app UI

Getting Started

Clone the repo

Open in Xcode 15+

Run on iPhone Simulator or device

Notes

Tested with 3 items, but supports any number of cards

Default starts on the middle card for balanced visual entry

TextField at the bottom can be extended to connect with real login logic (currently prints input to console)

