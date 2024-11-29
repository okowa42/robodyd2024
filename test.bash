#!/bin/bash
# SPDX-FileCopyrightText: 2024 Akari Hirohara
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### ten_puzzleへのテスト ###

### テストケース1: 正常な入力（自然数で結果が10になる式がある場合）
out=$(echo "2 3 4 5" | ./ten_puzzle)
expected_output="((2 * 3) - 4) * 5 = 10"
if [[ "$out" == *"$expected_output"* ]]; then
    echo "0"
else
    ng "$LINENO"
fi

### テストケース2: 入力が4つの自然数でない場合
out=$(echo "1 2 3" | ./ten_puzzle)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### テストケース3: 入力が自然数でない場合（負の数）
out=$(echo "1 -2 3 4" | ./ten_puzzle)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### テストケース4: 入力が自然数でない場合（小数）
out=$(echo "1.2 3.4 5 6" | ./ten_puzzle)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### テストケース5: 無効な入力（文字列が含まれている）
out=$(echo "あ い う え" | ./ten_puzzle)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

# 結果確認
[ "$res" = 0 ] && echo OK
exit $res
