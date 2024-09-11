# react-project-format
`react`の開発~`deploy`までの`format`の整備を行い迅速な開発を始められるようにすることを目指したリポジトリ。

### 開発目標機能
- 完了
	- `docker`による`react`実行環境の構築
	- `tawilwind css`と`npm`を使用した`react`の所定のフォルダ構造を網羅した構造。
	- `redux`を使うように。
- 未着手
	- `firebase`へのデブロイ機能
	- 簡単な`db`を迅速に実装できる環境

# `dir`構造
```:bash
./
├── README.md
├── package-lock.json
├── package.json
├── postcss.config.js
├── public
│   ├── favicon.ico
│   ├── index.html
│   ├── logo192.png
│   ├── logo512.png
│   ├── manifest.json
│   └── robots.txt
├── src
│   ├── App.tsx
│   ├── app
│   │   ├── rootReducer.ts
│   │   └── store.ts
│   ├── components
│   ├── features
│   │   └── home
│   ├── hooks
│   ├── index.tsx
│   ├── logo.svg
│   ├── pages
│   ├── public
│   ├── react-app-env.d.ts
│   ├── reportWebVitals.ts
│   ├── services
│   ├── setupTests.ts
│   └── styles
│       └── index.css
├── tailwind.config.js
└── tsconfig.json
```
## 起動の詳細手順
- 詳細な使用方法は、以下のQiitaを参照。
	- [【環境構築】DockerでReactをnpmを使用して作成&起動する方法（TypeScript編）](https://qiita.com/takuma-1234/items/d92dbed1c0b2ce2f5ca0)

### Docker起動コマンド
```bash:
$docker-compose up -d --build
```
### react起動までの基本手順コマンド
- `vscode`でコンテナ内部に入る。
- `vscode`でターミナルを起動し作業ディレクトリに移動する。
```bash:
$cd workdir/
```
- `react`アプリの雛形を作成
- 以下の`sh`ファイルによって`redux`のカウントアプリが起動されるところまで自動化されている。
```:bash
$sh create_format.sh
```










