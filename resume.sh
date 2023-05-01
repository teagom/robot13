FINISH=$(date)
echo
echo "  + Resume"
echo "  Script     : $0"
echo "  Section    : $SECTION"
echo "  Origin     : $ORIGIN"
echo "  Destination: $DESTINATION"
echo "  Format     : $FORMAT"

echo "  Backup     : $BACKUP"
CMD="du -sh $BACKUP"
source cmd.sh

echo "  Start      : $START"
echo "  Finish     : $FINISH"
