#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Akari Hirohara
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### plusコマンドへのテスト ###
### NORMAL INPUT ###
out=$(seq 5 | ./plus)
[ "${out}" = "15" ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### ten_puzzleへのテスト ###

### テストケース1: 正常な入力（自然数で結果が10になる式がある場合）
echo "テストケース1: 正常な入力"
out=$(echo "2 3 4 5" | ./ten_puzzle)
expected_output="結果が10になる式:"
if [[ "$out" == *"$expected_output"* ]]; then
    echo "テストケース1成功"
else
    ng "$LINENO"
fi

### テストケース2: 入力が4つの自然数でない場合
echo "テストケース2: 自然数の個数が4つでない"
out=$(echo "1 2 3" | ./ten_puzzle)
expected_output="4つの自然数を正確に入力してください。"
if [[ "$out" == *"$expected_output"* ]]; then
    echo "テストケース2成功"
else
    ng "$LINENO"
fi

### テストケース3: 入力が自然数でない場合（負の数）
echo "テストケース3: 自然数でない数字（負の数）"
out=$(echo "1 -2 3 4" | ./ten_puzzle)
expected_output="すべての入力は自然数でなければなりません。"
if [[ "$out" == *"$expected_output"* ]]; then
    echo "テストケース3成功"
else
    ng "$LINENO"
fi

### テストケース4: 入力が自然数でない場合（小数）
echo "テストケース4: 自然数でない数字（小数）"
out=$(echo "1.2 3.4 5 6" | ./ten_puzzle)
expected_output="無効な入力です。すべての入力は自然数でなければなりません。"
if [[ "$out" == *"$expected_output"* ]]; then
    echo "テストケース4成功"
else
    ng "$LINENO"
fi

### テストケース5: 無効な入力（文字列が含まれている）
echo "テストケース5: 数字でない文字が入力された場合"
out=$(echo "あ い う え" | ./ten_puzzle)
expected_output="無効な入力です。すべての入力は自然数でなければなりません。"
if [[ "$out" == *"$expected_output"* ]]; then
    echo "テストケース5成功"
else
    ng "$LINENO"
fi

# 結果確認
if [ "$res" = 0 ]; then
    echo "すべてのテストが成功しました。"
else
    echo "一部のテストが失敗しました。"
fi

exit $res
