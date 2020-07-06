%% =======================================================================
% height_file_ocean_text2mat.m
%
% Script converts manually-edited atg_height_sites.txt, and writes the
%   Matlab data file used in the open distribution database 
%   (AntTG_database.mat).
%
% User can specify sites to suppress coefficients; for example, if you have
% authorization to use but not distribute data
%
% Laurie Padman, Earth and Space Research, padman@esr.org
% Susan Howard,  Earth and Space research, showard@esr.org
%
% Last update:  June 30, 2020.
%
%% =======================================================================

%sites_to_suppress=[nn nn nn ...]; % Coefficients will be set to
%  NaN for open distribution.
sites_to_suppress=[]; % Nothing to suppress

% Change path depending on location of text file
fid=fopen('..\ASCII\AntTG_ocean_height.txt');

% Number of header lines, and a counter to start increasing header line length
nhead=18; maxlen=0; 
for i=1:nhead
    hdr{i}=strip(fgetl(fid)); maxlen=max(maxlen,length(hdr{i}));
end
for i=1:nhead                           % pad header lines to constant length
    header(i,:)=padstr(hdr{i},maxlen);
end

% Specify number of rows per tide gauge site
rowspersite=10;

% Constituent order in file
constit=['Q1';'O1';'P1';'K1';'N2';'M2';'S2';'K2'];

% Find number of stations in file
ig=0;
while 1
    dum=fgetl(fid);
    ig=ig+1;
    if(dum==-1); ig=ig-1; break; end
end
nstat=round(ig/rowspersite);
disp(['Number of stations in file ... ' num2str(nstat)])
frewind(fid)
% Skip headers again
for i=1:nhead
    dum=fgetl(fid);
end

% Arrays we need
atg.lat=NaN*ones(nstat,1); atg.lon=atg.lat; atg.site_id=atg.lat; 
atg.RecordLength=atg.lat; atg.DeltaTime=atg.lat;
atg.amp=NaN*ones(nstat,8); atg.Gphase=atg.amp;
atg.SiteName(     1:nstat,1:50)=' ';
atg.MeasType(1:nstat,1:maxlen)=' ';
atg.Reference(      1:nstat,1:maxlen)=' ';
% Read through text file, one site block at a time
for i=1:nstat
    str                       = fgetl(fid);
    ATG(i).site_id            = str2num(str(1:3));
    str                       = fgetl(fid); str=strip(str);
    ATG(i).SiteName           = cellstr(str);
    str                       = fgetl(fid); str=strip(str);    % source
    ATG(i).Reference          = cellstr(str);
    str                       = fgetl(fid); str=strip(str);    % Short Name
    ATG(i).ShortName          = cellstr(str);
    str                       = fgetl(fid);                  % lat,lon
    nums                      = str2num(str(1:20));          
    ATG(i).lat                = nums(1);
    ATG(i).lon                = nums(2);
    if(ATG(i).lon>180); ATG(i).lon =ATG(i).lon-360; end
    str                       = fgetl(fid);
    nums                      = str2num(str(1:20));    
    ATG(i).RecordLength       = nums(1);
    ATG(i).DeltaTime          = nums(2);
    str                       = fgetl(fid); str=strip(str);
    ATG(i).MeasType           = cellstr(str);
    % Read amplitude and phase lines
    am_str=fgetl(fid); 
    ATG(i).amp                = str2num(am_str); 
    ph_str=fgetl(fid); 
    ATG(i).Gphase             = str2num(ph_str); 
% Dump blank separator line
    blank=fgetl(fid); 
end 
fclose(fid);

% Blank out coefficients for non-public sites
for i=sites_to_suppress
    ATG(i).amp    = NaN*ones(1,8);
    ATG(i).Gphase = NaN*ones(1,8);
end

save AntTG_ocean_height.mat header ATG constit
