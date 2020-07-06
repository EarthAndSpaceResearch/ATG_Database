%% =======================================================================
% height_file_ocean_text2kml.m
%
% Script converts manually-edited atg_height_sites.txt, and writes the
%   KML data file used in the Google Earth
%
% User can specify sites to suppress coefficients; for example, if you have
% authorization to use but not distribute data
%
% Laurie Padman, Earth and Space Research, padman@esr.org
% Susan Howard,  Earth and Space research, showard@esr.org
%
% Last update:  June 30, 2020.
%% =======================================================================

%sites_to_suppress=[nn nn nn ...]; % Coefficients will be set to
%                                    NaN for open distribution
sites_to_suppress=[];
% Constituent order in file
c=['Q1';'O1';'P1';'K1';'N2';'M2';'S2';'K2'];
% Number of header lines
nhead=18;

% Change path depending on location of text file
fid=fopen('..\ASCII\AntTG_ocean_height.txt'); % Manually-edited ASCII text file.
fout=fopen('AntTG_ocean_height.kml','w');    % Output file name

% Dump {and display} headers
for i=1:nhead
    dum=fgetl(fid);
    %disp(dum);
end

% Find number of stations in file
ig=0;
while 1
    dum=fgetl(fid);
    ig=ig+1;
    if(dum==-1); ig=ig-1; break; end
end
nstat=round(ig/10);
disp(['Number of stations in file ... ' num2str(nstat)])
frewind(fid)
% Skip headers again
for i=1:nhead
    dum=fgetl(fid);
end

str=['<?xml version="1.0" encoding="UTF-8"?>'];
fprintf(fout,'%s\n',str);
str='<kml xmlns="http://www.opengis.net/kml/2.2">';
fprintf(fout,'%s\n',str);
str='<Document>';
fprintf(fout,'%s\n',str);

str='<Style id="highlightPlacemark1">';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>brightred_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="highlightPlacemark2">';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>brightpurple_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="highlightPlacemark3">';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>brightblue_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="highlightPlacemark4">';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>brightgr_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="highlightPlacemark5">';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>brightltblue_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="highlightPlacemark6">';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>brightyellow_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="highlightPlacemark7">';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>brightorange_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="highlightPlacemark8">';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>brightrose_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="normalPlacemark1">';
fprintf(fout,'%s\n',str);
str='<LabelStyle>';
fprintf(fout,'%s\n',str);
str='<scale>.75</scale>';
fprintf(fout,'%s\n',str);
str='</LabelStyle>';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>red_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="normalPlacemark2">';
fprintf(fout,'%s\n',str);
str='<LabelStyle>';
fprintf(fout,'%s\n',str);
str='<scale>.75</scale>';
fprintf(fout,'%s\n',str);
str='</LabelStyle>';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>purple_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="normalPlacemark3">';
fprintf(fout,'%s\n',str);
str='<LabelStyle>';
fprintf(fout,'%s\n',str);
str='<scale>.75</scale>';
fprintf(fout,'%s\n',str);
str='</LabelStyle>';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>blue_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="normalPlacemark4">';
fprintf(fout,'%s\n',str);
str='<LabelStyle>';
fprintf(fout,'%s\n',str);
str='<scale>.75</scale>';
fprintf(fout,'%s\n',str);
str='</LabelStyle>';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>gr_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="normalPlacemark5">';
fprintf(fout,'%s\n',str);
str='<LabelStyle>';
fprintf(fout,'%s\n',str);
str='<scale>.75</scale>';
fprintf(fout,'%s\n',str);
str='</LabelStyle>';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>ltblue_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="normalPlacemark6">';
fprintf(fout,'%s\n',str);
str='<LabelStyle>';
fprintf(fout,'%s\n',str);
str='<scale>.75</scale>';
fprintf(fout,'%s\n',str);
str='</LabelStyle>';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>yellow_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="normalPlacemark7">';
fprintf(fout,'%s\n',str);
str='<LabelStyle>';
fprintf(fout,'%s\n',str);
str='<scale>.75</scale>';
fprintf(fout,'%s\n',str);
str='</LabelStyle>';
fprintf(fout,'%s\n',str);

str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>orange_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<Style id="normalPlacemark8">';
fprintf(fout,'%s\n',str);
str='<LabelStyle>';
fprintf(fout,'%s\n',str);
str='<scale>.75</scale>';
fprintf(fout,'%s\n',str);
str='</LabelStyle>';
fprintf(fout,'%s\n',str);
str='<IconStyle>';
fprintf(fout,'%s\n',str);
str='<scale>1</scale>';
fprintf(fout,'%s\n',str);
str='<Icon>';
fprintf(fout,'%s\n',str);
str='<href>rose_drop.png</href>';
fprintf(fout,'%s\n',str);
str='</Icon>';
fprintf(fout,'%s\n',str);
str='</IconStyle>';
fprintf(fout,'%s\n',str);
str='</Style>';
fprintf(fout,'%s\n',str);

