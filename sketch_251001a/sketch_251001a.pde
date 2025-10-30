/* DIVs: 2D Rectangles
*/

// Set fullscreen mode
fullScreen(); // displayWidth and displayHeight
println(displayWidth, displayHeight);

int appWidth = displayWidth;
int appHeight = displayHeight;

// Make the main rectangle smaller
float divWidth = appWidth * 0.5; // 50% of screen width
float divHeight = appHeight * 0.5; // 50% of screen height
float divX = (appWidth - divWidth) / 2;
float divY = (appHeight - divHeight) / 2;

// Make the second square smaller and centered inside the first rectangle
float stopX = divX + divWidth * 1 / 4;
float stopY = divY + divHeight * 1 / 4;
float stopWidth = divWidth * 2 / 4; 
float stopHeight = divHeight * 1 / 2;

// Center the triangle inside the second square
float triangleScale = 0.5; // Scale the triangle to 50% of the second square
float triangleCenterX = stopX + stopWidth / 2;
float triangleCenterY = stopY + stopHeight / 2;

float playX1 = triangleCenterX - (stopWidth * triangleScale) / 2;
float playY1 = triangleCenterY - (stopHeight * triangleScale) / 2;
float playX2 = triangleCenterX + (stopWidth * triangleScale) / 2;
float playY2 = triangleCenterY;
float playX3 = triangleCenterX - (stopWidth * triangleScale) / 2;
float playY3 = triangleCenterY + (stopHeight * triangleScale) / 2;

// Draw shapes
rect(divX, divY, divWidth, divHeight); // Main rectangle
rect(stopX, stopY, stopWidth, stopHeight); // Second square
triangle(playX1, playY1, playX2, playY2, playX3, playY3); // Centered triangle
