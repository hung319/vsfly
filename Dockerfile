# Sử dụng base image là Ubuntu
FROM ubuntu:latest

# Cập nhật các gói cần thiết
RUN apt-get update && apt-get install -y curl wget libx11-xcb1 libxcb-dri3-0 \
    libxcomposite1 libasound2 libdbus-glib-1-2 libxt6 libexif12 libgtk-3-0

# Tải và cài đặt VSCode
RUN wget -O vscode.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 \
    && dpkg -i vscode.deb \
    && apt-get install -f -y \
    && rm vscode.deb

# Mở cổng 8080 để truy cập VSCode qua trình duyệt
EXPOSE 8080

# Chạy VSCode khi container được khởi động
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--user-data-dir", "/data"]
