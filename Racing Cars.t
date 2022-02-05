setscreen("graphics:991;447")
%Delcare
var font1:int
var font2:int
var font3:int
font1 :=Font.New("Arial Black:20")
font2 :=Font.New("Arial Black:10") 
font3 :=Font.New("Arial Black:20")
var xmouse,ymouse,button : int

%Startsccreen Music Process
var finished : boolean := false
process DoMusic
    loop
	exit when finished
	Music.PlayFile ("StartScreenMusic.mp3")
    end loop
end DoMusic

%Startscreen
fork DoMusic
var background1 := Pic.FileNew ("background1.jpg")
    Pic.Draw (background1, 0, 0, picCopy)
    drawfillbox(400, 0, 600, 45, black)
drawfillbox(440,170,570,230,red)
Font.Draw("Start", 470,190,font1,white)
Font.Draw("Welcome To The Drag Strip", 320,300,font1,white)
Font.Draw("By: Simardeep Kullar", 440,100,font2,white)
loop
mousewhere (xmouse, ymouse, button)
if (xmouse > 450  and xmouse <590) and (ymouse > 180 and ymouse <220)and button = 1 then
exit
end if
end loop
cls

%Guess/Delcare Racing Cars
var carRedPic := Pic.FileNew ("pixelCar.gif")
var carBluePic := Pic.FileNew ("pixelCar2.gif")
var guess : string
Pic.Draw (background1, 0, 0, picCopy)
Font.Draw("Who do you think will win?", 320,300,font1,white)
Font.Draw("White or Yellow", 400,250,font1,white)
Font.Draw("Type in your Answer", 360,200,font1,white)
Pic.Draw (carRedPic, 300, 100, picCopy)
Pic.Draw (carBluePic, 550, 100, picCopy)
get guess
finished := true
Music.PlayFileStop

%Declare
var background := Pic.FileNew ("raceTrack.jpg") 
     Pic.Draw (background, 0, 0, picCopy) 
drawfillbox(0,319, maxx, maxy, green)
var sideCar1 := Pic.FileNew ("sideCar1.gif")
var sideCar2 := Pic.FileNew ("sideCar2.gif")
var sideCar3 := Pic.FileNew ("sideCar3.gif")
var sideCar4 := Pic.FileNew ("sideCar4.gif")
    Pic.Draw (sideCar1, 50, 330, picCopy)
    Pic.Draw (sideCar2, 300, 330, picCopy)
    Pic.Draw (sideCar3, 550, 330, picCopy)
    Pic.Draw (sideCar4, 800, 330, picCopy)
    
    %Output Guess
    Font.Draw("Your guess is:", 10, 420,font1,white)
    Font.Draw(guess, 10, 390,font1,white)
    
drawfillbox(0, 0, maxx, 131, green)
var carRedSprite := Sprite.New (carRedPic)      
var carBlueSprite := Sprite.New (carBluePic) 
     Sprite.Show (carRedSprite) 
     Sprite.Show (carBlueSprite) 
var moveRed := 0
var moveBlue := 0
var xRed := 05 
var xBlue := 05
Sprite.SetPosition (carRedSprite, xRed, 240, false) 
Sprite.SetPosition (carBlueSprite, xBlue, 160, false)

%Countdown Music Process
var finished1 : boolean := false
process DoMusic1
    loop
	exit when finished1
	Music.PlayFile ("Countdown1.mp3")
    end loop
end DoMusic1

%Countdown
fork DoMusic1
delay (50)
    Font.Draw("3..", 500, 20, font3, white)
    delay (1000)
    
    drawfillbox(0, 0, maxx, 131, green)
    Font.Draw("2..", 500, 20, font3, white)
    delay (1000)

    drawfillbox(0, 0, maxx, 131, green)
    Font.Draw("1..", 500, 20, font3, white)
    delay (1000)

    drawfillbox(0, 0, maxx, 131, green)
    Font.Draw("GO!", 500, 20, font3, white)
    delay (1500)
    finished1 := true
    Music.PlayFileStop
    drawfillbox(0, 0, maxx, 131, green)

%Race Music Process
process DoMusic2
    loop
	Music.PlayFile ("backgroundMusic.mp3")
    end loop
end DoMusic2

%Race
fork DoMusic2
for count : 1 .. 1000
Sprite.SetPosition (carRedSprite, xRed, 240, false) 
Sprite.SetPosition (carBlueSprite, xBlue, 160, false) 
randint (moveRed, 1,6)
randint (moveBlue, 1,6)
    delay (10) 
    xRed += moveRed
    xBlue += moveBlue
    
    %Winner prompt
    if (xBlue > 720) and (xRed >720) then
	Font.Draw("It is a tie", 200, 220, font1, red)
	exit                 
    end if
    
    if xRed > 720 then
	Font.Draw("The White car is the winner", 175, 250, font1, white)
	exit                  
    end if

    if xBlue > 720 then
	Font.Draw("The Yellow car is the winner", 175, 175, font1, yellow)
	exit                 
    end if
end for
