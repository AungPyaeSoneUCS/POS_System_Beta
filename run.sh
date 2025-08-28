#!/bin/bash

echo "=== POS system startup script ==="
echo "Checking Python environment..."

# 检查Python3是否安装
if ! command -v python3 &> /dev/null; then
    echo "Error: Python3 not found, please install Python3 first"
    exit 1
fi

# 检查pip3是否安装
if ! command -v pip3 &> /dev/null; then
    echo "Error: pip3 not found, please install pip3 first"
    exit 1
fi

echo "✓ Python3 environment check passed"

# 安装依赖
echo "Installing dependencies..."
pip3 install -r requirements.txt

# 检查依赖安装是否成功
if [ $? -ne 0 ]; then
    echo "Error: dependency installation failed"
    exit 1
fi

echo "✓ Dependency installation completed"

# 启动服务器
echo "Starting POS system server..."
echo "The server will start at http://localhost:5000"
echo "Press Ctrl+C to stop the server"
echo ""

python3 app.py 
