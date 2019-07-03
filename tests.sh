report="../build/tests/tests.log"
xcodebuild -project FUNI.xcodeproj -scheme FUNITests -sdk iphonesimulator11.4 build-for-testing
echo "testing..."
xctool -project FUNI.xcodeproj -scheme FUNITests -launch-timeout 3600 -sdk iphonesimulator11.4 run-tests -reporter plain:$report
echo $report
cat $report
echo "reported"

