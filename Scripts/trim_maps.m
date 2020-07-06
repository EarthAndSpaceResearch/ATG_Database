% Trim graphics
D=dir('*.png'); imarg=20;
for i=1:length(D)
    infile=D(i).name;
    outfile=[infile(1:(end-4)) '_trimmed.png'];
    rm_whitespace(infile,outfile,imarg)
end