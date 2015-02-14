/*global console, alert */

navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia || undefined;
var videoElement;

function initializeWebcamSwiper() {
	if (navigator.getUserMedia === undefined) {
		if (console !== undefined) {
			console.log("Browser doesn't support getUserMedia");
			return;
		}
	}

	navigator.getUserMedia({video: true, audio: false}, function (stream) {
		window.webcamSwiperStream = stream;

		// Create a video element and set its source to the stream from the webcam
		videoElement = document.createElement("video");
		videoElement.style.display = "none";
		document.getElementsByTagName("body")[0].appendChild(videoElement);
		if (window.URL === undefined) {
			window.URL = window.webkitURL;
		}

		if (videoElement.mozSrcObject !== undefined) {
			videoElement.mozSrcObject = stream;
		}
		else {
			videoElement.src = window.URL.createObjectURL(stream);
		}
		videoElement.play();

		// Wait for the video element to initialize
		videoElement.addEventListener("loadeddata", startSwipeRecogntion);
	}, function(err) {
		console('Something went wrong in getUserMedia');
	});
}

function startSwipeRecogntion() {
	// Now that the video element has been initialized, determine the webcam resolution from it
	var horizontalResolution = videoElement.videoWidth;
	var verticalResolution = videoElement.videoHeight;

	if (horizontalResolution < 1 || horizontalResolution > 4000) {
		setTimeout(startSwipeRecogntion, 100);
		console.log('Trying again');
		return;
	}

	var canvasWidth = horizontalResolution > 320 ? 320 : horizontalResolution;
	var canvasHeight = verticalResolution > 240 ? 240 : verticalResolution;

	// Create the canvas that we will draw to
	var greyScaleCnvs = document.createElement("canvas");
	greyScaleCnvs.width = canvasWidth;
	greyScaleCnvs.height = canvasHeight;
	var greyscaleCtx = greyScaleCnvs.getContext("2d");
	var currentImageData = greyscaleCtx.createImageData(canvasWidth, canvasHeight);

	// Initialize some variables we will reference each frame
	var isActive = false;
	var remainingFrames = 14;
	var PIXEL_CHANGE_THRESHOLD = 30;
	var FRAME_THRESHOLD = 15000;
	var originalWeight = 0;
	var previousImageData;
	var lightLevel = 0;
	var scanCount = 0;
	var frameAnalysisTime = 36;

	// every ?th of a second, sample the video stream
	window.webcamSwiperInterval = setInterval(analyzeCurrentFrame, 1000/28);

	function analyzeCurrentFrame() {
		// Start the timer
		var startTime = new Date().getTime();

		scanCount++;

		previousImageData = currentImageData;

		// Draw the current video frame onto a canvas so we can desaturate the image
		greyscaleCtx.drawImage(videoElement, 0, 0, horizontalResolution, verticalResolution, 0, 0, canvasWidth, canvasHeight);

		// Desaturate it
		currentImageData = deSaturate(greyscaleCtx.getImageData(0, 0, canvasWidth, canvasHeight));

		// Make adjustments for light level and system speed
		if (scanCount % 50 === 0) {
			// Calibrate based on the current light level, if we haven't already
			lightLevel = getLightLevel(currentImageData);
			if (lightLevel > 0 && lightLevel <= 1) {
				PIXEL_CHANGE_THRESHOLD = 25;
				FRAME_THRESHOLD = 3000;
			}
			else if (lightLevel > 1 && lightLevel < 3) {
				PIXEL_CHANGE_THRESHOLD = 28;
				FRAME_THRESHOLD = 6000;
			}
			else {
				PIXEL_CHANGE_THRESHOLD = 30;
				FRAME_THRESHOLD = 15000;
			}

			// Adjust frame scan rate if needed
			if (frameAnalysisTime > 36) {
				clearInterval(window.webcamSwiperInterval);
				window.webcamSwiperInterval = setInterval(analyzeCurrentFrame, 1000 / (frameAnalysisTime * 2)); // Add some buffer
			}
		}

		// Map the pixels that are changing
		var currentWeight = getMotionWeight(previousImageData, currentImageData);

		// If we aren't actively looking for a spike the opposite direction, check if we should start
		if (!isActive) {
			if (Math.abs(currentWeight) > FRAME_THRESHOLD) {
				isActive = true;
				remainingFrames = 8;
				originalWeight = currentWeight;
			}
		}

		// If we are actively looking for a spike, see if it has occurred within the allowed number of frames
		if (isActive) {
			if (remainingFrames <= 0) {
				isActive = false;
			}
			else {
				remainingFrames--;
				if (originalWeight > 0) {
					if (currentWeight < -FRAME_THRESHOLD) {
						fireSwipeEvent("webcamSwipeRight");
						isActive = false;
					}
				}
				else {
					if (currentWeight > FRAME_THRESHOLD) {
						fireSwipeEvent("webcamSwipeLeft");
						isActive = false;
					}
				}
			}
		}

		// Stop the timer
		var endTime = new Date().getTime();
		frameAnalysisTime = endTime - startTime;
	}

	function fireSwipeEvent(eventName) {
		var swipeLeftEvent = document.createEvent("UIEvents");
		swipeLeftEvent.initEvent(eventName, false, false);
		document.getElementsByTagName("body")[0].dispatchEvent(swipeLeftEvent);
	}

	function getMotionWeight (previous, current) {
		var motionWeight = 0;
		var previousData = previous.data;
		var currentData = current.data;
		var dataLength = previousData.length;
		for (var i = 0; i < dataLength; i += 4) {
			if (Math.abs(previousData[i] - currentData[i]) > PIXEL_CHANGE_THRESHOLD) {
				motionWeight += ((i / 4) % canvasWidth) - (canvasWidth / 2);
			}
		}
		return motionWeight;
	}

	// Takes and ImageData and returns an equally sized Image Data which is desaturated
	function deSaturate (imageData) {
		var theData = imageData.data;
		var newImageData = greyscaleCtx.createImageData(imageData);
		var newData = newImageData.data;

		// Iterate through each pixel, desaturating it
		var dataLength = theData.length;
		for (var i = 0; i < dataLength; i += 4) {
			// To find the desaturated value, average the brightness of the red, green, and blue values
			var average = (theData[i] + theData[i + 1] + theData[i + 2]) / 3;
			newData[i] = newData[i+1] = newData[i+2] = average;

			// Fully opaque
			newData[i+3] = 255;
		}

		return newImageData;
	}

	// Will return the average intensity of all pixels.  Used for calibrating sensitivity based on room light level.
	function getLightLevel (imageData) {
		var theData = imageData.data;
		var dataLength = theData.length;

		var value = 0;
		for (var i = 0; i < dataLength; i += 4) {
			value += theData[i];
		}

		return value / theData.length;
	}
}

function destroyWebcamSwiper() {
	if (window.webcamSwiperInterval !== undefined) {
		clearInterval(window.webcamSwiperInterval);
		window.webcamSwiperInterval = undefined;
	}
	if (window.webcamSwiperStream !== undefined) {
		window.webcamSwiperStream.stop();
		window.webcamSwiperStream = undefined;
	}
}