str='<StyleMap id="bprStyleMap">';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>normal</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#normalPlacemark1</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>highlight</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#highlightPlacemark1</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='</StyleMap>';
fprintf(fout,'%s\n',str);

str='<StyleMap id="ctgStyleMap">';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>normal</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#normalPlacemark2</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>highlight</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#highlightPlacemark2</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='</StyleMap>';
fprintf(fout,'%s\n',str);

str='<StyleMap id="gpsStyleMap">';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>normal</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#normalPlacemark3</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>highlight</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#highlightPlacemark3</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='</StyleMap>';
fprintf(fout,'%s\n',str);

str='<StyleMap id="grvStyleMap">';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>normal</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#normalPlacemark4</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>highlight</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#highlightPlacemark4</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='</StyleMap>';
fprintf(fout,'%s\n',str);

str='<StyleMap id="tltStyleMap">';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>normal</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#normalPlacemark5</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>highlight</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#highlightPlacemark5</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='</StyleMap>';
fprintf(fout,'%s\n',str);

str='<StyleMap id="vtsStyleMap">';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>normal</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#normalPlacemark6</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>highlight</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#highlightPlacemark6</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='</StyleMap>';
fprintf(fout,'%s\n',str);

str='<StyleMap id="mprStyleMap">';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>normal</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#normalPlacemark7</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>highlight</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#highlightPlacemark7</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='</StyleMap>';
fprintf(fout,'%s\n',str);

str='<StyleMap id="mscStyleMap">';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>normal</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#normalPlacemark8</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='<Pair>';
fprintf(fout,'%s\n',str);
str='<key>highlight</key>';
fprintf(fout,'%s\n',str);
str='<styleUrl>#highlightPlacemark8</styleUrl>';
fprintf(fout,'%s\n',str);
str='</Pair>';
fprintf(fout,'%s\n',str);
str='</StyleMap>';
fprintf(fout,'%s\n',str);


%nstat=3
for irec=1:nstat
    
    str          = fgetl(fid);
    disp(str)
    ind          = str2num(str(1:3));
    name          = fgetl(fid);
    disp(name)
    %ref
    ref=fgetl(fid); disp(ref)
    %shortname
    shname=fgetl(fid); disp(shname)
    lts= fgetl(fid);
    nums         = str2num(lts(1:27));
    latp         = nums(1);
    lonp         = nums(2);
    disp([latp lonp])
    rcs= fgetl(fid);
    nums2         = str2num(rcs(1:27));
    reclen       = nums2(1);
    dt           = nums2(2);
    disp([reclen dt])
    
    
    
    % Measurement type and reference lines
    meas=fgetl(fid); disp(meas)
    grpnum=str2num(meas(1:2));
    %ref=fgetl(fid); disp(ref)
    % Read amplitude and phase lines
    am_str=fgetl(fid); am=str2num(am_str); disp(am_str)
    ph_str=fgetl(fid); ph=str2num(ph_str); disp(ph_str)
    % Dump blank separator line
    blank=fgetl(fid); disp(blank);
    disp(' ');
    
    str='<Placemark>';
     fprintf(fout,'%s\n',str);

   str=['<name>' num2str(irec,'%03d') ' '  upper(shname) '</name>'];
   fprintf(fout,'%s\n',str);
   
   str=['<description><table><tr><td colspan="9"><b>' upper(name) '</b></td></tr>'];
   fprintf(fout,'%s\n',str);
   
   str=['<tr><td colspan="9"> <b>Lat,Lon: </b>' num2str(latp) ', ' ...
        num2str(lonp) ')</td></tr>'];
   fprintf(fout,'%s\n',str);
   str=['<tr><td colspan="9"> <b>Record length (days), Sample interval (s)):</b> (' ...
        num2str(reclen) ', ' num2str(dt) ')</td></tr>'];
   fprintf(fout,'%s\n',str);
   
   str=['<tr><td colspan="9"> <b>Instrument type: </b>' meas '</td></tr>'];
   fprintf(fout,'%s\n',str);
   
   str=['<tr><td colspan="9"> <b>Reference:</b> <i>' ref '</i></td></tr>'];
   fprintf(fout,'%s\n',str);
      
   str=['<tr><td></td><td><b>' c(1,1) '<sub>' c(1,2) '</sub></b></td><td><b>' ...
                            c(2,1) '<sub>' c(2,2) '</sub></b></td><td><b>' ...
                            c(3,1) '<sub>' c(3,2) '</sub></b></td><td><b>' ...
                            c(4,1) '<sub>' c(4,2) '</sub></b></td><td><b>' ...
                            c(5,1) '<sub>' c(5,2) '</sub></b></td><td><b>' ...
                            c(6,1) '<sub>' c(6,2) '</sub></b></td><td><b>' ...
                            c(7,1) '<sub>' c(7,2) '</sub></b></td><td><b>' ...
                            c(8,1) '<sub>' c(8,2) '</sub></b></td></tr>'];
   fprintf(fout,'%s\n',str);

