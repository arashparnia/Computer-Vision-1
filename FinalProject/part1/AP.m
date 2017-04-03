function mAP = AP(sorted_list,type)
    % airplanes cars fcaes motorbikes 
    AP = 0;
    s=0;
    if strcmp(type,'airplanes')
        min = 0;
        max = 51;
    end
    if strcmp(type,'cars')
        min = 50;
        max = 101;
    end
    if strcmp(type,'faces')
        min = 100;
        max = 151;
    end
    if strcmp(type,'motorbikes')
        min = 150;
        max = 2001;
    end
    
    for i = 1: length(sorted_list)
        if sorted_list(i) > min && sorted_list(i) < max
            s=s+1;
            AP = AP + s / i;
        end
    end
    mAP = AP / s;

end
