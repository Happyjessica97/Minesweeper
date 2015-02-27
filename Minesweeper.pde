

import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS = 20;
public final static int NUM_COLS = 20; 
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined


public void setup (){
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //declare and initialize buttons
    bombs = new ArrayList<MSButton>();
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for(int row = 0; row < NUM_ROWS; row++){
        for(int col = 0; col < NUM_COLS; col++){
            buttons[row][col] = new MSButton(row,col);
        }
    }

    setBombs();
}
public void setBombs()
{
   
    
    for(int i = 0;i < 10; i++ ){ 
    //randomly picks where the bomb will be 
    int row = (int)(Math.random()*20); 
    int col = (int)(Math.random()*20);
    
        if(bombs.contains(buttons[row][col])==false){
            bombs.add(buttons[row][col]);
        }
    }
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    //if()
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        //your code here
        if(keyPressed == true){
            //toggles marked and not marked
            marked = !marked;
        }
        else if(bombs.contains(this)){
            text("you lose dude", 50,50);
        }
        else if(countBombs(r,c) > 0){
            label = "" + countBombs(r,c);
        }
        else{
            if(isValid(r-1,c-1)&& buttons[r-1][c-1].clicked == false){
                buttons[r-1][c-1].mousePressed();
            }
            if(isValid(r-1,c)&& buttons[r-1][c].clicked == false){
                buttons[r-1][c].mousePressed();
            }
            if(isValid(r-1,c+1)&& buttons[r-1][c+1].clicked == false){
                buttons[r-1][c+1].mousePressed();
            
            }
            if(isValid(r,c-1)&& buttons[r][c-1].clicked == false){
                buttons[r][c-1].mousePressed();
            }
            if(isValid(r,c+1)&&buttons[r][c+1].clicked == false){
                buttons[r][c+1].mousePressed();
            }
            if(isValid(r+1,c-1)&& buttons[r+1][c-1].clicked == false){
                buttons[r+1][c-1].mousePressed();
            }
            if(isValid(r+1,c)&& buttons[r+1][c].clicked == false){
                buttons[r+1][c].mousePressed();
            }
            if(isValid(r+1,c+1)&& buttons[r+1][c+1].clicked == false){
             buttons[r+1][c+1].mousePressed();
        }
            //marked = true;
        }
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
            fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        if(r < 0){
            return false;
        }if(r >= 20){
            return false;
        }if(c < 0 ){
            return false; 
        }if(c >= 20){
            return false; 
        }
        return true;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        //your code here
        if(isValid(row-1,col-1)&&bombs.contains(buttons[row-1][col-1])){
            numBombs++;
        }
        if(isValid(row-1,col)&&bombs.contains(buttons[row-1][col])){
            numBombs++;
        }if(isValid(row-1,col+1)&&bombs.contains(buttons[row-1][col+1])){
            numBombs++;
        }if(isValid(row,col-1)&&bombs.contains(buttons[row][col-1])){
            numBombs++;
        }if(isValid(row,col+1)&&bombs.contains(buttons[row][col+1])){
            numBombs++;
        }if(isValid(row+1,col-1)&&bombs.contains(buttons[row+1][col-1])){
            numBombs++;
        }if(isValid(row+1,col)&&bombs.contains(buttons[row+1][col])){
            numBombs++;
        }if(isValid(row+1,col+1)&&bombs.contains(buttons[row+1][col+1])){
            numBombs++;
        }
       return numBombs;
    }
}



