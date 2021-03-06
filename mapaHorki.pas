///
/// HORKI HISTORY MAP
///
/// Author: Gudkov A
/// Monuments: Yusupov N
/// Under direction of: Dronina V
/// Gimnasium №1 2018
///
program International_Map_of_Horki_town;

uses GraphABC, System.Media;
var
  {Sound_layer}
  ///
    Soundlayer1 := new SoundPlayer();
    Soundlayer2 := new SoundPlayer();
    layerMenu := new SoundPlayer();
  ///
  {Itt}
  lm,
  x, y, xm, ym, x0, y0, xmn, ymn,
  xin, yin, xp, yp, 
  xsh, ysh,
  xsp,ysp,
  mapWidth, mapHeight
  : integer;
  {mass:}
  xst, yst, xys, xst0,yst0,
  xcr,ycr,
  xl, yl: array[1..14] of 
  integer;
  {Beet}
  i, ds, mapsize, light, minist, Info
  : byte;
  {bool}
  gm, move,
  search, shirm,
  searchUp, InfoUP, shirmUP,REpostUp,
  open, openMAP,closeMAP,
  check,post,repost,
  sprav
  : boolean;
  {Pic}
  menu, horki1, horki6, Mhorki, spravka,
  start0, start1, botn, botn1, txt0, lupa,q7,
  staru, stars, miniM,
  pic21, pic22,pic3, pic4, pic5, pic6, pic7, pic28, pic29, pic10, pic11, pic12, pic13, pic31, pic32, pic33, 
  txt21, txt22,txt3, txt4, txt5, txt6, txt7, txt28, txt29, txt10, txt11, txt12, txt13, txt31, txt32, txt33,
  txts,
  allea,
  exit
  : picture;
  linee,corn: array[1..5] of 
  picture;
{Printing}
procedure mouseDown(x001, y001, mousebutton1: integer);
begin
  if mousebutton1 = 1 then move := true;
  x0 := x001; 
  y0 := y001; 
  if (x001 >= WindowWidth - 60) and (y001 >= WindowHeight - 60) and (x001 <= WindowWidth - 20) and (y001 <= WindowHeight - 20) and (mousebutton1 = 1) and (mapsize < 6) and (mapsize > 1) then begin
                                                                                                                                                                                                mapsize := mapsize + 1; 
                                                                                                                                                                                                check := true;
                                                                                                                                                                                                end;
  if (x001 >= WindowWidth - 120) and (y001 >= WindowHeight - 60) and (x001 <= WindowWidth - 80) and (y001 <= WindowHeight - 20) and (mousebutton1 = 1) and (mapsize <= 6) and (mapsize > 2) then begin
                                                                                                                                                                                                    mapsize := mapsize - 1;
                                                                                                                                                                                                    check := true;
                                                                                                                                                                                                  end;
   {UpShirm}
  if (x001 >= 327) and (y001 >= WindowHeight - 51) and (x001 <= WindowWidth - 327) and (y001 <= WindowHeight - 9) and (mousebutton1 = 1) and (mapsize = 1) then begin
                                                                                                                                                                  shirm := true;
                                                                                                                                                                  xsh := 150;
                                                                                                                                                                  ysh := 800
                                                                                                                                                                end;
  if (x001 >= 327) and (y001 >= ysh - 51) and (x001 <= WindowWidth - 327) and (y001 <= ysh - 9) and (y001 <= 500) and (mousebutton1 = 1) and (mapsize = 1) and (shirm) then shirmUP := true;
  
  {=============Map===Open=============}
  if (x001 >= WindowWidth - 65) and (y001 >= WindowHeight - 55) and (x001 <= WindowWidth - 20) and (y001 <= WindowHeight - 10) and (mousebutton1 = 1) and (mapsize = 1) then begin
                                                                                                                                                                              //soundlayer1.Play();
                                                                                                                                                                              for var k := 1 to 5 do 
                                                                                                                                                                              begin
                                                                                                                                                                                xl[k] := 800 + (k - 1) * 120;
                                                                                                                                                                                yl[k] := 0 + (k - 1) * 160
                                                                                                                                                                              end;
                                                                                                                                                                              
                                                                                                                                                                              openMAP := true;
                                                                                                                                                                              
                                                                                                                                                                            end; 

  {=============Map===Close=========}  
  if (x001 >= 20) and (y001 >= windowHeight-60) and (x001 <= 60)and(y001 <= windowHeight-20)and(mousebutton1 = 1)and(mapsize > 1)and(repost=false)and(post=false)and(search=false)and(sprav=false) then begin
                                                                                                                                                                                                           //soundlayer1.stop();
                                                                                                                                                                                                           closeMAP := true;
                                                                                                                                                                                                           xcr[1] := -400;
                                                                                                                                                                                                           ycr[1] := -400;
                                                                                                                                                                                                           
                                                                                                                                                                                                           xcr[2] := 800;
                                                                                                                                                                                                           ycr[2] := -400;
                                                                                                                                                                                                           
                                                                                                                                                                                                           xcr[3] :=  800;
                                                                                                                                                                                                           ycr[3] :=  800;
                                                                                                                                                                                                           
                                                                                                                                                                                                           xcr[4] := -400;
                                                                                                                                                                                                           ycr[4] :=  800;
                                                                                                                                                                                                           //soundlayer1.Play();
                                                                                                                                                                                                         end;
 {=============Spravka_Open=========}  
  if (x001 >= 20) and (y001 >= 20) and (x001 <= 60)and(y001 <= 60)and(mousebutton1 = 1)and(mapsize > 1)and(search=false)and(repost=false)and(post=false) then begin
                                                                                                                                                               sprav := true;
                                                                                                                                                               xsp := 200;
                                                                                                                                                               ysp := 200;
                                                                                                                                                               xp := 400;
                                                                                                                                                               yp := 900;
                                                                                                                                                              end;
 {============Spravka_Close=========}  
  if (x001 >= xp-20) and (y001 >= yp-20) and (x001 <= xp+20)and(y001 <= yp+20)and(mousebutton1 = 1)and(mapsize > 1)and(sprav) then begin
                                                                                                                                     sprav := false;
                                                                                                                                     check := true;
                                                                                                                                   end;  
 {===REpost_1-2/8-9_close===}  
  if (x001 >= xin-50) and (y001 >= yin+30) and (x001 <= xin-10)and(y001 <= yin+70)and(mousebutton1 = 1)and(mapsize > 1)and(repost) then begin
                                                                                                                                     repostUP := true
                                                                                                                                        end;
 {===REpost_1-2_info1====}  
  if (x001 >= xin) and (y001 >= yin) and (x001 <= xin+250)and(y001 <= yin+100)and(mousebutton1 = 1)and(mapsize > 1)and(repost)and(info=1) then begin
                                                                                                                                                post := true;
                                                                                                                                                repost := false;
                                                                                                                                                Info := 21;
                                                                                                                                                xin := -400;
                                                                                                                                                yin := 150;
                                                                                                                                                xp := 1000;
                                                                                                                                                yp := 150;  
                                                                                                                                               end;                                                                                                                               
 {===REpost_1-2_info2===}  
  if (x001 >= xp) and (y001 >= yp) and (x001 <= xp+250)and(y001 <= yp+100)and(mousebutton1 = 1)and(mapsize > 1)and(repost)and(info=1) then begin
                                                                                                                                            post := true;
                                                                                                                                            repost := false;
                                                                                                                                            Info := 22;
                                                                                                                                            xin := -400;
                                                                                                                                            yin := 150;
                                                                                                                                            xp := 1000;
                                                                                                                                            yp := 150;     
                                                                                                                                           end;                                                                                                                                                             
                                                                                                                               
 {===REpost_8-9_info1====}  
  if (x001 >= xin) and (y001 >= yin) and (x001 <= xin+250)and(y001 <= yin+100)and(mousebutton1 = 1)and(mapsize > 1)and(repost)and(info=8) then begin
                                                                                                                                                post := true;
                                                                                                                                                repost := false;
                                                                                                                                                Info := 28;
                                                                                                                                                xin := -400;
                                                                                                                                                yin := 150;
                                                                                                                                                xp := 1000;
                                                                                                                                                yp := 150;  
                                                                                                                                               end;                                                                                                                               
 {===REpost_8-9_info2===}  
  if (x001 >= xp) and (y001 >= yp) and (x001 <= xp+250)and(y001 <= yp+100)and(mousebutton1 = 1)and(mapsize > 1)and(repost)and(info=8) then begin
                                                                                                                                            post := true;
                                                                                                                                            repost := false;
                                                                                                                                            Info := 29;
                                                                                                                                            xin := -400;
                                                                                                                                            yin := 150;
                                                                                                                                            xp := 1000;
                                                                                                                                            yp := 150;     
                                                                                                                                           end;         
                                                                                                                                           
 {===REpost_10-11_info1====}  
  if (x001 >= xin) and (y001 >= yin) and (x001 <= xin+250)and(y001 <= yin+100)and(mousebutton1 = 1)and(mapsize > 1)and(repost)and(info=10) then begin
                                                                                                                                                post := true;
                                                                                                                                                repost := false;
                                                                                                                                                Info := 31;
                                                                                                                                                xin := -400;
                                                                                                                                                yin := 150;
                                                                                                                                                xp := 1000;
                                                                                                                                                yp := 150;  
                                                                                                                                               end;                                                                                                                               
 {===REpost_10-11_info2===}  
  if (x001 >= xp) and (y001 >= yp) and (x001 <= xp+250)and(y001 <= yp+100)and(mousebutton1 = 1)and(mapsize > 1)and(repost)and(info=10) then begin
                                                                                                                                            post := true;
                                                                                                                                            repost := false;
                                                                                                                                            Info := 32;
                                                                                                                                            xin := -400;
                                                                                                                                            yin := 150;
                                                                                                                                            xp := 1000;
                                                                                                                                            yp := 150;    
                                                                                                                                            end; 
 {===REpost_10-11_info3===}    
  if (x001 >= xsp) and (y001 >= ysp) and (x001 <= xsp+250)and(y001 <= ysp+100)and(mousebutton1 = 1)and(mapsize > 1)and(repost)and(info=10) then begin
                                                                                                                                            post := true;
                                                                                                                                            repost := false;
                                                                                                                                            Info := 33;
                                                                                                                                            xin := -400;
                                                                                                                                            yin := 150;
                                                                                                                                            xp := 1000;
                                                                                                                                            yp := 150;     
                                                                                                                                           end;                                                                                                                                                                                                                                                                                                                                         


 {==============Menu================} 
  if (x001 >= WindowWidth - 60) and (y001 >= WindowHeight - 120) and (x001 <= WindowWidth - 20) and (y001 <= WindowHeight - 80) and (mousebutton1 = 1)and(repost=false)and(post=false)and(mapsize>1) then begin
                                                                                                                                                                                                            
                                                                                                                                                                                                            search := true;
                                                                                                                                                                                                            xmn := windowWidth div 2 - 200;
                                                                                                                                                                                                            ymn := -600;
                                                                                                                                                                                                          end;
  if (x001 >= xmn + 145) and (y001 >= ymn + 650) and (x001 <= xmn + 255) and (y001 <= ymn + 680) and (mousebutton1 = 1) and (search) then begin
                                                                                                                                            searchUp := true;
                                                                                                                                          end;
  
 {===========Info_Posts=============}
  for var m := 1  to 14 do  if (x001 >= x+xst[m]) and (y001 >= y+yst[m]) and (x001 <= x+xst[m] + ds) and (y001 <= y+yst[m] + ds) and (mapsize > 3)and (mousebutton1 = 1)and(repost=FALSE)and(search=false)and(info=0)and(sprav=false) then begin
                                                                                                                                                                                                                                           //soundlayer2.Play(); 
                                                                                                                                                                                                                                           sleep(10);
                                                                                                                                                                                                                                            post := true;
                                                                                                                                                                                                                                            Info := m;
                                                                                                                                                                                                                                            xin := -400;
                                                                                                                                                                                                                                            yin := 150;
                                                                                                                                                                                                                                            xp := 1000;
                                                                                                                                                                                                                                            yp := 150; 
                                                                                                                                                                                                                                            if (info = 1)or(info = 8) then begin
                                                                                                                                                                                                                                                                             repost  := true;
                                                                                                                                                                                                                                                                             post := false;
                                                                                                                                                                                                                                                                             xin := -300;
                                                                                                                                                                                                                                                                             yin := 300;
                                                                                                                                                                                                                                                                             xp := 800;
                                                                                                                                                                                                                                                                             yp := 400;
                                                                                                                                                                                                                                                                           end;
                                                                                                                                                                                                                                            if (info = 10) then begin
                                                                                                                                                                                                                                                                 repost  := true;
                                                                                                                                                                                                                                                                 post := false;
                                                                                                                                                                                                                                                                 xin := -300;
                                                                                                                                                                                                                                                                 yin := 300;
                                                                                                                                                                                                                                                                 xp := 800;
                                                                                                                                                                                                                                                                 yp := 400;
                                                                                                                                                                                                                                                                 xsp := -300;
                                                                                                                                                                                                                                                                 ysp := 500;
                                                                                                                                                                                                                                                               end;
                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                          end; 
 {===========Info_Post_Close========}
  if (x001 >= xin+355) and (y001 >= yin+405) and (x001 <= xin+400) and (y001 <= yin+450) and (mousebutton1 = 1) and (info <> 0) then infoUP := true;
  
  {Label TODO}
  if search then 
  begin
    if (x001 >= xmn + 20) and (y001 >= ymn + 68) and (x001 <= xmn + 333) and (y001 <= ymn + 108)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := 36;
                                                                                                                            y := 925
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 108) and (x001 <= xmn + 358) and (y001 <= ymn + 148)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := 36;
                                                                                                                            y := 925
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 148) and (x001 <= xmn + 290) and (y001 <= ymn + 170)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := -817;
                                                                                                                            y := -1213
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 188) and (x001 <= xmn + 211) and (y001 <= ymn + 210)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := -651;
                                                                                                                            y := 1819
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 228) and (x001 <= xmn + 290) and (y001 <= ymn + 250)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := 23;
                                                                                                                            y := -87
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 268) and (x001 <= xmn + 217) and (y001 <= ymn + 290)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := -691;
                                                                                                                            y := -920
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 308) and (x001 <= xmn + 365) and (y001 <= ymn + 348)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := -387;
                                                                                                                            y := 314
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 348) and (x001 <= xmn + 195) and (y001 <= ymn + 370)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := -112;
                                                                                                                            y := 14
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 388) and (x001 <= xmn + 131) and (y001 <= ymn + 410)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := 484;
                                                                                                                            y := -232
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 428) and (x001 <= xmn + 165) and (y001 <= ymn + 450)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := 484;
                                                                                                                            y := -232
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 468) and (x001 <= xmn + 211) and (y001 <= ymn + 490)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := 281;
                                                                                                                            y := -60
                                                                                                                           end; 
    if (x001 >= xmn + 20) and (y001 >= ymn + 508) and (x001 <= xmn + 405) and (y001 <= ymn + 530)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := -730;
                                                                                                                            y := -1356
                                                                                                                           end;
    if (x001 >= xmn + 20) and (y001 >= ymn + 548) and (x001 <= xmn + 385) and (y001 <= ymn + 588)and(mousebutton1 = 1) then begin
                                                                                                                            searchUp := true;
                                                                                                                            check := true;
                                                                                                                            mapsize := 6;
                                                                                                                            x := -474;
                                                                                                                            y := -3130
                                                                                                                           end;

  end;
