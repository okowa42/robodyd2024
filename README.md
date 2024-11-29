# robosys2024

# 10パズル
![test](https://github.com/okowa42/robosys2024/actions/workflows/test.yml/badge.svg)

標準入力から読み込んだ4つの自然数を使って、結果が10になるような四則演算式を出力する。

## 使い方
- 任意の4つの自然数をスペース区切りで入力する。
### 結果が10となるような四則演算式が存在するとき
    - 実行例
    ```
    echo 2 3 4 5 | ./ten_puzzle
    ```
    - 実行結果
    ```
    結果が10になる式:
    ((2 * 3) - 4) * 5 = 10
    結果が10になる式:
    ```
### 結果が10となるような四則演算式が存在しないとき
    - 実行例
    ```
    echo 2 3 3 3 | ./ten_puzzle
    ```
    - 実行結果
    ```
    入力された自然数では結果が10になる式を生成できませんでした。
    ```
### 入力された自然数の個数が4つで無い場合
    - 実行例
    ```
    echo 1 2 3 | ./ten_puzzle
    ```
    - 実行結果
    ```
    4つの自然数を正確に入力してください。
    ```
### 入力に自然数でない数(負の数)が含まれている場合
    - 実行例
    ```
    echo 1 2 -3 4 | ./ten_puzzle
    ```
    - 実行結果
    ```
    すべての入力は自然数でなければなりません。
    ```
### 入力に自然数でない数(小数)が含まれている場合
    - 実行例
    ```
    echo 1 2 3.4 5 | ./ten_puzzle
    ```
    - 実行結果
    ```
    無効な入力です。すべての入力は自然数でなければなりません。
    ```
### 入力に数でない文字列が含まれている場合
    - 実行例
    ```
    echo あ い う え | ./ten_puzzle
    ```
    - 実行結果
    ```
    無効な入力です。すべての入力は自然数でなければなりません。
    ```

## 必要なソフトウェア
- Python
    - テスト済みバージョン: 3.7～3.11

## テスト環境
- Ubuntu 24.04.1 LTS

## ライセンス
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- © 2024 Akari Hirohara
