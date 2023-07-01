#declare num_pole = 10;
#declare rands = array[num_pole]
#declare r1 = seed(12345);

#local i = 0;
#while (i < num_pole)
    #declare rands[i] = rand(r1);
    #declare i = i + 1;
#end

#debug concat("variable_name: ", str(rands[0]))
