clear; clc;
input = [1 1 1 0 1 0 0 1 1 0 0 0 1 0 1 1 0 1 0 0];%can be any thing

%get the subsequence
subseq = ["0" "1"];
chckfor = "";
for i = 1 : length(input)
    newentry = string(input(i));
    chckfor = chckfor + newentry;
    found = find(subseq == chckfor); 
    if found >= 1 %if it is found before => skip this iteration
        continue;
    end
    %if not found => store in the subseq and reintialize check_for array
    subseq = [subseq chckfor];
    chckfor = "";
end

%get the numerical
numerical = ["", ""];
for i = 3 : length(subseq)
    newentry = char(subseq(i));
    st = ""; %store first part of the subseq
    for j = 1 : length(newentry) - 1
        st = st + newentry(j);
    end
    nd = newentry(length(newentry)); %second part
    stindex = find(subseq == st);
    ndindex = find(subseq == nd);
    str = string(stindex)+string(ndindex);
    numerical = [numerical str];
end

%clac binary
binary = [de2bi(0), de2bi(1)];
for i = 3 : length(subseq)
    nd = "";
    newsub = char(subseq(i));
    nd = str2num(newsub(length(newsub)));
    
    newnumerical = char(numerical(i));
    st = ""; %store first part of the subseq
    for j = 1 : length(newnumerical)-1
        st = st + newnumerical(j);
    end
    st = str2num(st);
    stbin = de2bi(st,"left-msb");
    stbinn = "";
    for k = 1 : length(stbin)
        stbinn = stbinn + string(stbin(k));
    end
    new = stbinn + string(nd);
    binary = [binary new];
end

%outputs are: subseq, numeerical, and binary