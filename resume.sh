FINISH=$(date)
echo
echo "= Resume :::::::::::::::::::::::::::::::::::::::::::::"
echo "  Script     : $0"
echo "  Start      : $START"
echo "  Finish     : $FINISH"
echo "  Destination: $DESTINATION"
echo "  Backup     : $BACKUP"
echo "  Total Size : $(du -sh $BACKUP)"
