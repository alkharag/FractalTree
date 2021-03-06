private double fractionLength = .8; 
private int smallestBranch = 5; 
private double branchAngle = .5;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,50+1,3*Math.PI/2);
	
	  
} 

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angleAdd= angle + branchAngle;
	double angleMinus = angle - branchAngle;
	branchLength = branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angleAdd) + x);
	int endY1 = (int)(branchLength*Math.sin(angleAdd) + y);
	int endX2 = (int)(branchLength*Math.cos(angleMinus) + x);
	int endY2 = (int)(branchLength*Math.sin(angleMinus) + y);
	stroke(255,255,255);   
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2); 

	if(branchLength >= smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angleAdd);
		drawBranches(endX2,endY2,branchLength,angleMinus);
	}
	// else
	// {
	// 	line(x,y,(float)(endX1+branchLength),(float)(endY2-branchLength));
	// }

} 
