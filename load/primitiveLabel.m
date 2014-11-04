function labelNum = primitiveLabel (label)
    labelNum = 0;
    switch (label)
    case 'bpos' labelNum = 1;
    case 'mpos' labelNum = 2;
    case 'spos' labelNum = 3;
    case 'bneg' labelNum = 4;
    case 'mneg' labelNum = 5;
    case 'sneg' labelNum = 6;
    case 'cons' labelNum = 7;
    case 'pimp' labelNum = 8;
    case 'nimp' labelNum = 9;
    case 'none' labelNum = 10;
    end
end