% Set coefficients for suppressed sites to NaN;
   sts=sites_to_suppress; lens=length(sts);
   sflag=0;
   if(~isempty(sts))
       for k=1:lens
           if(irec==sts(k))
               am=NaN*ones(size(am)); ph=am; sflag=1;
               break
           end
       end
   end
   
   a1=num2str(am(1),'%6.1f');  a2=num2str(am(2),'%6.1f');
   a3=num2str(am(3),'%6.1f');  a4=num2str(am(4),'%6.1f');
   a5=num2str(am(5),'%6.1f');  a6=num2str(am(6),'%6.1f');
   a7=num2str(am(7),'%6.1f');  a8=num2str(am(8),'%6.1f');

   p1=num2str(ph(1),'%6.1f');  p2=num2str(ph(2),'%6.1f');
   p3=num2str(ph(3),'%6.1f');  p4=num2str(ph(4),'%6.1f');
   p5=num2str(ph(5),'%6.1f');  p6=num2str(ph(6),'%6.1f');
   p7=num2str(ph(7),'%6.1f');  p8=num2str(ph(8),'%6.1f');

   if(sflag==0)
   str=['<tr><td><b>Amp. (cm): </b></td><td>' a1 '</td><td>' a2 '</td><td>' ...
        a3 '</td><td>' a4 '</td><td>' a5 '</td><td>' a6 '</td><td>' ...
        a7 '</td><td>' a8 '</td></tr>'];
   elseif(sflag==1)
       str=['<tr><td colspan="9">data not public </td></tr>'];
   end
   fprintf(fout,'%s\n',str);

   if(sflag==0)
   str=['<tr><td><b>Phase (Greenwich):</b></td><td>' p1 '</td><td>' p2 '</td><td>' ...
                p3 '</td><td>' p4 '</td><td>' p5 '</td><td>' p6 '</td><td>' ...
                p7 '</td><td>' p8 '</td></tr>'];
   elseif(sflag==1)
       str=['<tr><td colspan="9">data not public </td></tr>'];
   end
   fprintf(fout,'%s\n',str);

   str=['</table>'];
   fprintf(fout,'%s\n',str);
   
   str=['</description>'];
   fprintf(fout,'%s\n',str);
   if (grpnum==1)
       str=['<styleUrl>#bprStyleMap</styleUrl>'];
       fprintf(fout,'%s\n',str);
   elseif (grpnum==2)
       str=['<styleUrl>#ctgStyleMap</styleUrl>'];
        fprintf(fout,'%s\n',str);
   elseif (grpnum==3)
       str=['<styleUrl>#gpsStyleMap</styleUrl>'];
        fprintf(fout,'%s\n',str);   
   elseif (grpnum==4)
       str=['<styleUrl>#grvStyleMap</styleUrl>'];
        fprintf(fout,'%s\n',str);   
   elseif (grpnum==5)
       str=['<styleUrl>#tltStyleMap</styleUrl>'];
        fprintf(fout,'%s\n',str);
   elseif (grpnum==6)
       str=['<styleUrl>#vtsStyleMap</styleUrl>'];
        fprintf(fout,'%s\n',str);
   elseif (grpnum==7)
       str=['<styleUrl>#mprStyleMap</styleUrl>'];
        fprintf(fout,'%s\n',str);
   else
       str=['<styleUrl>#mscStyleMap</styleUrl>'];
        fprintf(fout,'%s\n',str);
   end   
    str=['<Point>'];
   fprintf(fout,'%s\n',str);
     str=['<coordinates>'  num2str(lonp) ','  num2str(latp) '</coordinates>'];
   fprintf(fout,'%s\n',str);
     str=['</Point>'];
   fprintf(fout,'%s\n',str);
    str=['</Placemark>'];
   fprintf(fout,'%s\n',str);
   
   fprintf(fout,'%s\n',' ');
   
end
fclose(fid);


str='</Document>';
fprintf(fout,'%s\n',str);
str='</kml>';
fprintf(fout,'%s\n',str);
fclose(fout);
