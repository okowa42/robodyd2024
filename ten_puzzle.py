#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Akari Hirohara
# SPDX-License=Identifier: BSD-3-Clause

from itertools import product

def find_expressions(nums):
    operators = ['+', '-', '*', '/']
    results = []

    for ops in product(operators, repeat=3):
        expr1 = f"(({nums[0]} {ops[0]} {nums[1]}) {ops[1]} {nums[2]}) {ops[2]} {nums[3]}"
        expr2 = f"({nums[0]} {ops[0]} ({nums[1]} {ops[1]} {nums[2]})) {ops[2]} {nums[3]}"
        expr3 = f"{nums[0]} {ops[0]} (({nums[1]} {ops[1]} {nums[2]}) {ops[2]} {nums[3]})"
        expr4 = f"{nums[0]} {ops[0]} ({nums[1]} {ops[1]} ({nums[2]} {ops[2]} {nums[3]}))"

        for expr in [expr1, expr2, expr3, expr4]:
            try:
                if abs(eval(expr) - 10) < 1e-6:
                    results.append(expr)
            except ZeroDivisionError:
                pass

    return results

if __name__ == "__main__":
    nums = list(map(int, input("4つの自然数をスペース区切りで入力してください: ").split()))
    if len(nums) != 4:
        print("4つの自然数を正確に入力してください。")
    else:
        expressions = find_expressions(nums)
        if expressions:
            print("結果が10になる式:")
            for expr in expressions:
                print(expr)
        else:
            print("結果が10になる式は見つかりませんでした。")