end;
{Buttun UP}  
procedure mouseUp(x002, y002, mousebutton2: integer);
begin
  if mousebutton2 = 1 then move := false
end;

{Mouse Position}  
procedure mouseMove(x003, y003, mousebutton3: integer);
begin
  xm := x003;
  ym := y003;
   {Highlight_Post} 
  if search then                                
  begin
    if (x003 >= xmn + 20) and (y003 >= ymn + 68) and (x003 <= xmn + 333) and (y003 <= ymn + 108) then begin
                                                                                                        light := 1;
                                                                                                        //soundlayer2.Play()
                                                                                                      end
                                                                                                 else
    if (x003 >= xmn + 20) and (y003 >= ymn + 108) and (x003 <= xmn + 358) and (y003 <= ymn + 148) then light := 2 else 
    if (x003 >= xmn + 20) and (y003 >= ymn + 148) and (x003 <= xmn + 290) and (y003 <= ymn + 170) then light := 3 else 
    if (x003 >= xmn + 20) and (y003 >= ymn + 188) and (x003 <= xmn + 211) and (y003 <= ymn + 210) then light := 4 else 
    if (x003 >= xmn + 20) and (y003 >= ymn + 228) and (x003 <= xmn + 290) and (y003 <= ymn + 250) then light := 5 else
    if (x003 >= xmn + 20) and (y003 >= ymn + 268) and (x003 <= xmn + 217) and (y003 <= ymn + 290) then light := 6 else
    if (x003 >= xmn + 20) and (y003 >= ymn + 308) and (x003 <= xmn + 365) and (y003 <= ymn + 348) then light := 7 else 
    if (x003 >= xmn + 20) and (y003 >= ymn + 348) and (x003 <= xmn + 195) and (y003 <= ymn + 370) then light := 8 else 
    if (x003 >= xmn + 20) and (y003 >= ymn + 388) and (x003 <= xmn + 131) and (y003 <= ymn + 410) then light := 9 else 
   {=>}
    if (x003 >= xmn + 20) and (y003 >= ymn + 428) and (x003 <= xmn + 165) and (y003 <= ymn + 450) then light := 10 else 
    if (x003 >= xmn + 20) and (y003 >= ymn + 468) and (x003 <= xmn + 211) and (y003 <= ymn + 490) then light := 11 else 
    if (x003 >= xmn + 20) and (y003 >= ymn + 508) and (x003 <= xmn + 190) and (y003 <= ymn + 530) then light := 12 else 
    if (x003 >= xmn + 20) and (y003 >= ymn + 548) and (x003 <= xmn + 190) and (y003 <= ymn + 570) then light := 13 else light := 0
  end;
   {Open_Post}
  if (x003 >= WindowWidth - 65) and (y003 >= WindowHeight - 55) and (x003 <= WindowWidth - 20) and (y003 <= WindowHeight - 10) and (mapsize = 1) then open := true else open := false;
   {Mini_Star}
   for var m := 1  to 14 do  if (x003 >= x+xst[m]) and (y003 >= y+yst[m]) and (x003 <= x+xst[m] + ds) and (y003 <= y+yst[m] + ds) and (mapsize > 3) then begin
                                                                                                                                                  minist := m;
                                                                                                                                                  break
                                                                                                                                               end
                                                                                                                                           else minist := 0;
