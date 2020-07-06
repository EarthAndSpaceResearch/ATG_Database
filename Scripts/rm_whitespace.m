function rm_whitespace(infile,outfile,imarg)
% testing
% infile='Circum_Antarctic.png'; outfile='Circum_Antarctic_trimmed.png';
% imarg=20;

A=imread(infile);
% figure(1); clf
% image(A);
[c,r,d]=size(A);
B=(255-A(:,:,1)).*(255-A(:,:,2)).*(255-A(:,:,3));
% rows
R=sum(B,1); loc=find(R>0); 
ir1=max([min(loc)-imarg,1]); ir2=min([max(loc)+imarg,r]);
% columns
C=sum(B,2); loc=find(C>0); 
ic1=max([min(loc)-imarg,1]); ic2=min([max(loc)+imarg,c]);

% hold on
% rectangle('position',[ir1 ic1 ir2-ir1  ic2-ic1],'EdgeColor','r')
% plot(ir1,ic1,'rs')
% plot(ir2,ic2,'ko')
% axis('equal')

OUT=A(ic1:ic2,ir1:ir2,:);
% figure(2); clf
% image(OUT); axis('equal'); axis('off')
imwrite(OUT,outfile)
return