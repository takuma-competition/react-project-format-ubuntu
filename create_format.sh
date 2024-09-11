#!/bin/bash
# テンプレートの作成
npx create-react-app react_npm_typescript --template typescript

# プロジェクトのルートディレクトリに移動
cd /workdir/react_npm_typescript

# 必要なディレクトリを作成
mkdir -p src/public \
    src/app \
    src/components \
    src/pages \
    src/features/home \
    src/services \
    src/hooks \
    src/styles

# 必要なファイルを作成
touch src/app/store.ts src/app/rootReducer.ts
touch src/features/home/homeSlice.ts
touch src/styles/index.css

# tailwind cssの設定
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

cat <<EOT > tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOT

cat <<EOT > src/styles/index.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOT

# 不要なファイルの削除
rm /workdir/react_npm_typescript/src/index.css
rm /workdir/react_npm_typescript/src/App.test.tsx
rm /workdir/react_npm_typescript/src/App.css

# index.tsxの編集
cat <<EOT > /workdir/react_npm_typescript/src/index.tsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import { Provider } from 'react-redux';
import store from './app/store';
import App from './App';
import './styles/index.css';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>
);

reportWebVitals();
EOT

# App.tsxの編集
cat <<EOT > /workdir/react_npm_typescript/src/App.tsx
import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { increment, decrement } from './features/home/homeSlice';
import './styles/index.css';

const App: React.FC = () => {
  const count = useSelector((state: any) => state.home.count);
  const dispatch = useDispatch();

  return (
    <div className="App flex flex-col items-center justify-center min-h-screen bg-gray-100">
      <h1 className="text-4xl font-bold mb-4">Redux Counter</h1>
      <p className="text-2xl mb-4">Count: {count}</p>
      <div className="space-x-4">
        <button 
          className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700"
          onClick={() => dispatch(increment())}
        >
          Increment
        </button>
        <button 
          className="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-700"
          onClick={() => dispatch(decrement())}
        >
          Decrement
        </button>
      </div>
    </div>
  );
}

export default App;
EOT

# store.tsの編集
cat <<EOT > /workdir/react_npm_typescript/src/app/store.ts
import { configureStore } from '@reduxjs/toolkit';
import rootReducer from './rootReducer';

const store = configureStore({
  reducer: rootReducer,
});

export default store;
EOT

# rootReducer.tsの編集
cat <<EOT > /workdir/react_npm_typescript/src/app/rootReducer.ts
import { combineReducers } from '@reduxjs/toolkit';
import homeReducer from '../features/home/homeSlice';

const rootReducer = combineReducers({
  home: homeReducer,
});

export default rootReducer;
EOT

# homeSlice.tsの編集
cat <<EOT > /workdir/react_npm_typescript/src/features/home/homeSlice.ts
import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  count: 0,
};

const homeSlice = createSlice({
  name: 'home',
  initialState,
  reducers: {
    increment: (state) => {
      state.count += 1;
    },
    decrement: (state) => {
      state.count -= 1;
    },
  },
});

export const { increment, decrement } = homeSlice.actions;
export default homeSlice.reducer;
EOT

# 必要なパッケージのインストール
npm install react-redux
npm install redux @reduxjs/toolkit

# tsconfig.jsonの編集
sed -i 's/"isolatedModules": true/"isolatedModules": false/' /workdir/react_npm_typescript/tsconfig.json

# プロジェクトの起動
npm run start