end;
BEGIN{todo}

  gm := true;
  search := false;
  shirm := false;
  searchUp := false;
  INFOUp := false;
  shirmUp := false;
  openMAP := false;                                                               
  post := false; 
  closeMAP := false; 
  sprav := false; 
  REpostUp := false; 
  info := 0;
  {Sound_layer}
    layerMenu.SoundLocation := 'database\wav-music\sndMenu.wav';
  {Intro} 
  start0 := picture.create('database\start0.jpg'); 
  start1 := picture.create('database\start1.jpg'); 
  botn := picture.create('database\botn.png'); 
  botn1 := picture.create('database\botn1.png'); 
  
  lupa := picture.create('database\lupa.png');
  {lines-12345} 
  linee[1] := picture.create('database\1to2\line1.jpg');
  linee[2] := picture.create('database\1to2\line2.jpg');
  linee[3] := picture.create('database\1to2\line3.jpg');
  linee[4] := picture.create('database\1to2\line4.jpg');
  linee[5] := picture.create('database\1to2\line5.jpg');
  {Corners-1234}
  corn[1] := picture.create('database\mto1\corner1.png');
  corn[2] := picture.create('database\mto1\corner2.png');
  corn[3] := picture.create('database\mto1\corner3.png');
  corn[4] := picture.create('database\mto1\corner4.png');
  {Mapa} 
  horki1 := picture.create('database\HORKImap.png');
  horki6 := picture.create('database\HORKImap6.png');
  Mhorki := picture.create('database\HORKImapMenu.png');
  Menu := picture.create('database\Menu.png');
  MiniM := picture.create('database\MiniM.png');
  staru := picture.create('database\star.png');
  q7 := picture.create('database\7.png');
  stars := picture.create('database\star2.png');
  exit :=  picture.create('database\exit.png');
  spravka :=  picture.create('database\spravka.png');
  {post-png}
  pic21 := picture.create('database\pics\pic21.png');
  pic22 := picture.create('database\pics\pic22.png');
  pic3 := picture.create('database\pics\pic3.png');
  pic4 := picture.create('database\pics\pic4.png');
  pic5 := picture.create('database\pics\pic5.png');
  pic6 := picture.create('database\pics\pic6.png');
  pic7 := picture.create('database\pics\pic7.png');
  pic28 := picture.create('database\pics\pic28.png'); 
  pic29 := picture.create('database\pics\pic29.png'); 
  pic10 := picture.create('database\pics\pic10.png'); 
  pic11 := picture.create('database\pics\pic11.png'); 
  pic12 := picture.create('database\pics\pic12.png'); 
  pic13 := picture.create('database\pics\pic13.png'); 
  pic31 := picture.create('database\pics\pic31.png'); 
  pic32 := picture.create('database\pics\pic32.png'); 
  pic33 := picture.create('database\pics\pic33.png'); 
 
  allea := picture.create('database\HeroAllea.jpg');
  txts := picture.create('database\txts\txts.jpg');
  txt0 := picture.create('database\txts\txt0.png');
  
 {post-txts}
  txt21 := picture.create('database\txts\txt21.png');
  txt22 := picture.create('database\txts\txt21.png');
  txt3 := picture.create('database\txts\txt3.png');
  txt4 := picture.create('database\txts\txt4.png');
  txt5 := picture.create('database\txts\txt5.png');
  txt6 := picture.create('database\txts\txt6.png');
  txt7 := picture.create('database\txts\txt7.png');
  txt28 := picture.create('database\txts\txt28.png');
  txt29 := picture.create('database\txts\txt29.png');
  txt10 := picture.create('database\txts\txt10.png');
  txt11 := picture.create('database\txts\txt11.png');
  txt12 := picture.create('database\txts\txt12.png');
  txt13 := picture.create('database\txts\txt13.png');
  txt31 := picture.create('database\txts\txt31.png');
  txt32 := picture.create('database\txts\txt32.png');
  txt33 := picture.create('database\txts\txt33.png');
   
  
  setwindowsize(800, 800);
  window.Caption := 'Карта памятников Горок'; 
  window.IsFixedSize := true;
  mapsize := 1;
  {Stars} 
    xst0[1] := 383;{+5}
    yst0[1] := 106;{+5}
    
    xst0[2] := 2000;
    yst0[2] := 2000;
    
    xst0[3] := 637;
    yst0[3] := 762;
    
    xst0[4] := 584;
    yst0[4] := -170;
    
    xst0[5] := 383;
    yst0[5] := 411;
    
    xst0[6] := 603;
    yst0[6] := 683;
    
    xst0[7] := 507;
    yst0[7] := 285; 
    
    xst0[8] := 424;{+9}
    yst0[8] := 378;{+9}
    
    xst0[9] := 2000;
    yst0[9] := 2000;
    
    xst0[10] := 236;
    yst0[10] := 462;
    
    xst0[11] := 243;
    yst0[11] := 452;
    
    xst0[12] := 307;
    yst0[12] := 412;  
    
    xst0[13] := 604;
    yst0[13] := 793;  
    
    xst0[14] := 527;
    yst0[14] := 1330;   
   
  {X,Ys} 
  xys[1] := 0;
  xys[2] := 200;
  xys[3] := 450;
  xys[4] := 750;
  xys[5] := 1100;
  xys[6] := 1600;
  {Mouse Connect} 
  onmousedown := mouseDown; 
  onmouseup := mouseup; 
  onmousemove := mouseMove;
  {drawing}
  lockdrawing;
  {GoMusic}
  ///
  layermenu.Playlooping();
  ///
  {======game======}
  while gm do
  begin
    
    {=The size of map=} 
    if check then
      case mapsize of
        1: 
          begin
            mapWidth := 800;
            mapHeight := 800;
            x := 0;
            y := 0;
            for i := 1 to 14 do xst[i] := 2000;
            check := false
          end;
        2: 
          begin
            mapWidth := 1200;
            mapHeight := 1600;
           {Stars1-14}
            for i := 1 to 14 do 
            begin
               xst[i] := xst0[i];
               yst[i] := yst0[i];
            end;
            ds := 14;
            check := false
          end;
        3: 
          begin
            mapWidth := 1700;
            mapHeight := 2267;
            
           {Stars1-14}
            for i := 1 to 14 do 
            begin//todo
               xst[i] := - 165 + round(xst0[i]*17/12);   
               yst[i] := - 165 + round(yst0[i]*17/12);
            end;
            ds := 16;
            check := false
        
          end;
        4: 
          begin
            mapWidth := 2300;
            mapHeight := 3067;
            
           {Stars1-14}
            for i := 1 to 14 do 
            begin
               xst[i] := - 365 + round(xst0[i]*23/12);   
               yst[i] := - 365 + round(yst0[i]*23/12);
            end; 
            ds := 22;
            check := false
          end;
        5: 
          begin
            mapWidth := 3000;
            mapHeight := 4000;
           {Stars1-14}
            for i := 1 to 14 do 
            begin
               xst[i] := - 595 + round(xst0[i]*30/12);   
               yst[i] := - 595 + round(yst0[i]*30/12);
            end;
            ds := 28;
            check := false
          end;
        6: 
          begin
            mapWidth := 4000;
            mapHeight := 5333;
          {Stars1-14}
            for i := 1 to 14 do 
            begin
               xst[i] := - 925 + round(xst0[i]*40/12);   
               yst[i] := - 925 + round(yst0[i]*40/12);
            end; 
            ds := 35;
            check := false
          end
      end;
    {=Move=} 
    if move then begin
                 {=x=}
      x := x - x0 + xm;
      x0 := xm;
                 {=y=}  
      y := y - y0 + ym;
      y0 := ym
    end;
    {.Draw todo} 
    window.Clear(RGB(242, 241, 240));
    if mapsize <> 1 then if mapsize <> 6 then horki1.draw(x - xys[mapsize], y - xys[mapsize], mapWidth, mapHeight) else horki6.draw(x - xys[mapsize], y - xys[mapsize]) 
    else begin
      start0.draw(0, 0, windowWidth, windowHeight);
                         //window.Clear(cllime);
      botn.draw(0, windowHeight - 60);
                        {ButtonYellow}
      setpencolor(RGB(248, 202, 67));
      setpenwidth(3);
      setbrushcolor(RGB(254, 246, 112));
                        {=P=} 
      if open then begin
        roundrect(WindowWidth - 20, WindowHeight - 10, WindowWidth - 175, WindowHeight - 90, 30, 30);
        lupa.draw(WindowWidth - 185, WindowHeight - 95)
      end
      else begin
        roundrect(WindowWidth - 20, WindowHeight - 10, WindowWidth - 65, WindowHeight - 55, 30, 30);
        circle(WindowWidth - 47, WindowHeight - 37, 11);
        line(WindowWidth - 30, WindowHeight - 20, WindowWidth - 40, WindowHeight - 30);
      end
    end;
    {StarsN}  
    for i := 1 to 14 do begin
                          if minist <> i then if (i <> 1) and (i <> 10) and (i <> 8) then staru.draw(x + xst[i], y + yst[i], ds, ds) else stars.draw(x + xst[i], y + yst[i], ds, ds);
                          {textout(x + xst[i], y + yst[i]+20,i)}
                        end;
    {Ministar_Post }
    if mapsize > 3 then
      case minist of
         1:
          begin
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist] - 110);
            starS.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontcolor(clblack);
            setfontsize(17);
            textout(x+xst[minist] - 60, y+yst[minist] - 90, 'Братская могила');
            textout(x+xst[minist] - 60, y+yst[minist] - 60, 'жертв фашизма')
          end;
        3:
          begin
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist] - 110);
            staru.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(17);
            setfontcolor(clblack);
            textout(x+xst[minist] - 62, y+yst[minist] - 90, 'Братская могила');
            textout(x+xst[minist] - 62, y+yst[minist] - 60, 'советских воинов')
          end;
        4:
          begin
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist] - 110);
            staru.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(16);
            setfontcolor(clblack);
            textout(x+xst[minist] - 60, y+yst[minist] - 95, 'Могила жертв');
            textout(x+xst[minist] - 60, y+yst[minist] - 70, 'фашизма. Жерт-');
            textout(x+xst[minist] - 60, y+yst[minist] - 45, 'вам  Холокоста')
          end;
        5:
          begin 
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist] - 110);
            staru.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(15);
            setfontcolor(clblack);
            textout(x+xst[minist] - 60, y+yst[minist] - 90, 'Могила советских');
            textout(x+xst[minist] - 60, y+yst[minist] - 60, 'военнопленных  ')
          end;  
       {5:NO}
        6:
          begin
            miniM.draw(x+xst[minist] - 80, y+yst[minist]+25 - 110,200,70);
            staru.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(18);
            setfontcolor(clblack);
            textout(x+xst[minist] - 60, y+yst[minist] - 80, 'Памятник    ');
            textout(x+xst[minist] - 60, y+yst[minist] - 50, 'освобождeния  ')
          end;
        7:
          begin
            miniM.draw(x+xst[minist] - 80, y+yst[minist] - 110);
            staru.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(15);
            setfontcolor(clblack);
            textout(x+xst[minist] - 62, y+yst[minist] - 40, 'и служащим БГСХА');
            textout(x+xst[minist] - 62, y+yst[minist] - 60, 'студентам, рабочим');
            textout(x+xst[minist] - 62, y+yst[minist] - 80, 'преподавателям,');
            textout(x+xst[minist] - 62, y+yst[minist] - 100, 'Памятник');
          end;
        8:
          begin
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist]+25 - 110,200,70);
            stars.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(18);
            setfontcolor(clblack);
            textout(x+xst[minist] - 60, y+yst[minist] - 80, 'Мемориальные');
            textout(x+xst[minist] - 60, y+yst[minist] - 50, 'доски  '){---------------------------------error---------------------------------}
          end;    
       {9:}
        10:
          begin
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist]+25 - 110,200,70);
            stars.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(18);
            setfontcolor(clblack);
            textout(x+xst[minist] - 55, y+yst[minist] - 80, 'Аллея героев')
          end;  
        11:
          begin
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist]+25 - 110,200,70);
            staru.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(18);
            setfontcolor(clblack);
            textout(x+xst[minist] - 60, y+yst[minist] - 80, 'Бюст    ');
            textout(x+xst[minist] - 60, y+yst[minist] - 50, 'Якубовскому  ')
          end;    
        12:
          begin
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist]+25 - 110,200,70);
            staru.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(18);
            setfontcolor(clblack);
            textout(x+xst[minist] - 60, y+yst[minist] - 80, 'Памятник    ');
            textout(x+xst[minist] - 60, y+yst[minist] - 50, 'Кидалинскому  ')
          end; 
        13:
          begin
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist] - 110);
            staru.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(15);
            setfontcolor(clblack);
            textout(x+xst[minist] - 62, y+yst[minist] - 40, 'войны');
            textout(x+xst[minist] - 62, y+yst[minist] - 60, 'Отечественной');
            textout(x+xst[minist] - 62, y+yst[minist] - 80, 'Великой');
            textout(x+xst[minist] - 62, y+yst[minist] - 100,'Памятник жертвам');
          end;  
        14:
          begin
          
            miniM.draw(x+xst[minist] - 80, y+yst[minist] - 110);
            staru.draw(x+xst[minist] - 3, y+yst[minist], ds + 6, ds + 6);
            setbrushcolor(clwhite);
            setfontsize(15);
            setfontcolor(clblack);
            textout(x+xst[minist] - 62, y+yst[minist] - 40, 'Армии');
            textout(x+xst[minist] - 62, y+yst[minist] - 60, 'воинов Красной');
            textout(x+xst[minist] - 62, y+yst[minist] - 80, 'братских могилах');
            textout(x+xst[minist] - 62, y+yst[minist] - 100,'Памятник на');
           
          end;     
      end;
    
  {Info_Post
   UNIVERSAL TODO}
    while (post) do 
    begin
      Mhorki.draw(0, 0, WindowWidth, WindowHeight);
     {left_Page}  
      if (xin < 50) and (infoUP = false) then xin := xin + 25;
      if (xin >= -500) and (infoUP) then xin := xin - 25;
      if (xin  <= -500) and (infoUP) then 
      begin
        info := 0;
        post := false;
        infoUP := false
      end;
      Menu.draw(xin, yin, 400, 450);
      case Info of
        21 : txt21.Draw(xin + 15, yin + 20);
        22 : txt22.Draw(xin + 15, yin + 20);
       3 : txt3.Draw(xin + 15, yin + 20);
       4 : txt4.Draw(xin + 15, yin + 20);
       5 : txt5.Draw(xin + 15, yin + 20);
       6 : txt6.Draw(xin + 15, yin + 20);
       7 : txt7.Draw(xin + 15, yin + 20);
        28 : txt28.Draw(xin + 15, yin + 20);
        29 : txt29.Draw(xin + 15, yin + 20);
       11 : txt10.Draw(xin + 15, yin + 20);
       12 : txt11.Draw(xin + 15, yin + 20);
       13 : txt12.Draw(xin + 15, yin + 20);
       14 : txt13.Draw(xin + 15, yin + 20);
        31 : txt31.Draw(xin + 15, yin + 20);
        32 : txt32.Draw(xin + 15, yin + 20);
        33 : txt33.Draw(xin + 15, yin + 20);
      
      end;
      exit.Draw(xin, yin, 400, 450);
     {Right_Page}  
      if (xp > 450) and (infoUP = false) then xp := xp - 25;
      if (xp <= 1000) and (infoUP) then xp := xp + 25;
      
      case Info of
       21 : pic21.Draw(xp, yp);
       22 : pic22.Draw(xp, yp);
      3 : pic3.Draw(xp, yp);
      4 : pic4.Draw(xp, yp);
      5 : pic5.Draw(xp, yp);
      6 : pic6.Draw(xp, yp);
      7 : pic7.Draw(xp, yp);
       28 : pic28.Draw(xp, yp);
       29 : pic29.Draw(xp, yp);
    
      11 : pic10.Draw(xp, yp);
      12 : pic11.Draw(xp, yp);
      13 : pic12.Draw(xp, yp);
      14 : pic13.Draw(xp, yp);
       31 : pic31.Draw(xp, yp);
       32 : pic32.Draw(xp, yp);
       33 : pic33.Draw(xp, yp);
      end;
      redraw
    end;
                                     /// \\\
                                     ///1\\\
                                     /// \\\   
   while (repost)and(info=1) do 
    begin
      Mhorki.draw(0, 0, WindowWidth, WindowHeight);
     {left_Page}  
      if (xin <= 275)and(repostup=false) then xin := xin + 25;
      if (xin >= -300) and (repostup) then xin := xin - 25;
      if (xin  <= -300) and (repostup) then 
      begin
        info := 0;
        repost := false;
        repostUP := false
      end;
      miniM.draw(xin, yin,250,100);
      setbrushcolor(clwhite);
      setfontcolor(clblack);
      setfontsize(16);
      textout(xin + 20, yin + 50, 'жертв фашизма');
      textout(xin + 20, yin + 30, 'подпольщиков и');
      textout(xin + 20, yin + 10, 'Братская могила');
      
     {Right_Page}  
      if (xp >= 275)and(repostup=false) then xp := xp - 25;
      if (xp <= 1000) and (repostup) then xp := xp + 25;
      miniM.draw(xp, yp,250,100);
      setfontsize(17);  
      textout(xp  + 20, yp  + 45, 'советских воинов');
      textout(xp  + 20, yp  + 25, 'Братская могила');
      
      setpenwidth(3);
      setpencolor(RGB(16,202,68));
      setbrushcolor(clwhite);
      circle(xin-30,yin+50,20);
      line(xin-38,yin+42,xin-22,yin+58);
      line(xin-22,yin+42,xin-38,yin+58);
      redraw
    end;
    
                                     /// \\\
                                     ///2\\\
                                     /// \\\   
   while (repost)and(info=8) do 
    begin
      Mhorki.draw(0, 0, WindowWidth, WindowHeight);
     {left_Page}  
      if (xin <= 275)and(repostup=false) then xin := xin + 25;
      if (xin >= -300) and (repostup) then xin := xin - 25;
      if (xin  <= -300) and (repostup) then 
      begin
        info := 0;
        repost := false;
        repostUP := false
      end;
      miniM.draw(xin, yin,250,100);
      setbrushcolor(clwhite);
      setfontcolor(clblack);
      setfontsize(15);
      textout(xin + 20, yin + 70, 'движения');
      textout(xin + 20, yin + 50, 'антифишистского');
      textout(xin + 20, yin + 30, 'участникам Горецкого');
      textout(xin + 20, yin + 10, 'Мемориальная доска');

     {Right_Page}  
      if (xp >= 275)and(repostup=false) then xp := xp - 25;
      if (xp <= 1000) and (repostup) then xp := xp + 25;
      miniM.draw(xp, yp,250,100);
      setfontsize(15);  
      textout(xp  + 20, yp  + 70, 'медецинских сестёр');
      textout(xp  + 20, yp  + 50, 'отрядам и отряду');
      textout(xp  + 20, yp  + 30, 'двум истребительным');
      textout(xp  + 20, yp  + 10, 'Мемориальная доска');
      
      setpenwidth(3);
      setpencolor(RGB(16,202,68));
      setbrushcolor(clwhite);
      circle(xin-30,yin+50,20);
      line(xin-38,yin+42,xin-22,yin+58);
      line(xin-22,yin+42,xin-38,yin+58);
      redraw
    end;

                                     /// \\\
                                     ///3\\\
                                     /// \\\   
   while (repost)and(info=10) do 
    begin
      allea.draw(0, 0, WindowWidth, WindowHeight);
     {left_Page}  
      if (xin <= 275)and(repostup=false) then xin := xin + 25;
      if (xin >= -300) and (repostup) then xin := xin - 25;
      if (xin  <= -300) and (repostup) then 
      begin
        info := 0;
        repost := false;
        repostUP := false
      end;
      miniM.draw(xin, yin,250,100);
      setbrushcolor(clwhite);
      setfontcolor(clblack);
      setfontsize(17);
      textout(xin + 20, yin + 46, 'Памятный знак');
      textout(xin + 20, yin + 24, 'Г.У. Дольникову');
      
     {Right_Page}  
      if (xp >= 275)and(repostup=false) then xp := xp - 25;
      if (xp <= 1000) and (repostup) then xp := xp + 25;
      miniM.draw(xp, yp,250,100);
      setfontsize(17);  
      textout(xp  + 20, yp  + 46, 'Н.Ф. Шиндикову');
      textout(xp  + 20, yp  + 24, 'Памятный знак');
      
     {left_Page-2}  
      if (xsp <= 275)and(repostup=false) then xsp := xsp + 25;
      if (xsp >= -300) and (repostup) then xsp := xsp - 25;
      miniM.draw(xsp, ysp,250,100);
      setbrushcolor(clwhite);
      setfontcolor(clblack);
      setfontsize(17);
      textout(xsp + 20, ysp + 46, 'Ф.А. Угначёву');
      textout(xsp + 20, ysp + 24, 'Памятный знак');
      
      setpenwidth(3);
      setpencolor(RGB(16,202,68));
      circle(xin-30,yin+50,20);
      line(xin-38,yin+42,xin-22,yin+58);
      line(xin-22,yin+42,xin-38,yin+58);
      redraw
    end;    

 
    {Zoom}
    if mapsize <> 1 then 
    begin
      setpencolor(cllightgray);
      setpenwidth(2);
      setbrushcolor(clwhite);
      {=+=} 
      roundrect(WindowWidth - 60, WindowHeight - 60, WindowWidth - 20, WindowHeight - 20, 20, 20);
      line(WindowWidth - 50, WindowHeight - 40, WindowWidth - 30, WindowHeight - 40);
      line(WindowWidth - 40, WindowHeight - 50, WindowWidth - 40, WindowHeight - 30);
      {=-=} 
      roundrect(WindowWidth - 120, WindowHeight - 60, WindowWidth - 80, WindowHeight - 20, 20, 20);
      line(WindowWidth - 110, WindowHeight - 40, WindowWidth - 90, WindowHeight - 40);
      {Button}
      setpencolor(RGB(0, 80, 252));
      setpenwidth(2);
      setbrushcolor(RGB(0, 139, 252));
      {=E=} 
      roundrect(WindowWidth - 60, WindowHeight - 120, WindowWidth - 20, WindowHeight - 80, 20, 20);
      line(WindowWidth - 53, WindowHeight - 112, WindowWidth - 27, WindowHeight - 112);
      line(WindowWidth - 50, WindowHeight - 104, WindowWidth - 30, WindowHeight - 104);
      line(WindowWidth - 53, WindowHeight - 96, WindowWidth - 27, WindowHeight - 96);
      line(WindowWidth - 50, WindowHeight - 88, WindowWidth - 30, WindowHeight - 88);
      {=<=}  
      setpenwidth(3);
      setpencolor(RGB(235,71,58));
      setbrushcolor(RGB(253,99,87));
      roundrect(20,WindowHeight-20,60,WindowHeight-60,20,20);
      line(26,WindowHeight-40,54,WindowHeight-40);
      line(26,WindowHeight-40,40,WindowHeight-50);
      line(26,WindowHeight-40,40,WindowHeight-30);
      {=7=}  
      setpenwidth(2);
      setpencolor(RGB(43,217,121));
      setbrushcolor(RGB(58,235,137));
      roundrect(20,20,60,60,30,30);
      q7.Draw(20,20);
      
    end;
    {/Zoom}

    {==============Shirm=============}
    while shirm do 
    begin
      start1.draw(0, 0, WindowWidth, WindowHeight);
      if (ysh > 200) and (shirmUP = false) then ysh := ysh - 25;
      if (ysh <= 800) and (shirmUP) then ysh := ysh + 25;
      if (ysh  >= 800) and (shirmUP) then begin
        shirm := false;
        shirmUP := false
      end;
      {MenuFolder} 
      setpencolor(cllightgray);
      setbrushcolor(clwhite);
      {.draw} txt0.draw(xsh, ysh);
      setfontcolor(cllightgray);
      setfontsize(25);
         {UPbutton} 
      {.draw} botn1.draw(0, ysh - 60);
      
      redraw
    end;
    
    
    {=============Map_Open============}
    while openMAP do
    begin
      start1.draw(0, 0, windowWidth, windowHeight);
      for i :=  1 to 5 do 
      begin
        if xl[i] > 0 then xl[i] := xl[i] - 40;
        linee[i].Draw(xl[i], yl[i]);
      end;
      
      if xl[5] = 0 then begin
        mapsize := 2;
        x := 0;
        y := 0;
        check := true;
        openMAP := false
      end;
      redraw
    end; 

 
    {===========Spravka_Open===========}
    while Sprav do
    begin
      
      
      if ysp > -1400 then ysp := ysp-1; 
      if yp > 700 then yp := yp - 10;
      clearwindow;
      txts.Draw(xsp,ysp);
      spravka.draw(0, 0, windowWidth, windowHeight);
      setpenwidth(3);
      setpencolor(RGB(235,71,58));
      setbrushcolor(RGB(253,99,87));
      circle(xp,yp,20);
      line(xp-8,yp-8,xp+8,yp+8);
      line(xp+8,yp-8,xp-8,yp+8);
      redraw
    end; 
    
    {=============Map_Close===========}
    while closeMAP do
    begin
      horki1.draw(x - xys[mapsize], y - xys[mapsize], mapWidth, mapHeight);
     {x,y_Move}
       xcr[1] := xcr[1]+20;
       ycr[1] := ycr[1]+20;
       
       xcr[2] := xcr[2]-20;
       ycr[2] := ycr[2]+20;
       
       xcr[3] := xcr[3]-20;
       ycr[3] := ycr[3]-20;
       
       xcr[4] := xcr[4]+20;
       ycr[4] := ycr[4]-20;
       
     for i := 1 to 4 do 
     begin
       corn[i].draw(xcr[i],ycr[i]);
     end;
     if xcr[1] = 0 then
      begin
        mapsize := 1;
        check := true;
        closeMAP := false;
        {GoMusic}
        ///
        //layermenu.Playlooping();
        ///
      end;
      redraw
    end; 
    
     {==============Search=============}
    {Shedue}
    while search do 
    begin
      Mhorki.draw(0, 0, WindowWidth, WindowHeight);
      if (ymn < windowHeight div 2 - 350) and (searchUP = false) then ymn := ymn + 40;
      if (ymn >= -700) and (searchUP) then ymn := ymn - 40;
      if (ymn  <= -700) and (searchUP) then begin
        search := false;
        searchUP := false
      end;
      {MenuFolder} 
      setpencolor(cllightgray);
      setbrushcolor(clwhite);
      {.draw} Menu.draw(xmn - 25, ymn, 450, 700);
      setfontcolor(cllightgray);
      setfontsize(25);
      textout(xmn + 15, ymn + 15, 'Памятники города Горки');
       ///...
      {UPbutton} 
      setbrushcolor(RGB(239, 239, 239));
      fillroundrect(xmn + 145, ymn + 650, xmn + 255, ymn + 680, 40, 20);
      setpenwidth(5);
      line(xmn + 160, ymn + 670, xmn + 200, ymn + 660);
      line(xmn + 240, ymn + 670, xmn + 200, ymn + 660);
      setpenwidth(2);
      {Pamatniki}
      setfontsize(12);
      setfontcolor(clblack);
     setbrushcolor(cllime);
     
      for i := 1 to 13 do 
    
        if i = light then begin
                            if (i<>8)and(i<>9) then staru.Draw(xmn - 9, ymn + 30 + i * 40, 26, 26)
                                               else stars.Draw(xmn - 9, ymn + 30 + i * 40, 26, 26)
                          end
                     else begin
                            if (i<>8)and(i<>9) then staru.Draw(xmn - 6, ymn + 30 + i * 40, 20, 20)
                                               else stars.Draw(xmn - 6, ymn + 30 + i * 40, 20, 20)
                          end;

       setbrushcolor(clwhite);
      {1:} 
      textout(xmn + 25, ymn + 70, 'Братская могила подпольщиков и жертв');
      textout(xmn + 25, ymn + 87, 'фашизма');
      {2:} 
      textout(xmn + 25, ymn + 110, 'Памятник жертвам Великой Отечественной');
      textout(xmn + 25, ymn + 127, 'войны');
      {3:} 
      textout(xmn + 25, ymn + 150, 'Братская могила советских воинов'); 
      {4:} 
      textout(xmn + 25, ymn + 190, 'Могила жертв фашизма');
      {5:} 
      textout(xmn + 25, ymn + 230, 'Могила советских военнопленных');  
      {6:} 
      textout(xmn + 25, ymn + 270, 'Памятник освобождения'); 
      {7:} 
      textout(xmn + 25, ymn + 310, 'Памятник преподавателям,студентам, рабо-');
      textout(xmn + 25, ymn + 327, 'чим и служащим БГСХА');
      textout(xmn + 25, ymn + 350, 'Мемориальные доски'); 
      {9:} 
      textout(xmn + 25, ymn + 390, 'Аллея героев');
      {10:} 
      textout(xmn + 25, ymn + 430, 'Бюст Якубовскому');
      {11:} 
      textout(xmn + 25, ymn + 470, 'Памятник Кидалинскому');
      {12:} 
      textout(xmn + 25, ymn + 510, 'Памятник жертвам Великой Отечественной войны');
      {13:} 
      textout(xmn + 25, ymn + 550, 'Памятник на братских могилах воинов Красной');
      textout(xmn + 25, ymn + 567, 'Армии');
      {HighLight} 
      setfontcolor(RGB(225, 225, 44));
      case light of
        1:
          begin
            textout(xmn + 25, ymn + 70, 'Братская могила подпольщиков и жертв');
      textout(xmn + 25, ymn + 87, 'фашизма');
          end;
        2:
          begin
            textout(xmn + 25, ymn + 110, 'Памятник жертвам Великой Отечественной');
      textout(xmn + 25, ymn + 127, 'войны');
          end; 
        3:
          begin
            textout(xmn + 25, ymn + 150, 'Братская могила советских воинов')
          end;
        4:
          begin
            textout(xmn + 25, ymn + 190, 'Могила жертв фашизма');
          end;
        5:
          begin
           textout(xmn + 25, ymn + 230, 'Могила советских военнопленных');  
          end;
      
        6:
          begin
            textout(xmn + 25, ymn + 270, 'Памятник освобождения'); 
          end;
        7:
          begin
            textout(xmn + 25, ymn + 310, 'Памятник преподавателям,студентам, рабо-');
      textout(xmn + 25, ymn + 327, 'чим и служащим БГСХА');
          end;
        8:
          begin
             textout(xmn + 25, ymn + 350, 'Мемориальные доски'); 
          end;
        9:
          begin
           textout(xmn + 25, ymn + 390, 'Аллея героев');
          end;
        10:
          begin
           textout(xmn + 25, ymn + 430, 'Бюст Якубовскому');
          end;
        11:
          begin
         textout(xmn + 25, ymn + 470, 'Памятник Кидалинскому');
          end;
        12:
          begin
         textout(xmn + 25, ymn + 510, 'Памятник жертвам Великой Отечественной войны');
          end;
        13:
          begin
          textout(xmn + 25, ymn + 550, 'Памятник на братских могилах воинов Красной');
          textout(xmn + 25, ymn + 567, 'Армии');
          end;
        
      end;
      redraw;
    end;
    {/Search}
                          
    redraw;
  end
  
END.
