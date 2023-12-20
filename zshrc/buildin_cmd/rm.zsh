function rm() {
	TRASH_DIR='/var/tmp/trash'
	RM='rm'
	MV='mv'
	MKDIR='mkdir -p'

	eval command ${MKDIR} ${TRASH_DIR}
	echo $* | while read target; do
		full_path=`readlink -f $target`
		backup=${TRASH_DIR}/${full_path}
		backup_dir=${TRASH_DIR}`dirname $full_path`
		if [ -e ${backup} ]; then
			# 1世代のみバックアップ
			eval command ${RM} -rf ${backup}
		fi
		eval command ${MKDIR} ${backup_dir}
		eval command ${MV} ${target} ${backup}
	done
}
