// (1,2,3); (2,4,6); (4,5,5); (7,3,11); (9,2,14); (13,7,15); (14,3,17)
// The drawing line as shown on the second diagram is described by the following sequence:

// 1 2 2 4 4 5 5 4 6 0 7 3 11 2 13 7 15 3 17 0
// INPUT SAMPLE:

// Your program should accept as its first argument a path to a filename. Each line in this file is one test case. Each test case will contain the list of triples semicolon separated. E.g.


// 1
// 2
// 3
// (1,2,3);(2,4,6);(4,5,5);(7,3,11);(9,2,14);(13,7,15);(14,3,17)
// (2,22,3);(6,12,10);(15,6,21)
// (1,2,6);(9,23,22);(22,6,24);(8,14,19);(23,12,30)
// OUTPUT SAMPLE:

// The output must describe the drawing line as a vector (X1,H1,X2,H2,X3,H3,X3,Xn-1,Hn-1,Xn) where X is a x-coordinate of a point where the line is changing its direction from horizontal to vertical, and H is a height of the vertical line. You're drawing continuously by starting at the bottom of the first left building and finishing at the bottom of the right building. So for each test case print out the drawing line in a way as it is shown below.


// 1
// 2
// 3
// 1 2 2 4 4 5 5 4 6 0 7 3 11 2 13 7 15 3 17 0
// 2 22 3 0 6 12 10 0 15 6 21 0
// 1 2 6 0 8 14 9 23 22 6 23 12 30 0
// Notice that the elimination of hidden lines is one of the problems that appear in CAD (computer-aided design). 


SkyLine = function(){
  this.sequence = [];
}

SkyLine.prototype.addBuilding = function(building){
  var left = building[0];
  var height = building[1];
  var right = building[2];
}

SkyLine.prototype.printBuilding = function(){
  console.log(this.sequence);
}


var b1 = [1,2,3]; 
var b2 = [2,4,6]; 
var b3 = [4,5,5]; 
var b4 = [7,3,11]; 
var b5 = [9,2,14]; 
var b6 = [13,7,15]; 
var b7 = [14,3,17];
skyLine = new SkyLine();
skyLine.addBuilding(b1);
skyLine.printBuilding();