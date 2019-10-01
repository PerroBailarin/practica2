clear
clc

rr1=cellfun(@str2num, inputdlg("Amperímetro","Resistencias"));
rr2=cellfun(@str2num, inputdlg("Voltímetro","Resistencias"));
%rr1=100;
%rr2=10^6;
setrs(rr1,rr2);
act=0;
step=rr2/2;
while step>0
   if step<0.1
       step=0;
       msgbox(strcat({'R = '},num2str(act)), 'F-saurio Rex')
   end
   for i=1:9
      if d(act+step)>1
          act=act+step;
      else
          i=10;
      end
   end
   step=step/2;
end

function a =d1(x)
    global r1
    a=abs(r1/(x-r1));
end
function a=d2(x)
    global r2
    a=abs(x/(r2));
end
function a=d(x)
    a=x*(d1(x)-d2(x));
end
function setrs(rr1, rr2)
    global r1 r2
    r1=rr1;
    r2=rr2;
end