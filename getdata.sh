#!/usr/bin/env bash

############################
#
# By GolanSho
# Ver 1.0.0
# Date 6/5/19
#
############################

## funcs ##
                      ## getting Data from the user ##
f_getinput(){

data="null"

	while [[ $data != "end" ]]
	  do 
	    read -p "Enter Data: " inpdata	 
	    
	    if [[ $inpdata != "end" ]]; then
	      dataarry=("${dataarry[@]}" "$inpdata")
	    else echo "getting Data with digits"
	    fi
	  data=$inpdata
	done

}
                      ## getting data with digits ##
f_datascan(){
	
 sleep 3
	for i in "${dataarry[@]}"
	    do
	     digit=$(echo $i |grep "[[:digit:]]")
	    
	     if [ $digit > " " ]; then
	        bar=("${bar[@]}" "#")
	        echo "${bar[@]}"; sleep 1 ; clear
		digitarry=("${digitarry[@]}" "$digit")
	     fi
	done

 echo "${digitarry[@]}"
}
                      ## Main - Running the Funcs ##
f_main(){

	f_getinput
	f_datascan
}
                      ## validation for root user ##

currusr=$(whoami)
if [ $currusr == root ]; then
  f_main
else echo "only root user can run!"
fi

## End ##
