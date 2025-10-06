# 🦀 1. 使用官方 Rust 基底 image（跟 devcontainer 一樣）
FROM mcr.microsoft.com/devcontainers/rust:1-1-bullseye

# 📁 2. 設定工作目錄
WORKDIR /workspaces/logging-agent

RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# 🌱 3. 設定 cargo/rustup 的環境變數
ENV CARGO_HOME=/app/.cargo_cache
ENV RUSTUP_HOME=/app/.cargo_cache/rustup

# 🏗️ 4. 建立 cargo cache 目錄
RUN mkdir -p /workspaces/logging-agent/.cargo_cache /workspaces/logging-agent/.cargo_cache/rustup

# 📦 5. 複製程式碼進容器
COPY . .

# 🏃‍♂️ 6. 編譯 release 版本（你也可以改成 debug）
# RUN cargo build --release
# RUN cargo build --release --verbose

# 🚀 7. 最終執行指令（假設 binary 名為 logging-agent）
# CMD ["./target/release/logging-agent"]
CMD ["/bin/bash"]