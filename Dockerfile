# 将来的にはアーキテクチャを自動判定して起動できるようにしたい。
FROM ubuntu:latest

# nvmに必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libssl-dev

# nvmをインストール
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# nvmを使えるようにbash設定を反映
RUN /bin/bash -c "source ~/.bashrc"

# 必要に応じてnodeのバージョンを指定してインストール
# 例: nvm install 14.7.0
RUN /bin/bash -c ". ~/.nvm/nvm.sh && nvm install 18.20.0"

# デフォルトで使用するnodeのバージョンを指定
RUN /bin/bash -c ". ~/.nvm/nvm.sh && nvm alias default 18.20.0"

# 以降のコマンドでnvmを使えるようにPATHを通す
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# アプリのソースをコピーするなど、以降の手順を追加
# COPY . /app
# WORKDIR /app
# RUN npm install
# CMD ["npm", "start"]