function Include(){
	file_list=`ls $* 2>/dev/null`
	if [ $? -ne 0 ]; then
		return 1;
	fi
	for file in `echo $file_list`; do
		source $file
	done
	return 0;
}
