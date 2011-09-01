/* 
Atoms
Alan Ball
*/  
   
            
class Atom{
    int X,Y,nX,nY,atomicNumber,radius,delay; 

        String atomicName = []; 
        int valenceNumber = []; 
            
           
         
    Atom(int tX,int tY,int tatomicNumber){
        X = tX;
        Y = tY;
        nX = X;
        nY = Y;
        atomicNumber = tatomicNumber;
        radius = 30;
        delay = 50;
            atomicName[1] = "H";
            atomicName[2] = "He";
            atomicName[3] = "Li";
            atomicName[4] = "Be";
            atomicName[5] = "B";
            atomicName[6] = "C";
            atomicName[7] = "N"; 
            atomicName[8] = "O"; 
            atomicName[9] = "F"; 
            atomicName[10] = "Ne"; 
            atomicName[11] = "Na"; 
            atomicName[12] = "Mg"; 
            atomicName[13] = "Al"; 
            atomicName[14] = "Si"; 
            atomicName[15] = "P"; 
            atomicName[16] = "S"; 
            atomicName[17] = "Cl"; 
            atomicName[18] = "Ar"; 
            atomicName[19] = "K"; 
            atomicName[20] = "Ca"; 
            atomicName[21] = "Sc"; 
            atomicName[22] = "Ti";
            atomicName[23] = "V";
            atomicName[24] = "Cr"; 
            atomicName[25] = "Mn"; 
            atomicName[26] = "Fe"; 
            atomicName[27] = "Co";
            atomicName[28] = "Ni";
            atomicName[29] = "Cu";
            atomicName[30] = "Zn"; 

            valenceNumber[1] = 1; 
            valenceNumber[2] = 2; 
            valenceNumber[3] = 1;
            valenceNumber[4] = 2; 
            valenceNumber[5] = 3; 
            valenceNumber[6] = 4; 
            valenceNumber[7] = 5; 
            valenceNumber[8] = 6; 
            valenceNumber[9] = 7; 
            valenceNumber[10] = 8; 
            valenceNumber[11] = 1; 
            valenceNumber[12] = 2; 
            valenceNumber[13] = 3; 
            valenceNumber[14] = 4; 
            valenceNumber[15] = 5; 
            valenceNumber[16] = 6; 
            valenceNumber[17] = 7; 
            valenceNumber[18] = 8; 
            valenceNumber[19] = 1;
            valenceNumber[20] = 2; 
            valenceNumber[21] = 3; 
            valenceNumber[22] = 4; 
            valenceNumber[23] = 5; 
            valenceNumber[24] = 6; 
            valenceNumber[25] = 7; 
            valenceNumber[26] = 8; 
            valenceNumber[27] = 8; 
            valenceNumber[28] = 8; 
            valenceNumber[29] = 1; 
            valenceNumber[30] = 1;
           
    }

    void moveAtom(){
        nX = int(random(600));
        nY = int(random(600));
            // Track  circle to new destination
        X+=(nX-X)/delay;
        Y+=(nY-Y)/delay;
    }

    void drawAtom(){
        radius = radius + sin( frameCount / 4 );
        int delay = 20;
        int valenceElectrons;
        fill(255);
        stroke(120,60);
        ellipse(X,Y,80,80);
        // black
        fill(0);

        // white
        stroke(255 ,120); 
        ellipse(X,Y,radius,radius);
        valenceElectrons = valenceNumber[atomicNumber]; 
        for(i = 0; i < valenceElectrons; i++){    
            drawElectron(X,Y,(i+1)*1.8, 40);
        }

        PFont font;
        font = loadFont("FFScala-32.vlw"); 
        textFont(font);     
        fill(255);
        text(atomicName[atomicNumber], X-5,Y+5);
        fill(120);
        text(valenceElectrons.toString(),X+15,Y+20); 
        }

}

void drawElectron(int X,int Y,float offset, int radius){    
    float m = (millis()/2000)*offset;
                eX = sin(m) * (radius ) + X;
                eY = cos(m) * (radius ) + Y; 
    ellipse(eX,eY, 6, 6);    
}


Atom atom;   

// Setup the Processing Canvas
void setup(){

    
    size( 600, 600 );
    strokeWeight( 5 );
    frameRate( 15 );
    randomSeed(millis());
    atom = new Atom(int(random(0,600)),int(random(0,600)),int(random(0,30)));
     
}

// Main draw loop
void draw(){   
    //white
    background( 255 );
    atom.drawAtom();
    atom.moveAtom();
}




