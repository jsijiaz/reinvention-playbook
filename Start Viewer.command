#!/bin/bash
# Navigate to the folder this script lives in
cd "$(dirname "$0")"

# Pick an available port
PORT=8765

# Kill anything already on that port
lsof -ti tcp:$PORT | xargs kill -9 2>/dev/null

# Start a simple HTTP server in the background
python3 -m http.server $PORT --bind 127.0.0.1 &
SERVER_PID=$!

# Give the server a moment to start
sleep 0.4

# Open the viewer in the default browser
open "http://127.0.0.1:$PORT/index.html"

# Keep the server alive until the terminal window is closed
echo "Viewer running at http://127.0.0.1:$PORT"
echo "Close this window to stop the server."
wait $SERVER_PID
