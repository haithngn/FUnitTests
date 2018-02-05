report="../build/tests/tests.log"
xcodebuild -project FUNI.xcodeproj -scheme FUNITests -sdk iphonesimulator10.2 build-for-testing
echo "testing..."
xctool -project FUNI.xcodeproj -scheme FUNITests -launch-timeout 3600 -sdk iphonesimulator10.2 run-tests -reporter plain:$report
echo $report
cat $report
curl -F file=@"$report" -F title="FUNI_Unit_Testing_Report.txt" -F filename="$report" -F channels=#tests -F token=xoxp-186550275043-187447070119-255877486165-8a38504cc070664b644cbb957ce69dd9 https://slack.com/api/files.upload
echo "reported"

